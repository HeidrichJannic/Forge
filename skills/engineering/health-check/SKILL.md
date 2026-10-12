---
name: health-check
description: Read-only check for drift between the forge plugin, the .forge/ overlay and the code - versions, shadowed skills, verify commands, stale baseline entries, expired exceptions, stuck plans, and context facts that no longer match the code.
disable-model-invocation: true
---

# HealthCheck

Find where forge, the overlay and the code no longer agree. Report and propose. Change nothing.

If `.forge/context.md` does not exist, tell me to run `/base-kit` and stop.

## Checks

Run every check. For each one: OK, or the finding with evidence and the proposed action.

1. **Version.** `forge-version` in `.forge/context.md` against the version in [`plugin.json`](${CLAUDE_PLUGIN_ROOT}/.claude-plugin/plugin.json). If they differ, read [`CHANGELOG.md`](${CLAUDE_PLUGIN_ROOT}/CHANGELOG.md) and name the changes that affect this overlay. Propose `/base-kit` to update.
2. **Duplicates.** Project skills in `.claude/skills/` and personal skills in `~/.claude/skills/` with a forge skill name: `project-up`, `base-kit`, `doc-it`, `plan-out`, `hammer-time`, `sus`, `brain-gain`, `health-check`, `sparring`, `tldr`, `wdym`. Both copies load, the short name stops being unique, and the copies drift apart. Name them so I keep one source.
3. **Verify commands.** Each command still exists: scripts, project files and tools it calls are present. Compare with the CI steps. Name commands CI runs that forge does not, and the other way round.
4. **Baseline.** Run the verify commands. Name entries that no longer fail or whose count is too high. Name failures outside the baseline.
5. **Exceptions and constraints.** Exceptions past their end date. Constraints past their review date.
6. **Plans.** Plans with `status: in-progress` and no commit for 14 days or more. Plans with `status: approved` whose work items are already in the code. Plans with `status: done` with unchecked work items.
7. **Context against code.** Versions and frameworks in `.forge/context.md` against the project files. Modules and reference modules that no longer exist. Risk area paths that no longer exist.
8. **Memory.** Entries in `.forge/memory.md` that the docs or the context now state. Propose to delete them there.
9. **Docs.** Do not compare all docs yourself. If the checks above show doc drift, tell me to run `/doc-it` without a topic in a new session.

## Output

A table: check, result, finding, proposed action. Most urgent first.
Then one line: the most important action.
Apply nothing. Each fix goes through the skill that owns it: `/base-kit`, `/doc-it`, `/brain-gain`.
