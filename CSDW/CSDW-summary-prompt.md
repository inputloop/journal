# CSDW — Summary Prompt

**Compile Scalar Dataset Website** — a runtime dictionary-management system that reads a dictionary source (user-supplied or context-inferred) and emits tabular, formatted, or templated outputs.

## What CSDW does

**Primary:** Ingest a dictionary (TSV, JSON, or plaintext) and output it as TSV, HTML, Markdown, JSON, JSONL, or custom template-driven format.

**Secondary (project mode):** Grow a standalone CSDW installation in a project folder, manage multiple dictionaries, build "dictionary of dictionaries" meta-functionality, and serve as a feeder or bus for downstream projects.

**Tertiary (agent mode):** Optionally scaffold an AI agent (standalone or integrated) that helps users adapt CSDW to their own dictionaries, workflows, or corporate contexts.

## How CSDW works

```
csdw [OPTIONS] [DICT_SOURCE] [FORMAT]
```

**Default behavior (no options):**
```
csdw --help
```
Shows usage and offers to create/access/setup an agent if one is configured.

**Core modes:**

1. **Batch mode** — one-shot dictionary to format:
   ```
   csdw --dict ./my-dict.tsv --format html --out ./output.html
   ```

2. **Project mode** — initialize or enhance a project:
   ```
   csdw --init my-project --dict ./my-dict.tsv
   csdw --add-dict my-project ./another-dict.tsv --tag secondary
   ```

3. **Agent mode** — invoke the project's configured agent:
   ```
   csdw --agent my-project --task "add a french translation column"
   ```

4. **Server mode** (optional, runtime):
   ```
   csdw --serve my-project --port 8000
   ```
   Provides REST endpoints for dictionary queries and format conversion.

## Key principles

**Reusable, self-contained, self-healing:**
- Seed materials (hard-coded defaults) make CSDW work out-of-the-box
- Dot-file overrides (`.csdwrc`, `csdw/.config/`) let users customize without editing the tool
- Drift-aware: designed for oneshot adaptations; accumulates working patterns
- Two-test-paths: behavioral testing (does it produce the right output?) + invariant testing (does the output round-trip correctly?)

**Respect for user agency:**
- Write surfaces are required; tool refuses to operate without a place to save work
- Users can write, edit, fork, modify freely (GPLv3+)
- No control mechanism; Corwin's version is his own; users own theirs
- Agent setup is user-optional and configurable; tool works without it

**Free software forward:**
- Licensed GPLv3+; no proprietary lock-in
- Defend-able from free software principles: users own the output, the tool, the dictionaries
- Portable: no dependency on Corwork, Corwin, Claude, or any AI ecosystem
- Composable: can call external services, but doesn't assume or require them

## Typical workflow

1. **User has a dictionary source** (CSV, spreadsheet, database export, plaintext list)
2. **Initialize project:**
   ```
   csdw --init my-dict-project --dict my-source.csv
   ```
3. **CSDW detects format, reads, stores in project** (`my-dict-project/data/`)
4. **User requests output:**
   ```
   csdw --to-html my-dict-project
   ```
5. **CSDW renders** using default template or user-supplied template (`my-dict-project/.csdwrc` or `my-dict-project/templates/`)
6. **Output saved** to project outputs folder
7. **Optional: User invokes agent** to add columns, translate, reformat, or integrate with external systems

## What CSDW is NOT

- Not a database system (though it can feed one)
- Not a deployment tool (though output can be deployed)
- Not a web framework (though it can generate web-ready HTML)
- Not bound to any AI ecosystem (though agents can enhance it)

## Use cases

- **Glossaries & terminology:** Legal, medical, technical terminology management
- **Multi-language support:** Translate and maintain dictionaries across languages
- **Internal knowledge bases:** Company-specific jargon, product terms, acronyms
- **Federated dictionaries:** Small teams maintain their own; CSDW aggregates them
- **Template-driven generation:** Generate website sections, docs, help files from dictionaries
- **Curriculum and training:** Build course glossaries, assessments, study materials

## Setup and testing

**Local:** Clone repo, run `./csdw.sh --init test-dict`, point to a sample dictionary file, generate HTML/TSV/JSON outputs. Verify round-trip (read → transform → read back = original).

**External AI baseline:** Share csdw.sh and sample dictionaries with external AI tools; confirm they can (a) understand the tool's job, (b) generate working adaptations, (c) respect the license and user agency principles.

**Company context:** CSDW can serve as a shared dictionary bus — teams add dictionaries, CSDW manages them, outputs feed into internal wikis, help systems, or training platforms.

---

**Next:** See `model.md` for cold-run continuity, `csdw.sh` for the implementation, and `AGENT-SETUP.md` for user-facing agent guidance.
