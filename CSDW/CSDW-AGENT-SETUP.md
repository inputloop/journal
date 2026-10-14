# AGENT-SETUP.md — CSDW Agent Implementation Guide

An agent (AI or rule-based) can enhance CSDW by automating dictionary tasks: adding columns, translating, reformatting, integrating external data, or publishing outputs. This guide covers setup, constraints, and best practices.

## Overview

**What the agent does:**
- Reads dictionaries from `data/`
- Executes user tasks (via natural language or structured commands)
- Writes results to `outputs/` or back to `data/` (with confirmation)
- Reports progress and any issues

**What the agent does NOT do:**
- Delete user data without confirmation
- Modify the tool itself (csdw.sh)
- Send data off-project without explicit permission
- Assume any AI ecosystem or Corwork context

## Agent roles

### 1. AI-based agent (Claude, GPT, local model, etc.)

**When to use:** Complex tasks (natural language understanding, multi-step reasoning, creative synthesis).

**Setup:**
```bash
# In project root:
cat > agent/agent.py <<'AGENT_PY'
#!/usr/bin/env python3
import sys
import json
from pathlib import Path

def run_task(project_dir, task_description):
    """Execute a dictionary task."""
    data_dir = Path(project_dir) / "data"
    outputs_dir = Path(project_dir) / "outputs"
    
    # Read available dictionaries
    dicts = {f.stem: f for f in data_dir.glob("*")}
    
    # Parse task (stub; real agent would call LLM)
    print(f"Task: {task_description}", file=sys.stderr)
    print(f"Available dicts: {list(dicts.keys())}", file=sys.stderr)
    
    # Execute (stub; real agent would produce output)
    result = {"status": "agent not yet implemented"}
    print(json.dumps(result))
    return 0

if __name__ == "__main__":
    project = sys.argv[1] if len(sys.argv) > 1 else "."
    task = sys.argv[2] if len(sys.argv) > 2 else "list dictionaries"
    sys.exit(run_task(project, task))
AGENT_PY
chmod +x agent/agent.py
```

**Invoke:**
```bash
csdw --agent my-project --task "add a 'definition' column"
```

### 2. Rule-based agent (shell script, jq, AWK)

**When to use:** Predictable, repeatable tasks (format conversion, column addition, filtering).

**Setup:**
```bash
cat > agent/agent.sh <<'AGENT_SH'
#!/bin/sh
# Simple rule-based agent for common dictionary tasks

PROJECT="$1"
TASK="$2"

DATA_DIR="$PROJECT/data"
OUTPUTS_DIR="$PROJECT/outputs"

case "$TASK" in
    "add-column")
        # Example: add a column to a TSV
        # Real implementation would parse task and execute
        echo "Would add a column to dictionaries in $DATA_DIR"
        ;;
    "translate")
        echo "Would invoke translation service (stub)"
        ;;
    *)
        echo "Unknown task: $TASK"
        exit 1
        ;;
esac
AGENT_SH
chmod +x agent/agent.sh
```

**Invoke:**
```bash
./agent/agent.sh my-project "add-column"
```

### 3. Hybrid agent (shell + external service)

**When to use:** Combine predictable structure (shell) with external intelligence (API, LLM, etc.).

**Setup:**
```bash
cat > agent/hybrid-agent.sh <<'HYBRID'
#!/bin/sh
PROJECT="$1"
TASK="$2"

# Step 1: Validate inputs
[ -d "$PROJECT" ] || { echo "Project not found: $PROJECT"; exit 1; }

# Step 2: Parse task (shell-based)
case "$TASK" in
    "translate")
        LANG=$(echo "$TASK" | grep -oP 'to \K\w+' || echo "spanish")
        # Step 3: Call external service (e.g., translation API)
        # curl -X POST "https://api.example.com/translate" ...
        echo "Would translate to: $LANG"
        ;;
esac

# Step 4: Write results to outputs/
# (Always confirm before modifying data/)
HYBRID
chmod +x agent/hybrid-agent.sh
```

## Configuration

**Enable agent in `.csdwrc`:**
```sh
AGENT_ENABLED="true"
AGENT_SCRIPT="./agent/agent.sh"
# or:
AGENT_SCRIPT="./agent/agent.py"
AGENT_LANGUAGE="python"  # or "sh", "nodejs", etc.
```

