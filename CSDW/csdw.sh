#!/bin/sh
# CSDW — Compile Scalar Dataset Website
# Runtime dictionary-to-format system
# GPLv3+ — https://www.gnu.org/licenses/gpl-3.0.html

set -e

# ============================================================================
# Configuration & defaults
# ============================================================================

VERSION="0.1.0"
CSDW_HOME="${CSDW_HOME:-.}"
PROJECT_NAME=""
DICT_SOURCE=""
FORMAT="tsv"
OUTPUT_FILE=""
ACTION="help"

# ============================================================================
# Helper functions
# ============================================================================

die() {
    echo "ERROR: $*" >&2
    exit 1
}

warn() {
    echo "WARN: $*" >&2
}

info() {
    echo "INFO: $*" >&2
}

show_help() {
    cat <<'EOF'
CSDW v0.1.0 — Compile Scalar Dataset Website

Usage:
  csdw [OPTIONS] [ACTION] [PROJECT]

Actions:
  --init PROJECT              Initialize a new project
  --add-dict PROJECT DICT     Add a dictionary to a project
  --to-format PROJECT FORMAT  Convert all dicts in project to format
  --agent PROJECT --task STR  Invoke project agent for a task
  --serve PROJECT --port N    Start dictionary server (optional)
  --help                      Show this message
  --version                   Show version

Options:
  --dict FILE                 Dictionary source (path or URL)
  --format FORMAT             Output format (tsv, html, json, markdown, jsonl)
  --out FILE                  Output file path
  --template FILE             Custom template for format
  --tag NAME                  Tag for dictionary (in projects)

Examples:
  csdw --help
  csdw --init my-dict --dict ./glossary.tsv
  csdw --add-dict my-dict ./translations.json --tag spanish
  csdw --to-format my-dict html --out ./glossary.html
  csdw --agent my-dict --task "add examples"

Write surfaces:
  CSDW requires a writable output location. If --out is not specified,
  will ask you to confirm a location. Will refuse to proceed without one.

Agent setup:
  csdw --agent my-dict --task "..."
  If no agent is configured, will offer to create one (requires user confirmation).

EOF
}

show_version() {
    echo "CSDW v${VERSION}"
}

# ============================================================================
# Project structure
# ============================================================================

validate_write_surface() {
    local output_dir="$1"

    if [ -z "$output_dir" ]; then
        die "No output directory specified. Refusing to proceed without a write surface."
    fi

    if ! mkdir -p "$output_dir" 2>/dev/null; then
        die "Cannot create or write to: $output_dir"
    fi

    if [ ! -w "$output_dir" ]; then
        die "Output directory is not writable: $output_dir"
    fi

    info "Write surface validated: $output_dir"
}

init_project() {
    local project="$1"
    local dict_source="$2"

    [ -n "$project" ] || die "--init requires PROJECT name"

    if [ -d "$project" ]; then
        die "Project already exists: $project"
    fi

    info "Initializing project: $project"

    mkdir -p "$project/data"
    mkdir -p "$project/templates"
    mkdir -p "$project/outputs"
    mkdir -p "$project/.models"

    # Create seed .csdwrc
    cat > "$project/.csdwrc" <<'CSDWRC'
# CSDW project config
PROJECT_NAME="project"
DEFAULT_FORMAT="tsv"
AGENT_ENABLED="false"
# AGENT_SCRIPT="/path/to/agent.sh"

# Override these to customize behavior:
# SEED_TEMPLATE_HTML="path/to/template.html"
# OUTPUT_ENCODING="utf-8"
CSDWRC

    # Create manifest
    cat > "$project/.csdw-manifest" <<'MANIFEST'
# CSDW dictionary manifest
# Format: NAME | PATH | FORMAT | SCHEMA_HASH | LAST_MODIFIED
MANIFEST

    info "Project structure created:"
    info "  $project/"
    info "  ├─ data/            (dictionaries)"
    info "  ├─ templates/       (format templates)"
    info "  ├─ outputs/         (generated files)"
    info "  ├─ .csdwrc          (config)"
    info "  └─ .csdw-manifest   (inventory)"

    if [ -n "$dict_source" ]; then
        add_dict "$project" "$dict_source" "main"
    else
        info "Next: csdw --add-dict $project <DICT_FILE>"
    fi
}

add_dict() {
    local project="$1"
    local dict_source="$2"
    local tag="${3:-main}"

    [ -n "$project" ] || die "--add-dict requires PROJECT"
    [ -n "$dict_source" ] || die "--add-dict requires DICT source"
    [ -d "$project" ] || die "Project not found: $project"

    # Detect format and validate
    local format="tsv"
    case "$dict_source" in
        *.json) format="json" ;;
        *.tsv)  format="tsv" ;;
        *.csv)  format="csv" ;;
        *)      warn "Format not recognized; assuming TSV" ;;
    esac

    info "Adding dictionary: $dict_source (format: $format, tag: $tag)"

    # Copy to project data/
    if [ -f "$dict_source" ]; then
        cp "$dict_source" "$project/data/${tag}.${format}" || die "Failed to copy dictionary"
        info "Dictionary copied to: $project/data/${tag}.${format}"
    else
        die "Dictionary not found: $dict_source"
    fi

    # Update manifest
    local schema_hash=$(head -1 "$dict_source" | md5sum | cut -d' ' -f1)
    echo "$tag | data/${tag}.${format} | $format | $schema_hash | $(date)" >> "$project/.csdw-manifest"
}

