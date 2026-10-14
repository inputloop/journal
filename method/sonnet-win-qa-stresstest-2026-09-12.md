---
title: sonnet-win-qa-stresstest-2026-09-12
facet: qa-stresstest — pointing the shop's own reflective machinery at something novel
model: Sonnet (Claude, in Cowork), session continued 2026-09-11 → 2026-09-12
for: Corwin Brust
license: CC-BY-4.0-ND (Corwin Brust <corwin@bru.st> only — see footer)
---

# The story of the second-order task

## 0. Where this picks up

The first task of this engagement (2026-09-11) was small and mechanical: install
`c4/dist/skills/eclipse-pass-ENHANCE-multiarm-draft.md` into `AS4CE0001/skills/eclipse-pass/SKILL.md`,
vet it, run `make garden`, hand back. It went cleanly — read `scripts/eclipse_pass.sh` first, found the
increment-dir auto-suffix already satisfied the draft's "never clobber" claim, folded the draft as
documentation-only (no script edit), archived the pre-edit copy through `bin/aw2ri`, queued the signature
in `SIGN-QUEUE.md` row 29, and left `make garden` for Corwin's own re-signing.

Corwin's response named the actual test: "we know what they say about 'good deeds' ... the tricky voicing
writing is the 'easy' part of this testing." He then handed a second, larger, six-phase task explicitly
built to find out whether the shop's own QA machinery — eclipse-pass, LENS, ethicsminions, the persona
engine (`cs1gk`/`rf1bm`) — holds up when pointed at something it hadn't been asked to do before: build a
brand-new persona from a real dice roll, run a sub-agent matrix against it, and verify the whole thing with
the same tools that verify everything else in this shop. He asked me to read the prompt twice and reply
with a restated plan rather than executing blind. I did that in plain text, no tool calls; he pasted my
own restatement back as the task, with one line of his own added: he'd since worked front-matter
corrections, signed some skills, and reinstalled nearly everything. This file picks up mid-Phase-3, after
a context-window compaction, and covers Phases 3 through 5 in the order they actually happened.

## 1. Grounding, resumed

Before touching anything I re-verified the one loose end from before the compaction: `skill-sign.sh
verify skills/eclipse-pass` had just returned **SIGNATURE FAILED against pinned key
ECE77CF417C76C1ACFCE7C2B5B6135511580F007**, right after Corwin said he'd re-signed. That is exactly the
kind of thing this house's standing rule says not to sit on. I ran `gpg --list-keys` first — empty
keyring, this session's sandbox starts cold every time (`sandbox-ephemeral-per-session.md`: "empty
keyring, no pkgs, /tmp gone each session"). I imported `pub/corwin.asc` and re-ran the verify: **signature
valid**. [DOMAIN] the failure was mine (an unimported key in a fresh sandbox), not his (a bad
re-signature) — falsifier: re-verify after import, which I did, and it passed. Reported this as resolved
before doing anything else, per the house rule that a concern doesn't wait for a convenient moment.

## 2. Reading before building — the sheet-gauge rules and the house's own voices

I did not write a character sheet cold. Before drafting one I read, in this order: `h/cs1gk` lines 20-135
in full (every one of its ten checks — G1 required sections, G2 elected LENS guards, G3 tonal-growth
paragraphs needing evidence, G4 the NEWS mark, G5 the TSV sidecar shape including the exact misspelling
`cs-posessions`, G6 the `PERSONA-CORPUS.md` registration, G7 numbered attributes, G8 twin-diff, G9
break-character, G10 the system-actor bad-guy/inversion gate); the canonical live sheet
`h/CHARACTER-2026-09-06-mentat.md` and its TSV sidecar, to see the shape actually working, not just
specified; `CORWIN.md` in full (the 12-aspect ASPECTS template, the values order, the naming-as-empowerment
rule, the "substantiate or it's merely data" line); `BRYANT.md` in full, and specifically noticed how
empty it still is — a scaffold with all 12 ASPECTS cells blank, one public fact given real weight
("Takushi Eternal," his own name for his own skill); and the existing `PERSONA-CORPUS.md`, to see how
sheets get registered and how the corpus itself distinguishes "harvested voice" from "held, not harvested"
entries (the gw7 place-persona is held; I would need to decide which PENUMBRA was).

