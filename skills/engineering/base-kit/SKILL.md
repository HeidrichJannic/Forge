---
name: base-kit
description: Set up or update the forge overlay in this repository (.forge/ with context, memory and baseline), check readiness, or record a baseline entry, constraint or exception.
argument-hint: "[ready | baseline | constraint | exception]"
disable-model-invocation: true
---

# BaseKit

Give this repository a forge overlay, or check and update the one it has.

Mode: `$ARGUMENTS`

Pick exactly one mode:

- Empty: set up the overlay, or update it if `.forge/` exists.
- `ready`: run the readiness check only.
- `baseline`: run the verify commands and let me decide about failures outside the baseline.
- `constraint` or `exception`: record one entry in `.forge/context.md`.

Read [`${CLAUDE_PLUGIN_ROOT}/core/asking.md`](${CLAUDE_PLUGIN_ROOT}/core/asking.md) and follow it.

Change only `.forge/` and, after my OK, `.claude/settings.json`. No code, no commits without my OK.

If the repository has no `docs/` and no code, stop. Tell me to run `/project-up` first.

## Overlay files

| File | Holds | Template |
| --- | --- | --- |
| `.forge/context.md` | Project facts, data protection, risk areas, verify commands, constraints, exceptions, readiness | [context.md](${CLAUDE_SKILL_DIR}/templates/context.md) |
| `.forge/memory.md` | My decisions and corrections that must hold next time | [memory.md](${CLAUDE_SKILL_DIR}/templates/memory.md) |
| `.forge/baseline.md` | Known verify failures that I accepted | [baseline.md](${CLAUDE_SKILL_DIR}/templates/baseline.md) |
| `.forge/plans/` | Forge plans | Created by `/plan-out` |
| `.forge/learn/` | Proposals for forge itself | Created by `/brain-gain` |

## Set up or update

Go through these steps in order.

### 1. Scan

Find out as much as you can before you ask:

- `docs/README.md` and the docs it names: requirements, architecture, conventions, docs plans, decisions. Link to them in the context. Never copy them.
- Project and build files: solution and project files, `package.json`, `angular.json`, Dockerfiles, infrastructure code.
- CI files, e.g. `.github/workflows/`. Their build, test and lint steps are the first candidates for verify commands.
- Test projects and test frameworks.
- `CLAUDE.md` and `.claude/settings.json`.

If `.forge/` exists, read every file in it and take it as the base.

If the repository has no code yet, e.g. right after `/project-up`: write "none yet – added by the skeleton plan" under the verify commands and set `bootstrap: true`. The first forge plan then creates the skeleton, and its last work item adds the verify commands.

### 2. Ask

First show me what the scan found, in plain words, one line per topic: what the project is, stack, docs, tests, CI. Mark what is missing.

Then ask me in rounds about what the scan could not answer. Ask about topics, never about template sections.

On a new setup, always confirm these four topics with me, even if the scan found an answer. On an update, confirm only what changed. Use these questions as the model, filled with what you found:

- **Personal data:** "Which personal data does the project handle, and of whom? For example caller names and phone numbers. Where is it stored, and does any of it leave the EU?"
- **Areas to ask about first:** "Which parts must I ask you about before I change them? My proposal: `<real paths you found, e.g. auth, migrations, infrastructure>`." And: "Is there anything I must never change, e.g. generated code?"
- **Check commands:** Explain once: "After every step I run fixed commands to check the code. If a *blocking* command fails, the step is not done. A *signal* command is only reported." Then propose real commands from CI or the project files, one line each with its tier, and ask me to confirm or change them.
- **Order of tests and code:** "Should tests usually come first and the code after (test-first), or the code first and the tests after (test-after)? Bug fixes are always test-first." Recommend one, with the reason from this project.

### 3. Confirm

Show me the change list in plain words, one block per file: create or change, and what goes in, grouped by topic. No section numbers.
Ask: "Is this right? Anything to change before I write?"
Write nothing before my explicit OK.

### 4. Write

Write the overlay files from the templates. Set `forge-version` to the version in [`plugin.json`](${CLAUDE_PLUGIN_ROOT}/.claude-plugin/plugin.json).
Keep all section numbers of `context.md`. Write "none" where a section has no content. Never leave a `<placeholder>`.

### 5. Baseline

Skip this step if `bootstrap: true`.

Run every verify command. Show me each result.
For each failure, ask me: fix it now, accept it into the baseline with a reason, or change the command.
Write only the entries I accepted. Never add an entry on your own.

### 6. Readiness

Run the readiness check below.

### 7. Wrap up

Ask whether I want the marketplace and the plugin declared in `.claude/settings.json`, so the repository asks for forge when it opens. If yes, merge these keys into the file and keep all others:

```json
{
  "extraKnownMarketplaces": {
    "forge": { "source": { "source": "github", "repo": "HeidrichJannic/Forge" } }
  },
  "enabledPlugins": { "forge@forge": true }
}
```

Ask whether to commit `.forge/`. Then reply in 3-5 lines: files created or changed, the readiness result, the most important open point.

## Readiness check

`ready: true` needs all of these:

- Sections 1, 4, 5, 8 and 9 of `.forge/context.md` are filled. No placeholder is left anywhere.
- Every verify command exists and runs.
- Every `blocking` command shows no failure outside `.forge/baseline.md`.
- `.forge/memory.md` and `.forge/baseline.md` exist.
- `forge-version` matches the plugin version. If it does not, update the overlay first: compare it with the templates and add what is new.

With `bootstrap: true`: if the verify commands now exist and run, set `bootstrap: false` and check the rest. If not, `ready` stays false.

Set `ready` in the frontmatter. Write the date and every missing item into the section "Readiness". Tell me the result in plain words and the next step for each missing item.

## Baseline mode

Run the verify commands. Compare each failure with `.forge/baseline.md`.
For a new failure, ask me: fix, accept with a reason, or change the command.
For an entry that no longer fails, propose to remove it or to lower its count.
Write only what I confirm.

## Constraint and exception mode

Ask me for each field of the table row in context section 10 or 11. An exception needs the rule it deviates from, the reason and an end date. A constraint needs a review date.
Write the row after my OK. Replace the "none" row if it is the first entry.
