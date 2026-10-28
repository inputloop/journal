# Windows CI back to daily driver — the threads

*2026-10-26. For Corwin, from the session that closed bug#82101. Repository: G:\emacs-local-ci
(git.sr.ht:~mplscorwin/emacs-local-ci). Everything below marked BUILT is in the working tree,
uncommitted, with a backup of each changed file beside it (`*-before-*`).*

The question: what's outstanding, or should be, to get the regular Windows CI back into daily use
and make tree-sitter, no-AOT, 32-bit and general coverage across the top two branches (master = 32,
emacs-31) more robust.

## Where it stands, in one paragraph

The build itself is healthy: on 2026-10-24 master built clean on both MINGW64 and UCRT64. What's weak
is everything *around* the build: the loop that decides when to build, the checks that say whether a
build is good, and the side jobs (tree-sitter grammars, extra lanes). Several of those checks
couldn't fail: the tree-sitter job reported failed grammars as OK, the UCRT64 feature test never
ran, and the warning count was "NOT OK" on every build. A signal that is always green, or always
red, carries no information. Most of today's work was making those signals able to say no, with
tests that prove they can.

## Threads

### 1. Before the first daily run (blockers)
- **Stale lock.** Saturday's Ctrl-C may have left `G:\.crude-ci.lock` behind. The old crude-ci never
  removed it on interrupt, and a stale lock makes every shell wait "Build in process" forever.
  *Check:* is `G:\.crude-ci.lock` there? If nothing is building, remove it. The new crude-ci prints
  any lock it finds at start, says who holds it, and releases its own on Ctrl-C.
