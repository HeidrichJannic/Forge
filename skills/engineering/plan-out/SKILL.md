---
name: plan-out
description: Turn a feature file from doc-it or a free description into a reviewed implementation plan in .forge/plans/, with acceptance criteria, work items, test modes and phases that keep the build green.
argument-hint: "[feature file or description]"
disable-model-invocation: true
---

# PlanOut

Turn one feature into a plan that `/hammer-time` can work through step by step.

Input: `$ARGUMENTS`

- A path to a file, e.g. a feature file from `/doc-it`: read it in full. It is the main source.
- A description: take it and everything I confirmed in this conversation.
- Empty: ask me which feature.

Read [`${CLAUDE_PLUGIN_ROOT}/core/asking.md`](${CLAUDE_PLUGIN_ROOT}/core/asking.md) and follow it.

If `.forge/context.md` does not exist, stop and tell me to run `/base-kit` first.

Go through these steps in order:

1. Ground – read the input, the context and the code.
2. Size – pick the lane.
3. Clarify – ask me what blocks the plan.
4. Draft – write the plan.
5. Review panel – let independent reviewers challenge it.
6. Refine – work through the open points with me.
7. Approve – set the status and hand over to `/hammer-time`.

The plan file is the record of what we agreed. Write every agreement into it, not only into the chat.
Write the plan in English, in ASD-STE100 Simplified Technical English.
Write no production code and no tests. The by-example samples are the only code-like content.

## 1. Ground

- Read `.forge/context.md`, `.forge/memory.md` and the docs the feature touches.
- Read the code of every module the feature touches, and the reference module for each pattern you will use. The plan names real files and real patterns.
- If the docs and the code disagree about something the plan depends on, ask me which one is right.

Keep three lists apart:

- Asked for: what the input states.
- Implied: what must be true but was never stated.
- Assumed: a mechanism the input names. Treat it as a proposal. The architecture may already solve it differently.

## 2. Size

Use the lanes from the forge core rules. Tell me the lane and why.

- Trivial or small: tell me that no plan is needed and that `/hammer-time <description>` does it with a short inline plan. Stop unless I want a plan anyway.
- Large: if the requirement is unclear or has several real approaches, recommend `/sparring` first. Continue only if I say so.
- Medium: continue.

If `.forge/context.md` says `ready: false`, tell me: a medium or large plan can be written, but `/hammer-time` will not start it until `/base-kit ready` reports `ready: true`.

If `.forge/context.md` says `bootstrap: true`, this is the skeleton plan. It builds the project structure from the architecture docs. Its last work item adds the verify commands to section 9 of `.forge/context.md`. Size it as medium.

## 3. Clarify

Collect gaps, contradictions and ambiguities. Split them:

- Blocking: two readings lead to different work, or a basic question is open (who uses it, what triggers it, which data). Ask me.
- Not blocking: choose what a careful engineer would choose. Record it as an assumption in section 9.

## 4. Draft

Copy [plan-template.md](${CLAUDE_SKILL_DIR}/plan-template.md) to `.forge/plans/YYYY-MM-DD-<slug>.md` with `status: draft`. Leave out subsections marked "only if" when they do not apply. Keep all section numbers and sections 8 and 10. Never leave a `<placeholder>`.

If the input was a description, write the request as I confirmed it, word for word, into section 2 under "Request", and set `source: section 2`.

Rules for the content:

- Decisions on public contracts, schemas, persisted formats and events are one-way: give them care with edge cases and versioning. Internal structure is two-way: take the simplest shape that works today.
- Sort every edge case into one: handle it (likely and costly, e.g. authorization, isolation, money, data loss), guard it (fail loudly, cheap), or document it as an assumption. Ask "who produces this input?". If you cannot name the caller, code path or state that produces it, it does not exist.
- No abstraction without three real users. Every component maps to a requirement or a recorded decision. Cut the rest.
- A new pattern, module boundary, persistence or integration style is a decision for me. Mark it in section 4 and ask me in step 6.
- Set `personal-data: true` if the feature creates, reads, changes or deletes personal data, or if `.forge/context.md` turns the compliance check on and the feature touches such data.

Work items:

- One work item is one coherent change that can be built, tested and committed alone. It leaves the `blocking` verify commands green.
- Each names its acceptance criteria and its test mode. `test-first` for bug fixes, precise rules, calculations and business logic. `test-after` for UI, integration code and interfaces that are still unclear. Default from `.forge/context.md`.
- Group work items into phases. A phase is a review stop for me. Say per phase if the system is releasable after it.
- The delivery part never widens the scope. A gap you find while slicing goes into section 9.

## 5. Review panel

Before I see the draft, start one `forge:reviewer` subagent in design-review mode per brief in [panel.md](${CLAUDE_SKILL_DIR}/panel.md), in parallel: staff engineer and red team always, compliance only if `personal-data: true`.

Give each one only the brief, the plan path, the source (a file path, or "section 2 of the plan"), `.forge/context.md` and the doc paths the plan touches. Never your reasoning or this conversation.

Never review the plan in place of the panel, and never invent findings. Copy each panel finding into section 8 with exactly one resolution:

- Fixed: the plan changed. Say what.
- Guarded: a loud failure covers it. Name the guard.
- Accepted: kept as risk, debt or assumption, with the reason.
- Rejected: the finding is wrong. Say why.

A finding that needs my judgment goes into section 9 as an open question. Never resolve it silently.

## 6. Refine

Set `status: in-review`. Show me in the chat:

- The summary in 2-3 sentences and the lane
- The phases with their work items, one line each
- Decisions I must make, including new patterns
- Open questions and important assumptions
- Panel findings that need my judgment

Work through my answers. Write each agreement into section 9 with the date and the reason. Show me only the parts that changed.

## 7. Approve

Set `status: approved` only after my explicit OK. Never before.

Then reply in 3-5 lines: the plan path, the number of phases and work items, the most important decision, and the next step `/hammer-time .forge/plans/<file>`.
