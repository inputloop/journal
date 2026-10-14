# The Garden Walk

*A method — 2026-09-06, on keeping an assistant's memory where you can see it. Vendor-agnostic.*

*Drafted by the instrument (Fable session, 2026-09-06); unsigned until the keeper's pen; provenance
disclosed; the keeper's markup expected and wanted. Prose CC BY 4.0 (this shelf's grant); the code it
names is GPL-3.0-or-later and lives with the shop. Method only — no vendor's material is reproduced.*

---

Every assistant that remembers you keeps its notes somewhere you did not choose. The folder has a
name the vendor picked, a limit the vendor set, and a habit of moving when the software updates. You
can still work with it — but only if you stop treating "the memory" as one thing and start treating it
as a *walk*: a fixed route through a small garden, taken the same way at the start of every session,
that ends with one note saying what was seen. That is the whole method. It needs a shell, a folder of
plain-text notes with an index, and a person willing to read one page. It does not need the vendor's
cooperation, and it does not need any feature only one vendor has.

## The four beats

**Open.** The first act of a session is a command, not a recollection. It answers three questions in
words: *where is memory loaded from?* (the vendor's folder, if the session can see it), *where is memory
seated?* (your own folder, in your own project, named `memory/`), and *do the two agree?* (how many
index lines the seated copy lacks). It then prints the head of your index — the first thirty lines,
never the whole thing — and every action that only a human hand can take, as a card. It writes one
note, under a new name every time, and touches nothing else.

**Gauge.** A gauge measures and never argues. It reads the index against the folder both ways (lines
that point at nothing; notes that no line points at), checks the index against the vendor's load limit
before the limit silently drops the tail, counts the notes this session may not edit, and says of every
store it cannot see *not visible* — never "fine", never "broken". Each line is a word and the command
that produced it, so a stranger can run the command and get the same word.

**Two readers.** No claim about memory stands on one reader. The sandbox the assistant runs in and the
shell you run on your own machine see different things: one cannot delete, one cannot see the vendor's
folder, one sees every mount. Run the same gauge from both. Where they agree you have evidence; where
they disagree you have found the seam, and the seam is usually the finding. This week the seam was a
fence: notes written by a previous session's sandbox shell could not be edited by the next session's,
while notes written by the assistant's own file tool could. No documentation says so. Two readers did.

**Dial.** Ceremony is a dial, not a virtue. Set it per store, on a ladder whose numbers mean something:
**1** a hash (identity for yourself) · **2** words in the note's front matter that a second reader can
act on · **4** a regenerated manifest a small group can check without reading the notes · **9**
signatures against a pinned key, for strangers · **17** a shelf with a vouch map, for publication. A
memory folder lives at 2 or 4. A published shelf lives at 17. Nobody clearsigns their own notes, and a
tool that says a signature is *bad* when it merely lacks the key has broken the walk.

## What the walk refuses

It never creates a memory folder where none exists — a project without a seat is not opened by
accident. It never edits a note another session wrote; it only creates. It never carries note *names*
off the machine: names are topics, and a list of topics is a disclosure. It never pushes the whole
index into every conversation; a pointer and a head are enough, and the rest is a search away. And it
never takes a vendor's setting on faith: a setting is data until a second reader prints its effect.

## Why it composes

A folder of markdown, an index of one line per note, a shell script that reads and writes one file, a
ledger of hashes: every piece is the lowest tier that still carries its check. A person with no
keyring, no AI, and a terminal can run the walk on their own notes and get the same words. That is the
test of a method meant to travel — not that it impresses the author's tools, but that it survives
their absence.

## The artifact

The walk is a script, `se1sn`, and its gauge, `ms1dg` — POSIX shell, tests that go red on purpose
when planted with a wrong expectation, and a one-paragraph door in the project's instruction file that
says: *first act each session, run the open.* The shop that made them keeps them at
`/f/claude/AS4CE/AS4CE0001/bin/` with their tests under `tests/`; the test suites build ten synthetic
notes and an index and walk them, so the demonstration is the test. Fetch, run `sh tests/se1sn-tests.sh
--prove-red`, and read the one note it leaves.

## What it is not

It is not a memory framework, a vector store, or a knowledge graph; those answer retrieval questions
this method does not ask. It is not a guarantee against a vendor changing its folder; it is the thing
that notices when one does. And it is not finished: whether the vendor honors a setting that would make
the seat *be* the loaded store is a one-session test the keeper is running as this is written — the
walk is designed so that either answer leaves it standing.

---

*In the shop this is filed as a C4 pair of pairs — `gw1tr`: GARDEN WALK, run-level 1, TWO READERS —
and the bare word for the file is `hike`. The name that upstream can take is the plain one.*