- **The revision service is broken.** `https://test.comic.chat/last-rev.pl` returns its Perl source
  instead of running it. BUILT: crude-ci now notices (anything that isn't a 40-hex revision) and asks
  `git ls-remote origin` instead. *Untested on avalon* (origin is SSH; the key lives there). The
  server-side CGI still wants fixing.
- **Review and commit.** Changed: build-dist.sh, crude-ci.sh, build-tree-sitter.sh (now LF line
  endings; it was committed as CRLF), check-feature.pl, check-unidata.sh. New: t/ (three tests +
  fixtures), test-build-dist-plan.sh. *First thing on avalon:* run the tests below in the MSYS2
  shell; they've only run on Linux so far.

      bash t/test-crude-ci.sh && bash t/test-crude-ci.sh --prove-red
      bash t/test-build-tree-sitter.sh && bash t/test-build-tree-sitter.sh --prove-red
      perl t/test-check-unidata.pl && perl t/test-check-unidata.pl --prove-red
      bash test-build-dist-plan.sh /g/log/emacs-32-d0312e-2026-10-24-0749.log

### 2. Tree-sitter grammars (the "TS" lane)
- BUILT, proven: **failed grammars were reported OK.** Every `cmd | tee log` was followed by
  `RC=$?`, which is tee's status (always 0). So a failed `git pull`, compile or link counted as a
  success, the DLL was announced "OK", and the FAIL branch couldn't run. Fixed with
  `RC=${PIPESTATUS[0]}`. Three smaller bugs fixed too:
  - `build=` was a typo for `built=`, so failures never triggered the re-upload.
  - The DLL existence test looked in the wrong folder, so the prior log was never restored.
  - A fresh clone reported the *previous* grammar's revision.

  `t/test-build-tree-sitter.sh` runs the script against two local grammar repos, one of which can't
  compile. On the old script it shows the bug (both "OK", revision blank); on the new one it passes.
- BUILT (later the same morning): **does Emacs load the grammar?** `check-ts-grammars.el`, run by
  the Emacs under test: `emacs -Q --batch -l check-ts-grammars.el DIR`, prints `ts_load N .. M OK`
  or NOT OK, and the reason per grammar. Proven in the workspace with Emacs 29.3 and a real
  tree-sitter-json: the grammar as built loads (ABI 14); the same grammar compiled one ABI past the
  library fails with `(version-mismatch 15)`. That's the failure the grammar job couldn't see. A
  non-library and an empty folder fail too. crude-ci now runs it after every lane with *that lane's*
  new Emacs over `ts/upload`, which answers the UCRT64 question below by measurement.
  Test: `t/test-check-ts-grammars.sh` (needs `EMACS=` and the grammar clone in `/g/ts/git`).
- OPEN [your call]: grammars are built only in the MINGW64 shell and shipped to both toolchains'
  users. Is that intended for UCRT64? (The load test above would answer it empirically.)
- OPEN, small: tree-sitter-yaml is commented out of the list; the signing loop uses `$GPG_PPF`
  without checking it's set (the summing step below does check).

### 3. No-AOT (no native compilation)
- BUILT: build-dist takes `NATIVE_COMP=aot|yes|no` and names the lane (`emacs-32-nojit-<rev>`).
  crude-ci takes `NATIVE_COMPS="aot no"` and builds both lanes for each branch. A lane builds when
  its branch head has no log yet *for that lane*, so the second lane still builds after the first
  has pulled. One pull, two builds, each health check given that lane's own log and install
  folder: 15 checks in t/test-crude-ci.sh.
- OPEN [your call], and it matters for users: **which build is "latest" on corwin.bru.st?**
  update-sym-links.sh calls the newest folder in `emacs-32/` "latest", so a no-AOT lane uploading
  into the same folder would take over "latest" whenever it finishes last. Options:
  - (a) no-AOT uploads to its own folder (`emacs-nojit-32/`), and "latest" stays AOT;
  - (b) no-AOT becomes the default "latest", given the antivirus history (31.1_1 already shipped
    without native compilation);
  - (c) keep no-AOT as a test lane only (`VARIANT=` turns upload off).
- OPEN: the no-AOT lane may want its own deps zip (G:\deps has an "after-removing-GCCJIT" one).
  DEPS is still chosen per toolchain only.

### 4. 32-bit (x32 / i686 / MINGW32)
- BUILT: under MSYSTEM=MINGW32, build-dist and crude-ci find the existing trees and files
  (`emacs-32-i686`, `emacs-32-i686-deps.zip`), names come out `emacs-32-i686-<rev>`, and the
  tree-sitter job stays off.
- OPEN [your call], first: **is 32-bit worth a lane?** MSYS2 stopped new 32-bit MINGW packages in
  December 2023 unless needed, drops 32-bit packages without users, and the community-maintained
  32-bit repo stopped updating in November 2025. The dependency set (gnutls, harfbuzz, librsvg …)
  may thin out under the build ([MSYS2: Windows support](https://www.msys2.org/docs/windows_support/)).
  If yes, the cheap safeguard is a weekly lane with `VARIANT=` (no upload) that tells us when it breaks.

### 5. The top two branches
- BUILT: `BRANCHES="32 31"` and `MASTER_MV=32` replace the hard-coded list and the master check,
  which compared names with `-eq` (arithmetic). It happened to work, but it was fragile. When 31 ships
  and master becomes 33, those two settings are the only edit.
- OBSERVED: G:\git\emacs-31 was last touched 2026-10-01, so the 31 lane hasn't built in weeks.
  Consistent with the CI not running daily.

### 6. Health signals people can believe
- BUILT: `check-feature.pl` said "no binary?" for a missing build. crude-ci keeps only lines
  containing "NOT", so a missing build read as healthy. It now says "NOT OK". And crude-ci now asks
  build-dist for the real install name: UCRT64 installs as `emacs-32-ucrt-<rev>` but crude-ci was
  asking for `emacs-ucrt-32-<rev>`, so **the UCRT64 feature test has never run.**
- BUILT (later the same morning): **new warnings, not all warnings.** `check-warn-new.pl` compares
  each build with the last *complete* build of its own lane (one that dumped emacs.pdmp and said
  "build complete": a run that stopped early, or found the work already done, isn't a fair
  baseline). Line and column numbers and paths are dropped first, so a warning that only moved
  isn't new; NSIS echoing its own script is ignored. On the real logs it reports exactly one new
  warning since July, the same on both toolchains: `configure: WARNING: texinfo.tex/texindex
  versions suggest that indexing is locale dependent…`. Something changed in both environments
  (an MSYS2 texinfo update, or a new configure check); worth a look. crude-ci uses it in place of
  check-log.sh as the health signal; check-log.sh stays for counts. Test:
  `t/test-check-warn-new.sh` (9 checks, including two bugs it caught in the checker on the way:
  a Perl `$_` clobber and a baseline newer than the log).
- OPEN: crude-ci's IRC report is switched off (`if false`). Once the two signals above can be
  trusted, it's worth turning back on.

### 7. One program instead of two shells (the orchestrator)
- Design in H:\tech-arch-org-model-t1\emacs-windows-build-matrix\model.md (lanes, a plain-text
  event stream, then the display).
- The lock is now atomic, so two shells started together can't both build. The careful start-up
  delay shouldn't be needed any more. *Verify on avalon* before relying on it.
- Next step: `MSYSTEM=UCRT64 bash -lc '…'` from one shell, to check PATH and `gcc -dumpmachine`.
  If that holds, one crude-ci can drive all lanes.

### 8. Smaller, known
- build-dist: the installer is rebuilt even when it exists (`[[ $MAKE_SE ]]` is true for
  `MAKE_SE=0`). Fix only if that isn't relied on [your call].
- build-dist: the sign log goes to `$TO/lop/` (typo); the "build complete" URL and the
  update-sym-links path ignore the toolchain.

## How the shell skills held up

Used throughout: `posix` (review loop + `tool.py`) and `posix-gotchas` (`sh1ck`).

- **Both proved themselves first.** `sh1ck --prove-red` and `tool.py`'s `tests.sh --prove-red`
  both went red on their planted bugs. So their silence means something, and that's the right
  foundation.
- **`tool.py` found the CRLF in build-tree-sitter.sh**, with a `bash -n` failure the script owes
  entirely to CR characters. A real catch that nothing else had flagged.
- **`sh1ck` missed the most damaging bug of the day.** The `cmd | tee log; RC=$?` shape broke
  three spots in build-tree-sitter.sh, and its PIPE-STATUS check only looks for a pipeline consumed
  by `if`/`while`. A planted one-liner confirmed the gap. Proposed TEE-STATUS check: a line ending
  in `| tee …` followed by a use of `$?`.
- **`sh1ck` PIPE-STATUS: 5 hits across the repo, all false positives.** Each is a pipeline inside
  `$( … )` within an `if`/`[[ ]]`, where the pipeline's own status isn't what's tested. The skill's
  own rule applies: a checker that cries wolf teaches the reader to skim it.
- **`tool.py`'s set -e/-u NOTE fired on all 9 files.** This repo is warn-don't-die by design, so
  once per repository would do.
- **Both are POSIX-sh-shaped, and every CI script here is `#!/usr/bin/bash`.** The fix bash offers,
  `PIPESTATUS` or `pipefail`, isn't mentioned. One line in each skill would help.
- **The review loop paid off where the tools didn't.** Its rule that a test must be able to go red
  caught two things in my own work:
  - a crude-ci harness whose `DRY=1` had become a command name, so two of its PASSes were vacuous;
  - in check-unidata.sh, the all-NUL rule is implied by the header rule, so a mutation could only
    change the diagnosis label. The cross-check now asserts the label too.
- **The gotchas ledger matched reality.** I tripped GREP-C-ZERO in an ad-hoc command today
  (`grep -c` exits 1 on zero matches). Harmless there, exactly as documented.

Proposed skill changes are in AS4CE: `advice/ENHANCE-20261026-shell-skills-on-the-ci.md`.

## Decisions for you, in order

1. Is the stale lock there? Remove it if so, then run the four test commands on avalon.
2. Commit today's changes (or tell me what to change first).
3. No-AOT and "latest": (a) own folder, (b) make it latest, or (c) test lane only?
4. 32-bit: a weekly no-upload lane, or let it go?
5. (Done the same morning: the new-warnings check and the grammar load test. Uncommitted, ready.)