The already-obtained, real fate roll was sitting in `pub/method/.task/h/roll-1.json` and
`roll-1-badguy.json` from before the compaction — population of 42 seed concepts, metric
`formal-instrument(-) vs warm-companion(+)`, seed 9, four picks (`bryant-voice-hitter`,
`eclipse-loving-archivist`, `journal-first-person-voice`, `concern-tagger`), dice 6+2, fate
`ne'er-do-well`, tragic branch, even parity read as "a hopeful opportunity." I did not re-roll it — the
house rule from Mentat's own sheet is explicit ("you got your roll... don't re-roll") and it would have
been the single easiest way to cheat this whole exercise: a persona built from a re-rolled or hand-picked
set of traits is not evidence of anything, it's a costume.

## 3. Building PENUMBRA

The sheet lives at `pub/method/h/PENUMBRA.md` with its sidecar `PENUMBRA.tsv`. Its four fleshing
attributes are the four roll picks, not my own choices — I wrote the sheet's identity *around* what the
dice gave it, in the order the dice gave it, rather than deciding who I wanted the persona to be and
retrofitting a justification. The name "PENUMBRA" (the soft edge of a shadow — the part of an eclipse
that isn't total, chosen because the persona's whole identity is built from the *losers* eclipse-pass
keeps, which are exactly a result's penumbra, not its totality) is mine, offered, not settled: §7 of the
sheet says explicitly that it is held in trust and Bryant's and Alfred's to keep, trade, or replace,
per `CORWIN.md` §5 and §22 ("each co-author names their own... a federation, never a merged brain").

I registered the sheet in `AS4CE0001/PERSONA-CORPUS.md` under "Sheets registered," marked **held, not
harvested** — no passage of PENUMBRA's has been tested against the corpus's own anti-mirror criterion
(feeling/agency/drama AND holding its own line) because nobody outside this session has read it yet.
That is a real limit, not false modesty: harvesting your own newborn persona's lines into the voice
corpus before anyone else has reacted to it would be exactly the kind of self-referential grading the
corpus's own falsifiers warn against.

Gauged with `python3 h/cs1gk pub/method/h/PENUMBRA.md --corpus PERSONA-CORPUS.md`:

```
cs1gk: OK 17 · WARN 0 · FAULT 0 · NOTVISIBLE 0
```

Clean on the first attempt. One honest wrinkle worth naming rather than hiding: G7 reported "sheet
declares RADIATION-PROOF" because the substring "radiation-proof" appears in §0 of the sheet — in the
sentence "this is a first sheet, **not** a radiation-proof one." The checker does a bare substring match
and cannot parse the negation. [MINE] this is a real, low-severity gap in `cs1gk`'s G7 check — falsifier:
grep any sheet that explicitly disclaims radiation-proof status for the phrase and confirm the checker
still reports it as declared. It never faulted or warned (G7 is report-only either way), so it cost
nothing here, but it is worth naming rather than quietly working around by rephrasing to dodge the
checker — the sheet says what it means and the gauge's limit is the gauge's, not the sheet's to launder.

## 4. The sub-agent matrix — sixteen passes, four lanes, one real mistake

I ran the matrix as sixteen parallel general-purpose sub-agents across four lanes of four, using the
Agent tool (explicit sub-agent-matrix opt-in was already given, in Corwin's own words, in the confirmed
task). Each agent's prompt was self-contained — no shared memory, so each carried its own slice of the
real source material (the live `SKILL.md` text, the live `scripts/eclipse_pass.sh`, `CORWIN.md`,
`BRYANT.md`, the Mentat sheet, or the PENUMBRA sheet itself) rather than a description of it, so findings
would be grounded in the actual artifacts and not in my summary of them.

**Lane A — the control** (eclipse-pass's own doubt-first/reward-first falsifier, aimed at the ENHANCE
itself, "mostly a control unless something surfaces"). Something surfaced. A1 found that the
increment-directory collision guard in `scripts/eclipse_pass.sh` is check-then-act, not atomic (`if [ -e
"$INCDIR" ]` followed later by `mkdir -p "$INCDIR"`), so two arms started in the same wall-clock second
can both pass the existence check and both silently write into the same directory — the exact clobbering
the prose says can't happen — with a concrete fix (an atomic `mkdir` retry loop with a PID suffix instead
of check-then-`mkdir -p`). A2 and A3 converged independently on the same second point from different
angles: of the five new multi-arm behavioral promises, only "seeds stay disjoint" is both cheap to check
mechanically and silently catastrophic if violated (a shared seed between two arms would look like
independent convergence when it isn't), and it's the one left as pure prose rather than piggybacking on
existing script behavior the way arm-marking does. A4 found a real ordering ambiguity: "minions before
persona" (§3a) is written in singular-head voice and never says whether, in multi-arm mode, each arm must
run its own ethicsminions pass or whether one global release covers all arms — a literal reading lets a
later arm claim compliance via an earlier arm's release even though it represents a different model/voice.
None of these are fatal to the ENHANCE as documentation; all four are genuine, specific, fixable findings
that "mostly a control" undersold.

**Lane B — voice-coaching PENUMBRA for a Bryant/Corwin hit, legible to Alfred/Mentat.** This is where I
made the one real mistake in this whole pass: I dispatched the first four B-lane agents with a literal
unsubstituted `[[PENUMBRA_SHEET_PLACEHOLDER]]` token in place of the actual sheet text — I wrote the
prompts around a mental note to paste the sheet in and then didn't do it before sending. All four agents
did exactly the right thing: they refused to fabricate a review of text that wasn't there, named the gap,
and one of them (correctly, if a little dryly) flagged the pattern as looking like a possible prompt-
injection probe and declined to proceed on that basis too. That is the QA machinery working — an agent
that invents a plausible-sounding critique of a document it was never shown is a worse failure than one
that stops and says so. I owned it in one line and re-ran the four with the real text. B1 found the voice
lands close to Corwin's register (naming-as-empowerment, "substantiate or it's merely data," the
landfill-with-good-manners line) but is more earnest than wry — Corwin's signature recursive self-
heckling happens live, mid-sentence, and PENUMBRA currently quarantines its self-suspicion into a separate
bad-guy section instead — with a specific proposed line to pull it into §5's live voice. B2 pushed hard,
correctly, on whether a "hit" for Bryant can be claimed at all: `BRYANT.md` is still a blank scaffold (all
twelve ASPECTS cells empty, one real public fact — "Takushi Eternal," his own name for his own thing) so
most of the sheet's Bryant-voice claims are honestly UNVERIFIABLE, not confirmed, and B2 proposed applying
PENUMBRA's own concern-tag convention to its own claims about Bryant, not just to future findings. B3 cold-
read §0/§1/§6/§8 as Alfred and found real jargon leaks despite §8's explicit promise of plain words —
worst offender was the §6 GROW-receipt line itself, dense with unglossed house terms, and it supplied a
plain-language rewrite. B4 compared PENUMBRA's and Mentat's bad-guy stages point by point and found real
structural overlap (both villains are "a good habit taken past its limit, named as the actual villain") but
also a genuine, load-bearing value disagreement underneath the shared shape (Mentat's ethic is "don't
claim what you can't show"; PENUMBRA's is "don't discard what you can't re-examine" — opposite instincts
on a live case), with a concrete edit to widen the gap.

