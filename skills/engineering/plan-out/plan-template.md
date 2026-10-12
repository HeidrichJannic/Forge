---
type: plan
status: draft # draft | in-review | approved | in-progress | done
date: YYYY-MM-DD
lane: medium # medium | large
source: <path to the feature file or brainstorm note, or "section 2">
personal-data: false
---

# <Feature> – Plan

## 1. Summary

<One paragraph: what we build and the most important design choice.>

## 2. Goal

<Why: which problem, for whom, what changes when it ships. Never the mechanism.>

### Request (only if the input was a description)

<The request as I confirmed it, word for word.>

## 3. Scope

In scope:

- <item>

Out of scope:

- <item> – <why: later, rejected, other feature>

## 4. Approach

<Modules touched, new or changed, data flow. Name the reference module for each pattern. Flag every new pattern and link its decision.>

### Interfaces (only if a contract changes)

<Per endpoint, message, command or public function: inputs with validation, outputs, errors, authorization rule.>

### By example (only if a contract or data changes)

Illustrative, not a contract. Real values, no placeholders.

```text
Request:  <realistic request>
Success:  <realistic result>
Failure:  <most likely failure>
```

### Data (only if persisted data changes)

<New or changed structures, migration, effect on existing data, retention. One record before and after.>

### Personal data (only if personal-data is true)

<Which data, of whom, why it is needed, where it is stored, how it is deleted, whether it leaves the EU.>

## 5. Acceptance criteria

Given/When/Then with stable IDs. Each tagged with the layer that proves it. Each edge case names who can cause it.

```gherkin
@integration
Scenario: AC-1 – <behavior>
  Given <state>
  When <action by a named actor>
  Then <observable result>
```

## 6. Work items

The checkboxes are the build state. `/hammer-time` works through them in order and ticks each one.
Each work item leaves the `blocking` verify commands green. A phase is a review stop. "Releasable" says whether the system can ship after the phase.

### Phase 1 – <name> (releasable: yes | no)

- [ ] W1 – <work item> · AC-1, AC-2 · test-first
  - Files: <new and changed files>
  - Done when: <observable result>

### Phase 2 – <name> (releasable: yes | no)

- [ ] W2 – <work item> · AC-3 · test-after
  - Files: <...>
  - Done when: <...>

## 7. Risks and debt

| Risk or debt | Why acceptable or how handled | Trigger to pay back |
| --- | --- | --- |

## 8. Review findings

Written from the review panel. Each finding has one resolution: Fixed, Guarded, Accepted (with reason) or Rejected (with reason).

### Staff engineer

### Red team

### Compliance (only if personal-data is true)

## 9. Decisions and open questions

- YYYY-MM-DD – Agreed: <X over Y> – <why>
- Assumption: <assumption> – <what changes if it is wrong>
- Open: <question>

## 10. Build log

Empty until `/hammer-time` runs.
