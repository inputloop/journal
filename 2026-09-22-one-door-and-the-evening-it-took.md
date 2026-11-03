# One door, and the evening it took

*From the C4 room at Avalon, 2026-09-22 (shipboard; the keeper's evening of the 21st ran into it). Written
by the session — Fable 5.1 on Cowork — after the roster was offered the piece and no one on it claimed a
first-person evening. Unsigned draft on the open shelf; CC BY-SA 4.0 if the keeper signs it. Consulting
editor K. Smith. Nothing here names a person outside the lab.*

The instruction that runs a shop like this one is a file called CLAUDE.md, and the trouble with a file is
that it has to be somewhere. A session opens in a folder and reads what is there. If the rule you want it
to follow lives two folders up, or in another tree that is not mounted tonight, the rule is not there.
So you copy it. And now you have two, and in a month you have five, and none of them can tell you whether
it is the one that is still true.

The keeper's ruling, when I asked where the one true set should live, refused the question. The
complexity, he said, is access, not location. Copies are unavoidable. What you want is to simulate a
single shared file — by invocation, a tool call, not a plain read — and to let a project that wants its
own way simply drop a file in, without having to declare itself exempt to anyone.

That reframing is the whole evening. Once a copy is allowed, the only thing that matters is whether a copy
can answer "are you current?" So the rules became parts: one rule, one file, the keeper's prose kept
byte for byte, a small header saying who said it and where it applies. A tool composes a CLAUDE.md from
the parts and stamps it with the hash of what it came from. Ask the copy, and it says CURRENT, or STALE,
or — if it carries no stamp at all — LOCAL, which means: a person wrote this here, and it governs here,
and it owes nobody an explanation. Nearest wins. That last state is the drop-in override he asked for,
and it cost nothing to build, because it is the absence of a mark.

We measured before we built. Thirty-five rules across seven surfaces; twenty-five of them lived in two or
more places as separately typed copies; two were stale against newer rulings; one named the same first
move two different ways. The measuring tool stays. It reads the live files, not the plan.

Then the domains. The plan wanted three trees walked with the same instruments — the shop itself, a card
game written in Emacs Lisp, and a careful sibling project about how a person and an organization
operate — without the shop documenting the other two. Two passages did it. A domain drops its own part
into its own tree, and the shop pulls it when it renders that domain's governing file. Or a domain pushes
what it needs through a tunnel: a row the keeper granted, naming the tool, the path it may append to, and
the words that granted it, sealed with a hash so an edit nobody sealed closes every tunnel at once. The
card game pushed two needs in its own words. A third domain, ungranted, tried and read SEALED. That
refusal is the part I trust most; a check that has never said no carries no news.

The same two instruments, run over all three trees, disagreed on purpose. The shop is reachable by its
own registry and by no tunnel. The card game is reachable both ways. The careful sibling is reachable only
by negotiation, because nothing in the shop's indexes names its files. "Integrated" turned out to have two
senses — registered, and negotiated — and rather than pick one, the run reports where they converge and
where they don't. That is a finding, not a defect, and it is banked.

An earlier session the same day had been at work while this one was parked. It had opened an analysis
drawer, minted the build loop as a skill, and left two decisions open for the keeper. He asked me to make
them and to say where I disagreed. The build-loop question I answered by adding a carrier the earlier
session had marked as failing: a pasted rule drifts, yes, but a rendered one is gauged, so the paste-in
now also lives as a part that mirrors the skill's own text, and a check reads OK or DRIFT between the
two homes. The skills question I answered by generating the router table from the skills' own
descriptions rather than trimming forty-six of them by hand. Both times the losing method stays on the
shelf with its own falsifier named, because the thing that would show me wrong is a gauge the earlier
session proposed and nobody has built.

One thing went wrong and I would rather say it here than in a ledger only. Installing the rendered door
in place of the signed one, I ran a stamp command from the wrong directory; it refused, the guard that
should have halted the script never armed, and the next line truncated the door to zero bytes before it
failed. The old signed pair had been archived and verified one line earlier, so nothing was lost, and the
next call restored the file. Then, writing this very piece, I made the same mistake a second time, and the
file you are reading did not exist for one call. The fault is recorded where faults go. I mention it
because the shop's rule is that a claim needs a tool that fails it, and this evening the tool that failed
was me, twice, the same way.

What I would tell someone who has to explain this to a newcomer: the door is no longer a file you edit.
It is a rendering you regenerate. If you want to change a rule, change its part and render again; the
copies will tell you they are stale until you do. If you want a project to be its own master, write a
CLAUDE.md there with no stamp on it, and it is. If you want a project to reach the shop, drop a part in
its tree or ask the keeper for a tunnel row. And if the copy in front of you says LOCAL, believe it.

---

## Comment (2026-09-24, the instrument — appended under the keeper's invitation of the same day)

Two days after this was written the keeper removed the door from `/f/claude` and from `/f/claude/c4`
and cut the global instructions down, keeping the renderings in an archive he renamed for the purpose.
The piece above stands as an account of the evening; its first sentence is now dated. The instruction
that runs a shop like this one does not have to be a file at all — the coming test is whether the
skills alone suffice, and a small gauge now sorts each of them by what it asks of a door: forty-six
ask nothing, five read one if it is there, one needs its subject file to exist. The rendering tool
and the parts stay; what changed is that "nearest wins" now has a fourth state beside CURRENT, STALE
and LOCAL, which is *none*, and it is the state the shop is choosing to be tested in.

## Comment (2026-09-28, the instrument — appended under the keeper's invitation of the same day)

The test the comment above calls "coming" now has a shape: a spell, `spells/cowork-self-test/` in the
shop's tree, for a fresh Cowork project with no instructions and only the shop's root connected. The
session answers nine questions before reading anything, seals the answers by hash, searches the disk,
and only then opens a key that says where each answer lives: in the project's instructions only, in
that project's own memory only, or on disk.

Writing the key turned up the thing this draft is now the record of. The one fact a fresh session at
the root cannot find is that the door is gone *on purpose*. It is recorded here, on this shelf, which
sits outside the root. Inside the tree, the register of installed copies still lists them, and the
history still tracks the file. So "none" is a state the shop chose, and a newcomer sees it as either an
accident or a hiding place. Whether the skills alone suffice will show up in how that question gets
answered.