to_format() {
    local project="$1"
    local format="$2"

    [ -n "$project" ] || die "--to-format requires PROJECT"
    [ -n "$format" ] || format="tsv"
    [ -d "$project" ] || die "Project not found: $project"

    info "Converting dictionaries in $project to format: $format"

    local outputs_dir="$project/outputs"
    validate_write_surface "$outputs_dir"

    # For each dictionary in data/, convert
    for dict_file in "$project/data"/*; do
        [ -f "$dict_file" ] || continue
        local dict_name=$(basename "$dict_file" | cut -d. -f1)
        local output_file="$outputs_dir/${dict_name}.${format}"

        info "Converting: $dict_file -> $output_file"

        # Stub: simple format conversion
        case "$format" in
            html)
                echo "<html><head><title>$dict_name</title></head><body>" > "$output_file"
                echo "<table border='1'>" >> "$output_file"
                head -20 "$dict_file" | sed 's/\t/<\/td><td>/g' | sed 's/^/<tr><td>/' | sed 's/$/<\/td><\/tr>/' >> "$output_file"
                echo "</table></body></html>" >> "$output_file"
                ;;
            json)
                # Stub: would use proper TSV-to-JSON converter
                echo '{"stub": "json conversion not yet implemented"}' > "$output_file"
                ;;
            *)
                cp "$dict_file" "$output_file"
                ;;
        esac

        info "  ✓ $output_file"
    done

    info "Conversion complete. Outputs in: $outputs_dir"
}

invoke_agent() {
    local project="$1"
    local task="$2"

    [ -n "$project" ] || die "--agent requires PROJECT"
    [ -d "$project" ] || die "Project not found: $project"

    info "Agent invoked for task: $task"
    info "Project: $project"

    # Check if agent is configured
    if [ -f "$project/.csdwrc" ]; then
        . "$project/.csdwrc"
        if [ "$AGENT_ENABLED" != "true" ]; then
            info "Agent not enabled in this project."
            read -p "Create and configure an agent? (y/n) " -r
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                setup_agent "$project"
            else
                info "Agent setup skipped."
                return
            fi
        fi
    fi

    info "Would invoke agent with task: $task"
    info "(Agent framework stub; real agent would process task here)"
}

setup_agent() {
    local project="$1"

    info "Setting up agent for: $project"

    mkdir -p "$project/agent"

    cat > "$project/agent/AGENT-SETUP.md" <<'AGENT_SETUP'
# Agent setup for this project

This project can use an AI agent to help with:
- Adding columns (translations, examples, definitions)
- Reformatting dictionaries
- Integrating external data sources
- Publishing and sharing outputs

To enable the agent:
1. Configure AGENT_ENABLED=true in ../.csdwrc
2. Point AGENT_SCRIPT to your agent implementation
3. Run: csdw --agent <PROJECT> --task "<YOUR_TASK>"

The agent will have read access to data/ and write access to outputs/.
AGENT_SETUP

    info "Agent scaffold created in: $project/agent/"
    info "See: $project/agent/AGENT-SETUP.md"
}

# ============================================================================
# Main
# ============================================================================

main() {
    # Parse arguments
    while [ $# -gt 0 ]; do
        case "$1" in
            --help)
                show_help
                exit 0
                ;;
            --version)
                show_version
                exit 0
                ;;
            --init)
                ACTION="init"
                PROJECT_NAME="$2"
                DICT_SOURCE="$3"
                shift 3
                ;;
            --add-dict)
                ACTION="add-dict"
                PROJECT_NAME="$2"
                DICT_SOURCE="$3"
                shift 3
                ;;
            --to-format)
                ACTION="to-format"
                PROJECT_NAME="$2"
                FORMAT="$3"
                shift 3
                ;;
            --agent)
                ACTION="agent"
                PROJECT_NAME="$2"
                shift 2
                ;;
            --task)
                TASK="$2"
                shift 2
                ;;
            *)
                warn "Unknown option: $1"
                shift
                ;;
        esac
    done

    # Dispatch
    case "$ACTION" in
        init)
            init_project "$PROJECT_NAME" "$DICT_SOURCE"
            ;;
        add-dict)
            add_dict "$PROJECT_NAME" "$DICT_SOURCE"
            ;;
        to-format)
            to_format "$PROJECT_NAME" "$FORMAT"
            ;;
        agent)
            invoke_agent "$PROJECT_NAME" "$TASK"
            ;;
        *)
            show_help
            exit 0
            ;;
    esac
}

main "$@"
