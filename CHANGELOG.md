# Changelog

All notable changes to forge. Format: [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). Versions: [Semantic Versioning](https://semver.org/).

## [Unreleased]

## [0.3.2] – 2026-10-12

### Changed

- Questions in every forge skill: in my language, in plain words, without section numbers or template names, concrete with what was found, at most 5 per round, forge terms explained on first use.
- `base-kit` shows a short summary of the scan first and asks four concrete questions: personal data, areas to ask about first, check commands, order of tests and code.

## [0.3.1] – 2026-10-12

### Changed

- forge moved to the public repository `HeidrichJannic/Forge` under the MIT license. It replaces `agentic-toolkit` and its `project-blueprint` skill, which `project-up` superseded.

### Upgrade

- Remove the old marketplace and add the new one: `/plugin marketplace remove forge`, then `/plugin marketplace add HeidrichJannic/Forge` and `/plugin install forge@forge`.

## [0.3.0] – 2026-10-12

### Changed

- Layout like a plain skills repository: the repository root is the plugin, skills live in `skills/engineering/` and `skills/productivity/`, and `plugin.json` lists each one.
- All texts use the short skill names, e.g. `/plan-out` instead of `/forge:plan-out`.

### Added

- `tldr` and `wdym` under `skills/productivity/`.

### Upgrade

- Run `/plugin marketplace update forge`, then restart Claude Code. Remove other copies of `tldr` and `wdym`.

## [0.2.0] – 2026-10-12

### Changed

- Skills renamed: `setup` → `base-kit`, `plan` → `plan-out`, `build` → `hammer-time`, `review` → `sus`, `learn` → `brain-gain`, `drift` → `health-check`.
- `base-kit` mode `check` is now `ready`.
- `doc-it` now also draws and updates Mermaid diagrams from the code.
- `base-kit` stops in a repository with no `docs/` and no code and sends you to `project-up` first.

### Removed

- `diagram` skill. `doc-it` does its work.

### Upgrade

- In each repository, run `/forge:base-kit` once. It sets `forge-version` to 0.2.0.

## [0.1.0] – 2026-10-12

### Added

- Core rules with lanes and Definition of Done, added to the session by a SessionStart hook only in repositories with `.forge/context.md`. The hook also reports readiness, bootstrap, version drift and the next open work item.
- Overlay templates: `context.md`, `memory.md` (decisions and correction counts), `baseline.md`.
- Bootstrap for repositories without code: one skeleton plan creates the structure and the verify commands.
- Skills: `setup`, `plan`, `build`, `review`, `drift`, `learn`, `diagram`.
- Existing skills taken over unchanged: `sparring`, `doc-it`, `project-up`.
- Subagents: `tester` (independent tests, test-first and test-after) and `reviewer` (read-only design and change review with staff engineer, red team and compliance briefs).
