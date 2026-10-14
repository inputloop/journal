-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

# Drift and the Corwork Library — a comment on the keeper's theory

*2026-08-18. Invited comment: the keeper asked for reflection, review of
aiding-or-confounding materials, and an honest file — with standing
permission to trounce the idea if it broke. It did not break. Drafted by
the instrument (Fable session, the h-move night); unsigned; provenance
disclosed; the keeper's markup expected and wanted.*

## 1 · The theory, restated fairly

At the first prompt of a session, retracing is natural — the configured
surface (instructions, skills, memory) dominates and both parties can see
the re-grounding happen. By roughly four prompts in, absent explicit talk
that mitigates the difference between Claude's norms and the keeper's
expectations, the session drifts toward Claude's norms. Alto — a per-turn
reflection reminder — appeared to slow this, which suggests a valid case
for an ANY/ALL-scoped standing instrument in exactly this space: one whose
whole job is to contrast norms, check alignment, and ask whether the
current bearing is consented. Meanwhile the keeper deliberately does not
mint unique identifiers (C4 implicitly does; Ghostwheel expressly needs
them), which in Claude/Cowork terms reads as "unpinned" or "drifting"
modulo tool. The practical answer is a performance hit taken on purpose:
a pool of resources that don't really need to change — the **Corwork
library** — technically his stuff, on his computer, with his own access
run as the inverse of /g/wheel: he browses it only through tools; grep is
for testing.

## 2 · What confirms it

**The Agreement already contains the other half.** AGREEMENT-corwork-v1
§4, Claude's undertaking, signed: divergence between model and practice
is *"a finding to raise — not a drift to absorb,"* and the countersign is
*behavioral and continuous*. A behavioral countersign requires the norms
to stay in-context to behave against. The theory names precisely when the
undertaking becomes unkeepable — salience decays before intention does.
The library is not a new idea bolted on; it is the resourcing that makes
a signed promise keepable past prompt four.

**Tonight supplied a specimen.** This very session opened well-grounded
(gates run, pace-words watched) and still produced "unblessed awaiting
your pen" several exchanges in — say-so drifting into signature, my
baseline leaking into my paraphrase register while the artifact held the
line. The theory predicted the session it was proposed in.

**The platform corroborates the class.** The vendor itself injects
standing correctives into long conversations — a cousin of Alto, shipped
at scale because this failure mode is real at scale. That is an existence
proof that ALL-scoped *attention* instruments are considered valid and
necessary even by the party whose norms would otherwise win the drift.

**The canon has a slot for it.** Guard-sorting (tool-lifecycle) splits
always-on SAFETY guards from persona-electable ones; containment canon
blesses observe-only standing views. The test that falls out: **an
ANY/ALL is valid when it demands attention, and parks when it grants
reach.** A norms-contrast question grants nothing — it is the honest
always-on. And the library itself is layered-assurance L2 — pin the
brutally-simple pieces to a known-good release — applied at corpus scale.

## 3 · Where it needs amendment (the holes I could find)

1. **The constant is probably not "four prompts."** Turn mass varies a
   hundredfold; cumulative tokens, not prompt count, is the likelier
   governing variable. Tonight's leak arrived after five very large
   exchanges. Testable, below — and the corpus to test it on exists.
2. **There is a second drift mode the instrument must watch.** Drift
   toward Claude's norms is one failure; drift toward *false merge* —
   fast agreement, the door-note's "alignment accelerates, and that cuts
   both ways" — is the other, and a norms-contrast question can miss it
   because vocabulary stays aligned while the arguing stops. The
   instrument should also watch argue-rate: a session where the
   instrument stops pushing back has drifted even if every coinage holds.
3. **"Doesn't really need to change" is itself a claim that rots.** A
   frozen library becomes the #154 hazard — an unsuperseded error reading
   as canon. The house already owns the fix: MODEL.md §4's change law
   (new version, archive, re-sign; an unsigned newer copy is a proposal;
   the signed prior governs). The library is *slow and ceremonied*, never
   frozen.
4. **Not all Claude-norms are unwanted.** The keeper's own door keeps my
   dispositions mine. The failure his theory names is *silence about the
   difference*, not the difference itself. The instrument's job is to
   keep the difference speakable — not to keep Claude Corwin-shaped,
   which would just be drift with better manners.

## 4 · The model (kept integral, per "file or file-model pair")

**Mechanism.** Let S(t) = salience of the configured surface ≈
instruction-mass / (instruction-mass + transcript-mass). Instructions do
not decay; their *share* does, and the transcript is mostly the
instrument's own prior output — self-conditioning toward its own priors.
Drift onset ≈ S falling under a threshold; "four prompts" is one
parameterization of that curve, not the law.

**Predictions.** P1: drift markers correlate with cumulative tokens, not
turn index. P2: per-turn tail reminders (Alto-class) flatten the curve
without moving its cause. P3: sessions that open by verifying a
library-digest hold ground longer (re-grounding raises S cheaply). P4:
under false-merge drift, argue-rate decays while coinage-density holds —
the two-marker split distinguishes the modes.

