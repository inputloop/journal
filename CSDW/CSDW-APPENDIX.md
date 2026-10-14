# CSDW — Appendix: Citations and Context

## Origins and intent

CSDW was designed to serve multiple audiences:
- **Personal research:** Dictionary management for Corwin's own work on free software and collaborative systems
- **Company context:** Teams managing domain-specific terminology, glossaries, and training materials
- **Free software principles:** Tool and outputs are GPLv3+; users own their data and modifications
- **Reusability:** Intended to be forked, adapted, and shared without corporate gates

Corwin's company values transparency, user agency, and respectful collaboration. CSDW reflects those values: write surfaces are required, users can modify freely, and the tool respects existing work rather than forcing new workflows.

## Design principles

The following principles informed CSDW's design:

### 1. Reusable, self-contained, self-healing
Seed defaults make CSDW work immediately. Dot-file overrides let users customize without editing the tool. Drift (oneshot adaptations) is expected and accumulated, not fought.

### 2. Consent-bearing and proof-carrying
Every format transformation includes two tests:
- **Behavioral:** Does the output match what was requested?
- **Invariant:** Can the data round-trip without loss?

Writes to `data/` require confirmation; `outputs/` is safe. This respects user agency and prevents silent corruption.

### 3. User agency and write surfaces
CSDW refuses to operate without a writable output location. This prevents "silent failures" and keeps users in control of where their work lands.

### 4. Two test paths always
Behavioral testing (does it produce the right output?) + invariant testing (does it round-trip correctly?). Both must pass.

A transform that passes behavioral but fails invariant silently corrupts data — unacceptable for a dictionary system.

### 5. Free software forward
GPLv3+. No proprietary lock-in, no central authority, no subscription gates. Users can fork, modify, and distribute freely.

## Testing and iteration

CSDW is designed to be tested by:
1. **Local testing:** Clone, run `./csdw.sh --init test-dict`, point to a sample dictionary, generate outputs in multiple formats. Verify round-trip.
2. **External AI baseline:** Share csdw.sh and sample dictionaries with other AI tools. Can they understand the tool's job? Generate working adaptations? Respect the license?
3. **Company context:** Deploy as a shared dictionary bus. Does it serve team workflows? Can users write and modify freely?

## Files and structure

This CSDW project includes:
- **README.md** — Overview and quick start
- **CSDW-summary-prompt.md** — What CSDW does, modes, use cases
- **CSDW-model.md** — Cold-run continuity, doctrine, standing directives
- **csdw.sh** — The runtime script (POSIX, ~300 lines)
- **CSDW-AGENT-SETUP.md** — Agent implementation guide
- **CSDW-APPENDIX.md** — This file; principles, context, licensing

## How to use this project

1. **Clone or download** to your own machine
2. **Read README.md** and **CSDW-summary-prompt.md** for overview
3. **Run csdw.sh** locally:
   ```bash
   chmod +x csdw.sh
   ./csdw.sh --help
   ./csdw.sh --init test-project --dict ./sample.tsv
   ./csdw.sh --to-format test-project html --out ./sample.html
   ```
4. **Verify round-trip:** Read the output back; ensure no data was lost
5. **Customize:** Edit `.csdwrc` in your project to override defaults
6. **Add an agent** (optional): See CSDW-AGENT-SETUP.md

## Questions and contributions

This is a young tool. If you:
- Find a bug: Document it, note the steps to reproduce, and share
- Want to enhance it: Fork it, make your changes, test round-trip, and share your version
- Have a use case: Try CSDW on your dictionaries; report what worked and what didn't
- Want to integrate it: Adapt the license notice, include this appendix or a reference to it

All contributions and adaptations should respect the GPLv3+ license and preserve user agency.

## License

CSDW is licensed under the GNU General Public License v3 or later (GPLv3+).

**License text:**
```
CSDW — Compile Scalar Dataset Website
Copyright (C) 2026 Corwin Brown

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <https://www.gnu.org/licenses/>.
```

For the full license text, see https://www.gnu.org/licenses/gpl-3.0.html

---

**CSDW v0.1.0 · 2026-08-21**
