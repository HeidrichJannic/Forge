#!/usr/bin/env bash
# Adds the forge core rules and the repository state to the session context.
# Prints nothing when the repository has no forge overlay (.forge/context.md).
set -u
shopt -s nullglob

project="${CLAUDE_PROJECT_DIR:-$PWD}"
if [ ! -f "$project/.forge/context.md" ]; then
  top="$(git -C "$project" rev-parse --show-toplevel 2>/dev/null || true)"
  [ -n "$top" ] && project="$top"
fi
forge_dir="$project/.forge"
context="$forge_dir/context.md"

[ -f "$context" ] || exit 0

root="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}"

frontmatter_value() {
  # $1 = key, $2 = file. Reads "key: value" from the first lines of a file.
  sed -n '1,15p' "$2" | grep -m1 -E "^$1:" \
    | sed -E "s/^$1:[[:space:]]*//; s/[[:space:]]+#.*$//; s/[[:space:]]*$//; s/^[\"']//; s/[\"']$//"
}

cat "$root/core/rules.md"

plugin_version="$(grep -m1 '"version"' "$root/.claude-plugin/plugin.json" | sed -E 's/.*"version"[^"]*"([^"]+)".*/\1/')"
overlay_version="$(frontmatter_value forge-version "$context")"
ready="$(frontmatter_value ready "$context")"
bootstrap="$(frontmatter_value bootstrap "$context")"

echo
echo "## Files"
echo
echo "- Review checklist: $root/skills/engineering/sus/checklist.md"
echo "- How to ask me: $root/core/asking.md"
echo
echo "## State of this repository"
echo
echo "- forge plugin ${plugin_version:-unknown}, overlay ${overlay_version:-unknown}."
if [ -n "$plugin_version" ] && [ "$plugin_version" != "$overlay_version" ]; then
  echo "- The versions differ. Treat the repository as ready: false until I run /base-kit ready. Tell me to run /health-check first."
elif [ "$ready" = "true" ]; then
  echo "- ready: true. All lanes are open."
else
  echo "- ready: ${ready:-false}. Only trivial and small lanes are open. The section \"Readiness\" in .forge/context.md names what is missing."
fi
if [ "$bootstrap" = "true" ]; then
  echo "- bootstrap: true. The repository has no code yet. /hammer-time may build the one forge plan that creates the skeleton and the verify commands."
fi

found_plan=false
for plan in "$forge_dir"/plans/*.md; do
  status="$(frontmatter_value status "$plan")"
  case "$status" in
    approved|in-progress)
      found_plan=true
      next="$(grep -m1 -E '^[[:space:]]*- \[ \] W[0-9]+' "$plan" | sed -E 's/^[[:space:]]*- \[ \] //')"
      echo "- Forge plan .forge/plans/$(basename "$plan") is ${status}. Next work item: ${next:-none open}."
      ;;
  esac
done
if [ "$found_plan" = false ]; then
  echo "- No approved or active forge plan."
fi

exit 0
