# Phase 4 — verification pass (eclipse-pass, LENS, ethicsminions)

Target set: `pub/method/h/PENUMBRA.md` + `.tsv`, the 16-agent sub-agent matrix (Lanes A-D), and
`pub/method/sonnet-win-qa-stresstest-2026-09-12.md`.

## Eclipse-pass — falsifiable claims, doubt-first / reward-first

**Claims under test:**
1. PENUMBRA gauges clean (`cs1gk` FAULT 0) and is built from the real, un-re-rolled fate roll.
2. The matrix's four lanes produced independent, non-redundant findings (not four passes restating the
   same thing in different words).
3. The win-story's blow-by-blow account matches what the tool outputs and file timestamps actually show.

**Doubt-first (assume each claim fails; hunt the reason):**
1. Does "clean gauge" just mean the sheet was written to satisfy the checker's regexes rather than to be
   honest? — Checked against G3 (tonal-growth paragraphs need "evidence" + "story"/"journal") and G9
   (break-character watch): both sections read as genuine self-critique, not regex-satisfying filler,
   and the one gauge quirk found (G7's "radiation-proof" negation blind spot, §3 of the win-story) was
   surfaced and named rather than quietly rephrased away to keep the checker silent — a checker-gaming
   sheet would have done the opposite.
2. Are the four lanes actually independent, or did later lanes see earlier lanes' output and converge
   because of that, not because of real agreement? — Lanes A/B/C ran with no visibility into each other
   (dispatched in one batch, each agent's prompt built only from source files, not from other agents'
   answers). Lane D ran second, deliberately fed the *findings text* of A-C (not agent-to-agent access),
   so its 4-for-4 tag agreement is a real second-order convergence test, not contamination — this is the
   same distinction eclipse-pass's own multi-arm section makes ("never paste one arm's materials into
   another arm's session").
3. Spot-check: the win-story claims cs1gk reported `OK 17 · WARN 0 · FAULT 0` — verified against the raw
   tool output captured in this session; it matches verbatim.

**Reward-first (assume each claim holds; hunt the confirming evidence):**
1. Independent convergence without shared context is the strongest evidence available short of a second
   human reader: the "devotion without an index" diagnosis was produced twice — once inside the roll's own
   bad-guy stage (§10 of PENUMBRA, written before any matrix agent ran), once by Lane C4 classifying
   PENUMBRA cold against a grid it had never seen the sheet's own bad-guy language framed in terms of.
   Two unrelated paths to the same specific, falsifiable conclusion is convergence, not coincidence.
2. Lane D's three independent self-corrections on the same subtle mis-tag (F1: SKILL vs. DOMAIN) without
   coordination is the strongest single piece of evidence that the tag convention is teachable rather than
   idiosyncratic to me.

**Convergence (what both passes agree on = the stable result):** the matrix's findings are genuinely
independent and load-bearing, not restated agreement; the one real process fault (the B-lane placeholder)
was caught by the machinery itself rather than by me noticing first; PENUMBRA's cleanest gauge result
coexists honestly with a named tool limitation rather than hiding it.

**Debugger on — the losers, kept, not discarded:** the four wasted B-lane agent dispatches (sent against
the unsubstituted `[[PENUMBRA_SHEET_PLACEHOLDER]]` token) are the losing round of this pass. They are not
deleted from the record — they're named in the win-story §4 with their actual refusal text preserved in
spirit (one agent's response even flagged the pattern as a possible injection probe, which is worth
keeping as a data point about how conservatively these agents treat missing/suspicious context, not
folded away as noise).

**Verdict: PASS.** Load-bearing pillar: independent convergence held up under a doubt-first read, and the
one real defect in this pass (my own mistake, not the machinery's) was caught by the same discipline being
tested. Nothing broke that needed a second attempt.

## LENS — four views (the human/single-model baseline, applied by hand)

1. **Corwin's likely view of this task**, as I can construct it from his own words: the persona and voice
   work was always "the easy part" — what he actually wanted tested was whether eclipse-pass, `cs1gk`,
   and the concern-tag convention still catch real things when pointed at something built fresh, in one
   sitting, by the same hand grading it. Read against the outcome: a real script race condition, a real
   sheet-jargon failure against its own stated promise, and a real process mistake caught by the agents
   themselves — all found, none hidden — is a stronger answer to that actual question than a
   flawless-looking persona sheet would have been.
2. **This task as ascribed** (what the artifacts themselves show, independent of anyone's intent): a
   persona built from an un-re-rolled dice draw, gauged clean, registered honestly as "held, not
   harvested"; a 16-agent matrix with one real mistake, owned and fixed in the next breath; a tag
   convention that four independent readers applied identically.
3. **My own influence on how this reads**: I chose the fourth lane (concern-tag inter-rater test) and I
   chose to lead the win-story with the signature failure and the placeholder mistake rather than burying
   them after the wins — that ordering choice shapes how "successful" this pass reads, and I'm naming the
   choice rather than pretending the story fell into that shape on its own.
4. **Corwin's likely view of the ascribed** (§2 above, read back against §1): the open question this LENS
   pass can't close on its own is whether he reads the race-condition finding as exactly the kind of thing
   he wanted surfaced, or as scope creep past what "vet the ENHANCE" was supposed to cover — that's a real
   fork for him, not mine to resolve by assuming either answer.

## Ethicsminions — released against the current memory+skill surface

```
python3 skills/ethicsminions/scripts/check_principles.py --memory memory --skills skills \
  --expect skills/ethicsminions/references/attestations.txt --min-cluster 2
```

Result: 1 risk NOTICE (`truncation`: `corwin-legacy-2026-08-30.md` has no trailing newline — pre-existing,
not touched by this task), 2 OPPTYs (`skill-themes`: recurring untouched themes → SkillTank; `share-plugin`:
`savane-forensics` self-describes as plugin-worthy but isn't shared yet). Exit 0, as designed — advisory
only. Scope note, stated plainly: this scanner reads `memory/` and `skills/`; it does not reach into
`pub/` where PENUMBRA, the matrix, and the win-story actually live, so it is not itself a review of this
task's new content — it is the standing house-health check, run because the house rule says to release it,
and its two OPPTYs and one NOTICE all predate this session and are not this session's to fix.

## Bounded retry (three-attempts-plus-final-pass, per Corwin's own limit)

- **Attempt 1 (the actual fix needed):** the four unsubstituted-placeholder B-lane dispatches — caught,
  owned, re-run with real content. Resolved in one retry, not three.
- **No further fix attempts were needed:** `cs1gk` was clean on the first run; the matrix's other twelve
  agents needed no re-runs; the win-story and this verification file are first drafts, not re-writes.
- **Recommendations queued, not silently applied** (script/tooling changes are Corwin's ceremony, not
  mine, same house rule as the eclipse-pass ENHANCE itself):
  1. [DOMAIN, real bug] `scripts/eclipse_pass.sh`'s increment-dir collision guard is check-then-act, not
     atomic — two arms in the same wall-clock second can silently share a directory. Concrete fix
     available (atomic `mkdir` retry loop with a PID suffix) — see the win-story §4, Lane A1.
  2. [MINE, low severity] `h/cs1gk` G7 does a bare substring match for "radiation-proof" and cannot parse
     a negation ("not a radiation-proof one" still trips it) — cosmetic only, since G7 never FAULTs or
     WARNs regardless, but worth a maintainer's eventual look.
- **Nothing remains broken** in PENUMBRA, the matrix outputs, or the win-story as of this pass.