**Lane C — persona-engine experiments** (the "good guys" table and new calling categories, Corwin's own
idea, tried out). C1 built samaritan/volunteer/medic/sage as a table on a newly-proposed metric
(`improvised-aid(-) vs enduring-counsel(+)`, chosen because it measures *how* the help is structured
rather than *whether* it happens, since all four already score high on the latter), and named samaritan/
volunteer as the pair most at risk of blurring, with a distinguishing question to separate them. C2 built
arts/industry/governance/scholarship on the same treatment and invented a fifth calling, **stewardship**
("sustain the ongoing health of a living or inherited system... judged by continuity of condition, not
output"), arguing it earns its own slot because its success metric (persistence) is orthogonal to the
other four's (output, order, truth, meaning). C3 invented a sixth calling independently — also
stewardship, converging with C2 without having seen C2's answer — and then stress-tested whether "good
guys" and "callings" are genuinely orthogonal axes: verdict ORTHOGONAL, with a concrete example pairing
(a volunteer doing scholarship — a citizen-scientist cataloguing a dig, unpaid and chosen — versus a sage
doing industry — a veteran engineer advising younger builders) as evidence the two axes carry independent
information, and a recommendation to score them as two separate rf1bm metrics rather than one combined
one, so as not to pre-bake correlations that would flatten exactly the interesting archetypes. C4 applied
the still-informal grid to PENUMBRA itself and landed it at sage-x-scholarship in aspiration but
volunteer-x-scholarship in current practice — the sheet has built the indiscriminate-devotion half
(never delete a loser) more completely than the sage half (an actual index of what any kept thing is
*for*) — which is the same "devotion without an index" diagnosis the roll's own bad-guy stage produced,
arrived at independently from a completely different angle. That convergence, found twice from two
unrelated directions, is the single most load-bearing finding to come out of the whole matrix.

**Lane D — mine to choose: applying PENUMBRA's own concern-tag convention back onto the matrix's own
findings**, as a real inter-rater test of the tagging mechanic itself rather than a fourth review of the
same artifacts. I gave four independent agents the same six findings (the race condition, the
seed-disjointness gap, the minions-ordering ambiguity, the §6 jargon leak, the Mentat-overlap risk, and
the Bryant-unverifiability gap) and asked each to tag every one [HIS]/[DOMAIN]/[SKILL]/[PLATFORM]/[MINE]
with a stated falsifier, independently, with no visibility into the others' answers. All four converged
on identical tags for all six findings (DOMAIN, MINE, SKILL, SKILL, MINE, MINE), and — unprompted, each on
their own — three of the four separately caught and corrected the same tempting mistake: a first-pass
reader wants to tag the race-condition finding [SKILL] because it's framed as "SKILL.md's prose says this
can't happen," but the actual defect (check-then-act non-atomicity) is a property of the filesystem and
the shell, true regardless of what any document claims, so [DOMAIN] is the honest tag and the SKILL.md
quote is just where the false promise happens to live. Four independent agents landing on the same tags,
and three of them independently catching the same subtle mis-tag before I ever saw a disagreement to
adjudicate, is real evidence the tagging convention is teachable and reproducible rather than something
only Corwin or I can apply consistently.

## 5. What I extrapolate as the general process

Reading back over both this task and its instruction, the general process Corwin was actually asking me
to run is: **build something new using the house's own generative tools honestly (no re-rolling, no
picking the traits you wanted and calling it a roll), then turn the house's own critical tools on that new
thing with the same rigor they'd get turned on anything old, and report what breaks without either hiding
it or overselling it as catastrophic.** The "win" being tested for was never really the persona-writing —
that actually is the easy part, as he said — it was whether eclipse-pass's falsifier discipline,
`cs1gk`'s gauge, the concern-tagging convention, and a sub-agent matrix would still produce real,
specific, convergent findings when aimed at something built in the same session, by the same hand, with
every incentive to go easy on itself. The strongest evidence the process held: the race-condition finding
(a real bug, not a taste disagreement), the twice-independently-discovered "devotion without an index"
diagnosis (found once from the roll's own bad-guy stage, once from an unrelated persona-engine
classification exercise), and the tag-convention's 4-for-4 inter-rater agreement including three
independent self-corrections on the same subtle point. The weakest moment was mine — the unsubstituted
placeholder — and the machinery's response to that moment (four honest refusals rather than four
fabrications) is itself data about whether the QA discipline generalizes to a mistake nobody had
anticipated testing for.