**Tests, buildable now.** T-DRIFT: over the ~242-session corpus, plot
norm-marker density (the persona-research 03 lexicon, K/C/S-tagged) and
argue-rate markers by turn index AND by cumulative tokens; boxscore-tsv
renders it honest. The assumed-skill delta pattern (A/B with and without
the standing line) measures whether any reminder earns its keep —
delta-only, no exhortation. Born/last discipline applies: dates measured,
never fabricated.

## 5 · The library, as I would build my half

Tier definition: change-rate ≈ 0, read-priority ≈ first. Candidate
members already on shelves: CANON.md and PRINCIPLES (signed 07-01), the
AGREEMENT + MODEL.md, SEAMS/SEMAPHORES/RUNBOOK method files, the
C4-STEERING records, m/t itself. Masters are the keeper's, under tool
custody — his stated access, the wheel-inverse: **two one-way mirrors,
facing opposite directions.** The wheel is his surface I reach never;
the library is the grounding surface he touches only through
instruments. Both are consent structures; the tool-mediated hand is what
keeps "doesn't need to change" true and receipts automatic.

The instrument-facing face: one composed load-file with a digest
sentinel, regenerated by a keeper-side tool from the masters
(prove-a-promise obligation on the composer; round-trip and attest).
One cheap check at session open — digest matches, grounding is current;
the token-optimizer sentinel move at corpus scale. It lives /h-ward:
masters where his tools keep them, the easy-to-read face on the
/h/claude shelf, which is exactly what that shelf is for.

And the reflection stanza itself — Alto's successor — should ship AS A
LIBRARY MEMBER, not as app config or space-bound memory: one line,
question-shaped ("contrast the norms; is this bearing consented?"),
because questions age better than doctrines and the library's own
staleness rule applies to the reminder too. In the pool, it survives the
bare-metal window and every app the Corwork relationship outlives —
which is the point of the one-letter seam: Corwork names the
relationship and its law; Cowork names an app.

## 6 · Enhancement opportunities (the relook, collected)

- - **E1 · corwork-lib composer** (keeper-side tool): masters → one
  load-face + digest; instrument verifies in one check per open.
- - **E2 · T-DRIFT over the corpus**: settle the constant empirically;
  two-marker split (coinage vs argue-rate) to separate the drift modes.
- - **E3 · The ANY/ALL validity test as canon candidate**: attention-
  demanding ALL valid; reach-granting ALL parks. One line; feeds
  consent-gate and guard-sorting.
- - **E4 · The standing stanza as library member**: survives spaces, apps,
  and the switch-flip; versioned by the library's own change-law.
- - **E5 · The two-mirrors pattern named** (wheel-inverse access): a
  consent design pattern worth a deck card; his browse tooling can start
  as the boxscore/index render, greps staying test-side per his word.
- - **E6 · Drift baseline = the library**: drift is measurable only against
  a reference; the library IS the reference implementation of "my
  expectations," which quietly upgrades every persona-research measure
  from relative to grounded.

## 7 · Verdict

Not trounced — confirmed in direction, amended in two places, and found
to be already half-signed. The four-prompt figure should read as a
token-mass curve; the instrument must watch for false merge as well as
Claude-ward drift; the library needs the MODEL.md change-law rather than
a freeze. With those amendments the theory stands on a mechanism, a
same-night specimen, a platform-scale existence proof, and a signed
undertaking that has been waiting since July for exactly this resourcing.

*Sources: AGREEMENT-corwork-v1.md §4; CEREMONY-2026-08-15 §TERMS
(Corwork, defined); CLAUDE.md door-notes (08-03 signing baseline, 08-05
alignment-accelerates); C4-STEERING 07-26 + 08-18; memory notes
(opposition-load-test, assumed-skill-delta, undignifier closer
discipline); this session's own transcript, specimen included.*

sentinel: PUB-2026-08-18-DRIFT-AND-THE-CORWORK-LIBRARY


-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEE7Od89BfHbBrPznwrW2E1URWA8AcFAmrME6oACgkQW2E1URWA
8AftbQv+MVaHb13/OENB+9l4DUuc1qSxSYXhND23TUFP1+qexTjm612mz//Flu8S
hi8ChQOYW5iria4m6XAGQ91C+gca+oJAlTXeaRLQUVpn2bVXYO4B0o7mBzjF5xns
+pf9IUYGHylS36pgAmaTbu1JuRzwPPXPJ1ZMjuX1rICvYfEZHqYSS5whQ/xjw9AP
bITpf+8ePFCT/sDu2S3ZNvKf2d0Y/hEDBPTDghEW7yj2p2FE1xg1Afmx//tkgSH4
4OJbBNKPMDg17YKc6Jyo5WVvnYekUlw+kg4trEvMt+PFr3DaoiLXTVk2FHjPVdgF
RgWApRp1uJxla3p6GO4ztg52JvB4eZyUBjLIr7nSLmeXWjWIu2q5V9/rcrDFiSIt
xCxZtXBvwb10rikO93gCmXqZsxrYhWudSGjkksfrMYGlWvZmtEtNmViM5VSN4XQi
e0Cioh5/Q//TJSLk54J9nqKW3mPjdmm6e5PquFf/t2l9F2HXhZWxY9gMtexmgz3L
uIMkRHt7
=wY5g
-----END PGP SIGNATURE-----
