# Where did it all go

*Journal: 2026-10-11. The record behind four tools written that day: `bin/pa1th`, `bin/sh4lf`,
`bin/vo1ce` and `bin/ac1ct` in `/f/claude/c4`.*

*Drafted by the instrument (a session of Claude on Cowork, linked to Avalon). Unsigned until the
keeper's pen; the shelf's `.gate` is untouched, so this file defaults to SIGN. Prose CC BY-SA 4.0.
This post is also the pilot of a move: the story that had crept into these tools' header comments
now lives here, and the headers point here.*

---

Three things went missing, and nothing announced any of them.

**The path spelling.** For months every path he read came in his spelling, `/f/claude/...`. Nobody
decided otherwise. The sessions moved off Avalon's MSYS2 shell, the pin that `path-lint.sh` cites
(`PATH-DIALECT.md`) had never been committed, and nothing ever ran the lint. The rule had lived in
the environment, so it left when the environment changed. The fix is data, `r/dialect`, which
`bin/pa1th` reads to rewrite any spelling back to his.

**The story in the code.** He noticed that the programs' comments read like a blog about him: who
asked, what he ruled, why he needed it. `bin/vo1ce` counts this rather than judging it. Across 212
tools there are 7858 header lines: 493 are story, 1358 are manual, and the rest are neither. The
GNU baseline for a header is a line saying what the program is, its usage, and its terms. The story
is worth keeping, but it belongs in a journal like this one, where it can be dated, argued with and
signed. The headers of `sh4lf` keep their manual and now point here.

**The account of the session itself.** Features went quietly unused: of 208 skills offered to the
session, one was loaded. One subagent ran ("Review /h/ta turn-2026-09-30", 27 tool calls), and its
work had been folded into the main count. `bin/ac1ct` now reads a session's own transcript and says,
after the fact:

- the skills offered and the ones loaded,
- the tools and tool servers called,
- each subagent apart, with why it ran,
- the errors, grouped by kind so a repeating failure is one line with a count.

Before this session was compacted, the main thread made 432 tool calls, 276 of them to the device.
Its 34 errors fell into 28 kinds. The commonest was five 170-second timeouts on the device shell;
the rest were mostly ordinary shell exits, each with its own cause.

Then the accountant found its own instance of the problem. The compaction rewrote the transcript,
and the 432 calls are no longer in the file. Run again afterwards, it counted 13. A count that small
looks complete, which is worse than no count at all. So `ac1ct` now notices the compaction marker
and says the numbers are a floor (planted case P8). The figures above survive only because they were
written down before the cut. That is also the argument for this shelf.

## What is proven, and how

Each tool carries planted cases that must be caught, run with `--prove-red`: pa1th 6/6, sh4lf 8/8,
vo1ce 6/6, ac1ct 8/8. vo1ce gives proportions, not verdicts. Where a header should sit between
humility and presence is his call. The baseline it measures against is GNU's coding standards, the
Emacs manuals and the kernel's own sources.

## Not done

The migration is a pilot of one tool. The six most story-heavy headers (`on1gw`, `c4show`, `sc3dm`,
`dr1aw`, `ot3he`, `sb1aw`) wait for his word. 52 older lines in MEMORY.md, and three READMEs in older
projects, still use drive spellings.
