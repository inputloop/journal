# CSDW — Compile Scalar Dataset Website

A runtime dictionary-management system. Read a dictionary source (TSV, JSON, plaintext), output it as TSV, HTML, Markdown, JSON, JSONL, or custom template. Grow projects, manage multiple dictionaries, scaffold agents.

## Files

- **[CSDW-summary-prompt.md](CSDW-summary-prompt.md)** — What it does, modes, use cases
- **[CSDW-model.md](CSDW-model.md)** — Cold-run continuity, doctrine, standing directives
- **[csdw.sh](csdw.sh)** — The tool (POSIX, ~300 lines)
- **[CSDW-AGENT-SETUP.md](CSDW-AGENT-SETUP.md)** — Agent implementation guide
- **[CSDW-APPENDIX.md](CSDW-APPENDIX.md)** — Principles, context, GPLv3+ license

## Quick start

```bash
chmod +x csdw.sh
./csdw.sh --help
./csdw.sh --init my-dict --dict ./glossary.tsv
./csdw.sh --to-format my-dict html --out ./glossary.html
```

## Principles

- **Reusable, self-contained, self-healing.** Seed defaults + dot-file overrides; drift is expected and accumulated.
- **Consent-bearing, proof-carrying.** Every transform proves round-trip identity; writes to user data require confirmation.
- **User agency and write surfaces.** Tool refuses to operate without a writable output location.
- **Two test paths always.** Behavioral (expected output) + invariant (no data loss). Both must pass.
- **Free software forward.** GPLv3+; users own their data, modifications, and distributions.

## Use cases

- Glossaries, terminology, translations
- Internal knowledge bases, company jargon
- Multi-language dictionary management
- Template-driven document generation
- Federated dictionary systems

## Testing

**Local:** Run the quick-start commands above on a sample dictionary.

**External AI baseline:** Share `csdw.sh` and sample dictionaries with other AI tools (Claude, GPT, local models). Can they understand the job? Generate adaptations? Respect the license?

**Company context:** Deploy as a shared dictionary bus. Do write-surface and consent constraints work as intended?

## License

GPLv3+ — https://www.gnu.org/licenses/gpl-3.0.html

---

*CSDW v0.1.0 · 2026-08-21*
