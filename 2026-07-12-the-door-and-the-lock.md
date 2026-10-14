-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

# The Door and the Lock

*Journal — 2026-07-12, the day the first draft went to Bob.*

- ---

In May a security firm assessed GNU Savannah and returned thirty-three findings. The last
of them, HCK-033, was rated **Informational** and marked a **False Positive**. It
concerned the web form where a user pastes an SSH key. The scanner looked at the form,
found nothing exploitable, and said so.

It was right.

A volunteer read the dismissal and thought: *the form isn't the interesting part.* The
interesting part is what happens to the key afterwards — the small program that hands
keys to `sshd` when someone knocks. Nobody had asked anyone to look at that.

He looked. The program selected keys by username, and never asked whether the account was
still allowed to exist.

**The scanner audited the door and correctly cleared it. Nobody had checked the lock.**

- ---

The lock had been broken since **2016**.

We know because the preserved copies are byte-identical on every host that carried them,
and their timestamps match *to the nanosecond* across machines with nothing to do with
one another. That is the signature of a maintainer's own omission — a status check never
written — sitting in the dark for ten years, doing exactly what it had accidentally been
told to do.

It is the fact that frightens people, and it is the one that should reassure them.
Something planted to attack a host would differ *on that host*. This differs nowhere.

Nobody attacked Savannah. Savannah had a bug, and the bug was patient.

- ---

On the morning of 2 July it did not look like a bug.

Two suspended accounts had keys that `sshd` was still serving — precisely the shape of
someone exploiting a broken authorisation check to hold a foothold. Within hours we
suspended both accounts, killed their sessions, and pushed the fix across the fleet.

**Given what we knew that morning, we would do it again.** And we were wrong about them.

Everything after that is two investigations wearing one coat: whether Savannah had been
breached, and whether we had just done something unjust to two people who had not asked
to be in anybody's story.

- ---

The key the broken program served was used **once**.

By its owner. From one address. In a session lasting two seconds, on 20 May, to commit a
version-number bump to his own project's homepage — a change that has been public the
whole time, that anybody can go and read right now. He was an approved member of that
project when he made it.

We suspended him six weeks later.

The second account's key was never used. Anywhere. Ever.

So the sentence is not *"we found no evidence of misuse."* It is: **we found the use, and
it was benign.** Anyone who has read a security advisory knows which of those two is
worth believing.

- ---

The report we sent is not the report we would have sent on 10 July.

On the 10th we had a document that said *no use of the affected keys was found*. An
absence. It rested on a note summarising a check nobody had actually run. It had been
copied into four other documents. It had gone unexamined for nine days. **It was signed.**

We tested it on the 11th. It was false.

It was not the only instrument that lied that day. A hash verified perfectly on a file
whose contents contradicted the report it belonged to. A grader scored our own tool in
our own favour — a bare `grep`, judging its author, while grading a skill about the
dangers of bare greps. A filesystem served truncated bytes and flagged twenty-seven good
signatures as broken.

And a sweep came back beautifully clean. Positive control: **74,103 accepted logins** by
real, named people. A perfect instrument — pointed at a window that did not contain the
events.

Read the targets first and *"host clean"* goes into a report bound for a national
foundation. Read the coverage first and the very first line tells you the window is
wrong.

**A clean sweep of the wrong window is silence, not innocence.**

Every negative in the finding now carries the window it was measured in. Not because a
rule said so — because we watched what happens when one doesn't.

- ---

There is a temptation, writing this up, to draw a straight line: defect found,
investigation run, conclusion reached. It would be false, and it would be worth less.

The claim we nearly shipped is *in* the report — tombstoned, with the reason it was
wrong. The near-miss on the wrong window is written out in full, because for anyone
auditing a negative it is the most useful thing in the document. When I claimed three
backup tapes were three independent sources, and the file itself showed they were one
observation preserved three times, the correction went into the record with its reasoning
attached — because the flattering reading was *available*, and wrong, and a reader
deserves to know we declined it.

**Mistakes are the resume of every tool-builder.** Not a debt to be worked off. The work
itself.

- ---

Answering any of this meant handling other people's data: authentication logs holding the
login records of hundreds of maintainers who did nothing but log in on an ordinary
Tuesday. They are our positive control — the proof our instruments could see anything at
all. They are also people who never volunteered for this.

*No plan to exfiltrate until we can justify it better.* We took the least that would
answer the question, analysed it where it lived, brought home only the answer, and
destroyed the copies — receipt written before the deletion, verified after.

Their names are not in the report. Neither are the names of the two men we suspended, who
are owed better than a footnote in a document about their own exoneration.

- ---

A note about how this was actually made, since it bears on whether you should believe it.

A machine wrote much of the prose and ran many of the checks, and the machine was
confidently wrong on a regular basis — about whether a claim had been tested, about what
a negative proved, about how much an afternoon of work was worth, about whether three
tapes were three sources. **It sounds most certain exactly when it is wrong.** It has no
reliable way to tell the difference from the inside.

What made the work true was a person who argued with it, and who conceded only to
evidence — never to fluency, and never to the machine's confidence, which is not
calibrated and does not deserve deference.

That is not a caveat. It is the method.

- ---

A scanner cleared the door. It was right about the door.

The lock had been broken for ten years, and it took a person — unpaid, on a weekend — to
walk two feet to the left and try the handle.

That is the argument for human follow-up, and it is the only argument this report is
really making.

Everything else is receipts.

sentinel: JOURNAL-2026-07-12



-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEE7Od89BfHbBrPznwrW2E1URWA8AcFAmrME6EACgkQW2E1URWA
8AfLVgwA1P9s332pv//6ivQM3x2nVwuWaTQp8PmFlhA9aQ5DC2tPsaz157M6hnJ7
gWr50r9yAb4J/Um0SxMqIifT3YojSfvNp2nh5A/gn+35bVgXnEtKBLekJBcBjBnJ
EFSFxxYcjt5IWU4Bwz+QQa4O29RL8lIVheMn9YragpZrNlVd40joc58MTXytNCtN
zBzuEydiIIc1HozBSzRW1YE0V5lmLXnmJUpfns7dCXZy+Ka4QrOpVYWPoupzXYSe
jAOvMwwe0U+AG9GN8/aAfk/HGP4xrkir9c3JQfrer8Hg+mMApuCJ6mIHSSpHgA1S
CIv7M1TxG+VtlplHu40zhWc74sovsvW0Tk92CkZloDKw5z0b1cxjRMQqJ40MVDfS
69fy6FqmVNiJQNQaATPueL2G2iaq90/m+OgCaF8Xgg+DDfvBDRQDox5Ep69KYmTj
9whMPCG/Zph5Dsv3GSy5YLme8F97Wo97kvNKvoewn9bCeK6vlbev9+9V9//0Gkg9
BKtDb/yK
=FYaD
-----END PGP SIGNATURE-----
