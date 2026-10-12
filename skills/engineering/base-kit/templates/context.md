---
forge-version: 0.0.0
ready: false
bootstrap: false
---

# forge context – <project name>

Facts that forge needs about this repository. One fact, one place: if the docs already state a fact, link to it. Do not copy it.
Keep all section numbers. Write "none" where a section has no content.

## 1. Project

<One paragraph: what the project is, for whom, current phase. Link to the requirements doc.>

## 2. Architecture and boundaries

<Link to the architecture docs.>

| Module or project | Purpose | May depend on |
| --- | --- | --- |
| | | |

Reference modules per pattern:

| Pattern | Reference module or file |
| --- | --- |
| | |

## 3. Conventions

- Code conventions: <link>
- Branch names: <e.g. feature/<slug>, fix/<slug>>
- Commit messages: <e.g. Conventional Commits>
- Default branch: <main>

## 4. Data protection

- Personal data: <yes or no. If yes: which data, of whom>
- Storage location and region: <e.g. Azure Germany West Central>
- Data leaves the EU: <no, or which service>
- Retention and deletion: <rule or link>

## 5. Risk areas

- Ask before you change: <paths or areas, e.g. auth, migrations, infrastructure, billing>
- Never change: <paths, e.g. generated code, vendored code>

## 6. Dependencies

- New dependencies: ask first unless listed below.
- Allowed without asking: <list or "none">
- Not allowed: <list or "none">

## 7. Documents

- Docs root and map: <docs/README.md>
- Docs plans with feature status: <paths, e.g. docs/plans/mvp-plan.md, docs/plans/feature-plan.md>
- Feature files: <folder>
- Decision records: <folder or "none">
- forge plans: `.forge/plans/`

## 8. Test strategy

- Default test mode: <test-first or test-after>
- Test projects and locations: <list>
- Layers: <unit, integration, e2e and what each covers>

## 9. Verify commands

Run from the repository root. `blocking` commands must show no failure outside the baseline. `signal` commands are reported, never blocking.

| Name | Command | Tier | Checks |
| --- | --- | --- | --- |
| build | | blocking | |
| test | | blocking | |
| lint | | blocking | |

If the repository has no code yet: write "none yet – added by the skeleton plan" and set `bootstrap: true`.

## 10. Constraints

Facts I cannot change. Review each one on its date.

| Constraint | Why | Review on |
| --- | --- | --- |
| none | | |

## 11. Exceptions

Approved deviations from a forge core rule. Each one ends on its date.

| Rule | Deviation | Reason | Until |
| --- | --- | --- | --- |
| none | | | |

## Readiness

<Written by /base-kit ready: the date of the last check and what is missing for ready: true.>