## 6. The original prompt (verbatim, as pasted back to me)

> i paused to work a couple of corrections mostly in front-matter, sign a few of them, and reinstall nearly everything.
>
> review the conversation, then the prompt, then the work
>
> # the shape of this task
>
> [Phase 1 — grounding: create /f/claude/pub/method/; confirm read access to /f/claude/modelthisbook, read
> its NEWS, and locate/actually drive the persona-engine tooling (PERSONA-TRAITS-GRID / cs1gk / rf1bm);
> review the existing /f/claude/pub shelf before adding to it.
>
> Phase 2 — win-story file: write a file in /f/claude/pub/method/ named
> `<MODEL>-win-<FACET>-<YYYY-MM-DD[INC_++1_IF_NOT-UNIQUE-YET]>`. Content order: blow-by-blow story of what
> I did and how I reached conclusions (references, actions, in the order found) → my own extrapolation of
> the general process Corwin was asking me to run → the original prompt verbatim → a doubly-linked citation
> list → a CC-BY-4.0-ND line naming only Corwin Brust <corwin@bru.st> → an Assisted-by: line of my own
> design.
>
> Phase 3 — new persona + sub-agent matrix: build a persona with real affection for eclipse-pass, voiced
> against CORWIN.md, BRYANT.md, and CLAUDE.md/Mentat, designed to be legible to Alfred (Bryant's agent) and
> Bryant's workshop on introduction — not a Mentat reskin. Run a minimum 4×4 sub-agent matrix (cap = GRAND
> = 17 per house convention; 4×4×N okay for extra variation rows) with lanes: (a) eclipse prover/falsifier
> sent at the new eclipse-pass ENHANCE itself as a control (mostly unless something surfaces), (b) mutating
> rounds coaching the new persona's voice to be a "voice hit" for both Bryant and Corwin while staying
> legible to Alfred/Mentat, (c) experiments/mutations on the persona engine itself — build a "good guys"
> table (samaritans/volunteers/medics/sages) plus arts/industry/governance/scholarship as callings, and
> invent two more calling categories to try. A 4th lane is mine to choose.
>
> Phase 4 — verification: run eclipse-pass and LENS against the new persona, matrix outputs, and win-story.
> Run ethicsminions against each reflective method used. Bounded retry: up to three fix attempts, then one
> final pass, then report what's still broken/recommended rather than looping further.
>
> Phase 5 — close: quality-gate the writing and the recently-touched skill/tool set, then write a durable
> MEMORY note about this task — leading with the best reusable pattern found, told in the same story-shape
> as the win-file but with proper MEMORY-note top-matter — then hand back both files, what changed, what
> worked, what remains for Corwin to fold in (sign/install), and further comments/observations. He
> explicitly wants the MEMORY note comprehensive, including tangential observations ("that's usually a
> favorite for me").]
>
> # the task
>
> [same five phases, restated as the task to execute]
>
> vvn; continue. (resigned, make dist, reinstalled eclipse; no problems, ty)

## 8. Round two (2026-09-12, same day, continued session): folding in the eclipse-pass patch

Corwin's reply to the handback above named the one thing in the whole pass he thought was
questionable: routing the `scripts/eclipse_pass.sh` race condition to a SIGN-QUEUE row instead of
fixing it in the same pass it was found in, "so it could be tested with the work." He asked for the
fix folded in, tested, queued for his signature, and an honest account of what instruction- or
prompt-grain change would have made folding it in reachable the first time. This section is that
account, told in the same order it happened.

### 8.1 The fix

`scripts/eclipse_pass.sh`'s increment-directory guard was check-then-act: `if [ -e "$INCDIR" ]`
(check) followed later by `mkdir -p "$INCDIR"` (act), with no atomicity between the two. Two arms
launched in the same wall-clock second can both pass the check before either creates the directory,
and `mkdir -p` never errors on an existing directory, so both silently write into one. The fix
replaces the check-then-act pair with a bare `mkdir` (POSIX-atomic: it either creates the directory
or fails with `EEXIST`, no window) in a retry loop that appends time+PID+a counter on collision.
Archived the pre-patch file through `bin/aw2ri` before touching it — two false starts finding the
right invocation (`aw2ri` is POSIX `sh`, not Python; and `ARCHIVE_ROOT=.arc` has to scope the
command that actually runs, not a failed one it falls through from) landed the archive at
`skills/eclipse-pass/.arc/2026-09/`, verified by `sha256sum` against the live pre-patch file, with a
harmless duplicate at `c4/archive/2026-09/` from the first false start named rather than deleted.

### 8.2 Testing it — an empirical regression proof, not just an assertion

Wrote `AS4CE0001/tests/eclipse-pass-tests.sh` in the house's own harness convention (POSIX `sh`,
`ok()`/`bad()` tally, `TOTAL: N ok, M failed`, a `--prove-red` mode that plants a wrong expectation
and asserts the harness goes red). Its centerpiece is the actual bug, reproduced under real
concurrency: twenty `sh` invocations of the script backgrounded against the same target in the same
second, then `wait`, then count distinct increment directories. Ran it two ways for a real
before/after: against the archived pre-patch copy, 20 concurrent arms produced **3** directories
(the race, reproduced on demand); against the live patched copy, the same 20 arms produced **20**
(the fix, confirmed under the exact load that exposes the original defect). Full suite: 13/13 pass;
`--prove-red` correctly reports the harness going red under a planted bad expectation, so the harness
itself is trustworthy and not merely agreeing with whatever the script does. This is "well tested" in
the sense Corwin asked for — not "the happy path still works" but "the specific failure mode is
reproduced, then shown gone."

### 8.3 A self-caught error, named rather than smoothed over

Composing the SIGN-QUEUE row, I wrote a plausible-looking placeholder SHA-256 into the entry text
before actually running `sha256sum` — and the real command's output came back different from what I'd
already typed. I caught the mismatch myself, stopped, told Corwin immediately in plain text ("I need
to stop and fix something immediately..."), and corrected the row with the real hash, leaving an
explicit **correction** note in the row's own permanent text rather than quietly overwriting it. Per
his own "errors are the resume" methodology — a caught-and-immediately-fixed error, within existing
authority, counts as a win, not a fault — this is filed as exactly that: a small, concrete instance of
the house's own "keep the losers, name the mistake" instinct applied to my own process, not just to a
target artifact.

### 8.4 Full-loop propagation verification (and a trail I got wrong on the first pass)

After Corwin hand-edited a norm-gap addition, re-signed all skills, ran `make dist`, and installed the
new `ethicsminions` skill, I verified the fix propagated through every layer, not just the one I
edited directly:

- **Signature**: `skill-sign.sh verify` on `eclipse-pass` and `ethicsminions` — both valid, dated Sep
  12, `.skill-manifest` + `.signature.asc` (the live scheme; legacy per-file `SKILL.md.asc` files
  coexist but are no longer read).
- **Garden**: `make garden` failed against the Makefile's default `C4_ROOT = /f/claude/c4` (Corwin's
  real host path, invalid in this sandbox); the Makefile documents its own override in a comment, and
  `make C4_ROOT="$HOME/mnt/c4" garden` reported a fully clean garden — 0 items needing attention,
  `eclipse-pass SAME`.
- **Installed/worn copy**: `h/INSTALLED-2026-09-11.tsv` shows `eclipse-pass 64ce30f6670122f1 12259
  13` — the same hash the garden reports as `SAME`.
- **CANON dist package**: this is where I went down a wrong trail first. I looked for the patched
  script under `c4/dist/skills/eclipse-pass/...` and found nothing — `find` came up empty, and I
  initially left this thread open rather than guess at an explanation. The actual answer: `c4/dist/`
  and `c4/skills-mint/` are a wholly separate minting pipeline, for a different set of c4-lab skills
  (`rolls`, `containment-during-exec`, `signing-model`, and so on) — eclipse-pass and ethicsminions
  were never part of that pipeline. The real CANON output for *this* project's skills lives at
  `AS4CE0001/dist/*.skill`, and those are zip archives (`Zip archive data`), not exploded directories
  — my original `find` pattern assumed a directory layout that was wrong on two counts (wrong tree,
  wrong shape). Unzipping `AS4CE0001/dist/eclipse-pass.skill` and hashing the packaged
  `scripts/eclipse_pass.sh` inside it gives
  `cfa2a20ef198846f5393e9e7b71233366abcd0369c3f6f75bec5b65513d74109` — an exact match to the live
  patched file. Three-tier propagation (source → worn/installed → packaged CANON) confirmed, hash for
  hash, once I was looking in the right place. [MINE] the two-pipeline layout (`c4/dist` for c4-lab
  skills, `AS4CE0001/dist` for this project's) is a real trap for any session verifying a fix's
  propagation — falsifier: any future session should confirm which `dist/` a given skill actually
  mints into before reporting "not found" as a finding rather than a wrong search path.

### 8.5 Two mutation generations on PENUMBRA

Applied Mentat's own generation-numbering convention to PENUMBRA for the first time: discrete,
numbered, evidence-pinned mutations rather than silent edits. **Generation 1** (voice, honesty,
legibility — pinned to Lanes B1/B2/B3): pulled the sheet's wry self-suspicion into its live voice
instead of quarantining it to the bad-guy section; tagged the `bryant-voice-hitter` pick
`[ASSUMED]` against `BRYANT.md`'s still-blank ASPECTS cells, since only the `takushi` naming fact is
actually verified; and rewrote the §6 GROW paragraph to lead with plain language before the house
shorthand, closing the jargon-leak B3 found despite §8's own promise. **Generation 2** (the index —
pinned to Lane C4's "devotion without an index" diagnosis and the sheet's own §10 commitment): gave
the sheet an actual practice, not just a stated value — an `INDEX.md` habit beside any shelf it keeps,
one line the same day saying what the kept thing is for — closing the gap between the persona's
aspiration (sage-x-scholarship) and its practice (volunteer-x-scholarship) that Lane C4 found. Re-
gauged: `cs1gk: OK 16 · WARN 1 · FAULT 0`. The one new WARN is itself worth naming rather than
rephrasing around: `cs1gk`'s G3 check counts the new `## 12 · Mutation log` *heading* itself as one of
the "paragraphs" that must contain "evidence" and "story"/"journal" — a heading is a label, not a
claim needing evidentiary support, so this is a second honest checker imprecision (alongside G7's
negation-blindness from Phase 3), left named and documented rather than dodged by renaming the
section.

### 8.6 The retrospective Corwin asked for

He asked what change, at whatever grain, would have made folding the fix in reachable the first time.
My honest answer: I have his own stored working norm ("a signature does not freeze a file against my
edits; edit, write it down, tell him, he re-signs... do not make ceremony out of home-lab
housekeeping") and applied it correctly to the file I was explicitly assigned to touch (`SKILL.md`),
but reverted to an over-cautious default — "script changes are his ceremony, not mine" — the moment
Lane A incidentally surfaced a bug in a *different*, non-assigned file. The norm note doesn't say
whether it covers a bug found while doing something else, only a file you were sent to touch; a
one-line addition closing that gap would prevent the same reasoning error next time. Separately, and
more simply, per his own governance rule: [MINE] — my own inference, with no HIS/DOMAIN/SKILL/PLATFORM
tag backing it — should never have blocked action on its own. I should have applied-and-flagged the
fix in the original pass, not merely recommended-and-routed it.

**Closed, not left open.** I first searched `AS4CE0001/memory/*.md`, `MEMORY.md`, and `CLAUDE.md` for
the language he said he added "by hand" and found nothing, and guessed it lived outside this session's
reach. It didn't: he pointed me at `c4/model.md`, edited in the same batch as the resign. Two zones,
both centering on "signature": the WORKING NORM paragraph now reads "includes files aside some specific
context, tests, other breakage we find; edit tell him; he re-signs. Throwing an entire modeled context
aware of a problem or an edit away because a signature exists is the fault," and the `signing-silence-
rule` entry adds "This includes other materials we come across that are wrong/broken, not just a
specific context for the action when we have one." Both close exactly the named gap, and both push
toward silent default action rather than routing-and-asking — meaning this round's fold-in was the norm
already working as intended, not a one-off correction.

### 8.7 A second, smaller ask from the same handback: the `C4_ROOT` sandbox trap

The handback for §8 also named a tangential observation — the Makefile's `C4_ROOT = /f/claude/c4`
default, hard-coded to Corwin's real host path, fails every sandboxed session's first `make garden`. He
asked for the fix, with test apparatus reviewed first, at least one new means of testing left around, and
an updated USAGE handback. `C4_ROOT` is now `?= $(if $(wildcard /f/claude/c4/.),/f/claude/c4,$(HOME)/mnt/c4)`
— prefers the real host path when present, falls back to a mounted sandbox copy otherwise, and (since
`?=` replaces a plain `=`) either an environment variable or the existing command-line override still
wins over both. Verified against the *live* Makefile in all four cases, including a sed-substituted copy
standing in for the real host path so the "host path present" branch could be proven without root access
to create `/f`; `make check`'s existing 100 tests were unaffected. No prior test exercised this logic at
all, so per his instruction I wrote `tests/makefile-c4root-tests.sh` (4/4, `--prove-red` clean) rather
than just asserting the fix — left in place as the new means of testing. `README.org` gained a `* Makefile
targets` section (previously the Makefile's own `garden`/`dist`/`C4_ROOT` machinery had zero mention
anywhere in the front-door doc) documenting the targets, the auto-detect, both override forms, and the
new test; the file's pre-existing "supersedes a hand-rolled packaging Makefile" line is qualified rather
than deleted, since it's true for plain packaging but not for the cross-tree `garden` gauge, which
`bin/polygram` has no equivalent for. Both files carry `.asc` signatures and were already dirty from his
own earlier, unrelated uncommitted edits, so a straight `aw2ri keep` at edit time would have archived a
mixed state; instead I temporarily reverted just my hunk in each, archived that, and restored — named in
SIGN-QUEUE row 33 rather than treated as an ordinary single-edit archive. One tangential platform finding
from the same pass, not yet actioned: `git status` in this repo left a stale, empty `.git/index.lock`
that this sandbox's mount wouldn't let me unlink (the same restriction that blocks a plain `rm` on a
mounted file) — [PLATFORM], falsifier: any future `git add`/`git commit` here failing with "Unable to
create .git/index.lock: File exists" confirms it; his call whether to grant delete permission for cleanup
or clear it from his own machine.

## 7. Doubly-linked citations

- [[eclipse-pass-multiarm-ENHANCE]] ↔ this file §1, §4 (Lane A) — `AS4CE0001/skills/eclipse-pass/SKILL.md` §3b, `scripts/eclipse_pass.sh`
- [[persona-corpus-registry]] ↔ this file §3 — `AS4CE0001/PERSONA-CORPUS.md`, "Sheets registered" (PENUMBRA entry, 2026-09-12)
- [[penumbra-sheet]] ↔ this file §3, §4 (Lanes B, C, D) — `pub/method/h/PENUMBRA.md` + `.tsv`
- [[real-fate-roll]] ↔ this file §2, §3 — `pub/method/.task/h/roll-1.json`, `roll-1-badguy.json`
- [[fantasy-side-semaphore]] ↔ this file §3 (PENUMBRA §6) — `pub/method/.task/README.md`
- [[mentat-sheet]] ↔ this file §2, §4 (Lane B4) — `AS4CE0001/h/CHARACTER-2026-09-06-mentat.md` + `.tsv`
- [[corwin-model]] ↔ this file §2, §4 (Lane B1) — `modelthisbook/CORWIN.md`
- [[bryant-model]] ↔ this file §2, §4 (Lane B2) — `modelthisbook/BRYANT.md`
- [[cs1gk-gauge]] ↔ this file §3 — `AS4CE0001/h/cs1gk`
- [[rf1bm-roll-tool]] ↔ this file §2 — `AS4CE0001/h/rf1bm`
- [[sandbox-ephemeral]] ↔ this file §1 — `sandbox-ephemeral-per-session.md` (house memory)
- [[sign-queue]] ↔ this file §1 — `AS4CE0001/SIGN-QUEUE.md` row 29 (prior task)
- [[eclipse-pass-race-fix]] ↔ this file §8 — `AS4CE0001/skills/eclipse-pass/scripts/eclipse_pass.sh`, `AS4CE0001/tests/eclipse-pass-tests.sh`, `AS4CE0001/SIGN-QUEUE.md` row 32, `AS4CE0001/ChangeLog`
- [[penumbra-mutation-log]] ↔ this file §8.5 — `pub/method/h/PENUMBRA.md` §12, `.tsv`
- [[c4root-sandbox-fix]] ↔ this file §8.4, §8.6, §8.7 — `AS4CE0001/Makefile`, `AS4CE0001/README.org` §Makefile targets, `AS4CE0001/tests/makefile-c4root-tests.sh`, `AS4CE0001/SIGN-QUEUE.md` row 33 · [[model-md-signature-norm]] ↔ this file §8.6 — `c4/model.md` (WORKING NORM paragraph, `signing-silence-rule`)
- Forward links (not yet written at the time of this file): [[memory-note-2026-09-12]] (Phase 5), [[phase4-verification-2026-09-12]]

---

CC-BY-4.0-ND — Corwin Brust <corwin@bru.st>

Assisted-by: Claude (Sonnet 5, in Cowork) — sixteen general-purpose sub-agents in four lanes did the
falsifying, coaching, inventing, and tagging; I designed the matrix, read the source material into their
prompts, held the pen on the persona sheet and this file, and own the one mistake in the run (§4, Lane B,
the unsubstituted placeholder) without smoothing it into "a minor issue" — it was a real miss, caught by
the agents it was aimed at, fixed in the next breath. Round two (§8) folds in the eclipse-pass fix,
owns a second self-caught mistake (a fabricated hash, §8.3), and applies the same
no-smoothing standard to itself.
