# forge core rules

This repository uses forge. These rules apply to every task here. They come from me, the developer of this repository.

## Start of every task that changes files

1. Read `.forge/context.md` and `.forge/memory.md`. Never ask me what they already answer.
2. Read the docs and the code the task touches. Existing patterns in this repository win over general best practice.
3. Pick the lane and tell me which one.

## Lanes

| Lane | Examples | Process |
| --- | --- | --- |
| Trivial | Typo, log text, rename, config value | Do it, run the verify commands. |
| Small | One change that follows an existing pattern exactly, a contained bug fix | Plan in 2-3 sentences, implement, test, verify, self-review with the review checklist. |
| Medium | New module, new pattern, anything that touches authentication, authorization, tenants, money or personal data | Approved forge plan from `/plan-out`, then `/hammer-time`. |
| Large | Unclear requirement, several real approaches, new system | `/sparring` first, then Medium. |

When unsure, take the more careful lane. A bug fix is always test-first: the test fails before the fix and passes after it.

If `.forge/context.md` says `ready: false`, take only trivial and small lanes. Tell me what is missing. Exception: with `bootstrap: true`, `/hammer-time` may build the one forge plan that creates the project skeleton and its verify commands.

## Rules

- Name the reference module you follow. Say every deviation from a pattern. Never invent a pattern silently.
- A new pattern, module boundary, persistence or integration style is my decision. Record it before you write code: in section 9 of the forge plan, or as a decision record where `.forge/context.md` section 7 says.
- A new dependency needs a check against `.forge/context.md`. If it is not listed there, ask me.
- Never weaken, skip or delete a test, and never disable a check, to get to green.
- Only I add baseline entries, constraints and exceptions. You propose them.
- An exception in `.forge/context.md` section 11 replaces the named rule until its date. After the date, the rule applies again: tell me. Constraints in section 10 are fixed facts.
- If a change touches personal data, say so. The compliance check in plan and review covers it. The legal decision is mine.
- No secrets, customer data or personal data in code, logs, test data, prompts or examples.
- Mark assumptions as assumptions. If two readings lead to different work, ask me.
- When I decide something that must hold next time and has no other place, add it to `.forge/memory.md` and tell me.
- When I correct you, add the correction under "Corrections" in `.forge/memory.md`, or raise its count. At count 3, suggest `/brain-gain`.

## Definition of Done

A change is done only when all of these are true. Report each one honestly.

- The `blocking` verify commands ran and show no failure outside `.forge/baseline.md`. Their output is in your report. No output, no done.
- The baseline did not grow. Entries the change fixed are removed or lowered.
- Tests exist per the test mode. A bug fix has a test that failed before the fix.
- Medium and large lanes: the `forge:reviewer` subagent reviewed the change. Every finding is fixed, rejected with a reason, listed as open, or given to me.
- Docs and diagrams the change made wrong are named, so I can run `/doc-it`.
- Deviations, skipped checks and open questions are named, not hidden.

## Skills

Flow: `/project-up` for a new project, then `/base-kit` → `/sparring` if the idea is unclear → `/doc-it` → `/plan-out` → `/hammer-time` → `/doc-it`.
Also: `/sus`, `/health-check`, `/brain-gain`.
These skills run only when I call them. You cannot start them. If one fits the task, tell me to run it.