**Agent constraints (enforced by CSDW):**
- Read-only access to `data/` by default
- Write access to `outputs/` always allowed
- Write access to `data/` requires confirmation (prevents accidental overwrites)
- No network access unless explicitly configured
- No access to host system beyond project directory

## Agent implementation checklist

- [ ] Agent reads dictionaries from `data/`
- [ ] Agent validates input format (TSV, JSON, etc.)
- [ ] Agent produces output in requested format
- [ ] Agent writes to `outputs/` (safe zone)
- [ ] Agent reports progress and errors to stderr
- [ ] Agent returns exit code 0 on success, non-zero on failure
- [ ] Agent does NOT assume any AI ecosystem (Claude, OpenAI, etc.)
- [ ] Agent respects user write-surface (refuses if no write location)
- [ ] Agent round-trips data (proves no data loss)
- [ ] Agent is usable standalone (e.g., can be called by other tools)

## Common tasks

### Add a column to all dictionaries
```bash
csdw --agent my-project --task "add column 'definition' from external source"
```
Agent should:
1. Read each dictionary in `data/`
2. Fetch or generate definitions
3. Add as new column
4. Write results to `outputs/`

### Translate a dictionary
```bash
csdw --agent my-project --task "translate to Spanish"
```
Agent should:
1. Read dictionary
2. Call translation service or local model
3. Add translated column
4. Write to `outputs/`

### Merge multiple dictionaries
```bash
csdw --agent my-project --task "merge glossary and terminology"
```
Agent should:
1. Read both dictionaries
2. Deduplicate (if applicable)
3. Merge columns
4. Write merged output to `outputs/`

### Publish to a format and upload
```bash
csdw --agent my-project --task "generate HTML and publish to docs site"
```
Agent should:
1. Generate HTML (via `csdw --to-format`)
2. Ask for confirmation before uploading
3. Post to specified location
4. Report success/failure

## Testing the agent

**Behavioral test:** Does the agent produce the expected output?
```bash
csdw --agent my-project --task "add-column name:definition"
# Verify: outputs/main.tsv now has a "definition" column
```

**Invariant test:** Does the round-trip work?
```bash
# Original: data/main.tsv (3 columns, 100 rows)
# Agent adds column: outputs/main.tsv (4 columns, 100 rows)
# Verify: all 3 original columns intact, no rows lost, no data corruption
```

## User experience

**No agent configured:**
```bash
$ csdw --agent my-project --task "add translations"
INFO: Agent not configured for this project.
Offer to create one? (y/n) 
```

**Agent error handling:**
```bash
$ csdw --agent my-project --task "something impossible"
ERROR: Task failed: not enough information
Suggestion: Provide a source for translations (URL, file, or list)
```

**Progress reporting:**
```bash
INFO: Reading dictionaries...
INFO: Processing: data/main.tsv (1000 rows)
INFO: Adding column: definition
INFO: Writing output: outputs/main.tsv
✓ Complete. 1000 rows, 5 columns, 0 errors.
```

## Distribution and licensing

If you publish an agent for CSDW:
- Include a copy of CSDW's license (GPLv3+)
- Specify your agent's license (recommend GPLv3+ or compatible)
- Document dependencies (Python packages, external APIs, etc.)
- Include a README (setup, usage, examples)
- Provide a way for users to test locally before using in production

**Example project structure:**
```
my-csdw-agent/
├─ agent.py                 # The agent implementation
├─ LICENSE                  # Your license (GPLv3+ or compatible)
├─ README.md                # Setup and usage
├─ test/                     # Test dictionaries and expected outputs
│  ├─ sample-dict.tsv
│  └─ expected-output.json
└─ requirements.txt         # Dependencies (if applicable)
```

## Principles

- **User owns the agent:** If it's configured in their project, they can modify, replace, or disable it.
- **No lock-in:** An agent is a helper, not a requirement. CSDW works without one.
- **Transparency:** Agent should log what it's doing, why, and what it's about to change.
- **Consent for writes:** Never modify `data/` without asking. `outputs/` is safe; use it first.
- **Portability:** Agent should work locally, offline, and without network unless explicitly required.

---

**See also:** `csdw.sh` (the runtime tool), `model.md` (continuity), and `CSDW-summary-prompt.md` (overview).
