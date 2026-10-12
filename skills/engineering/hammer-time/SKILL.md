---
name: hammer-time
description: Build an approved forge plan step by step - per work item tests from the independent tester, implementation, verify commands, tick and commit - then review, docs check and PR summary. Also builds trivial and small changes from a description.
argument-hint: "[forge plan file or change description]"
disable-model-invocation: true
---

# HammerTime

Implement a change step by step, with proof at every step.

Input: `$ARGUMENTS`

- A forge plan file in `.forge/plans/`: build it.
- A description: size it. Trivial and small: build it as described under "Trivial and small lanes". Medium or large: stop and tell me to run `/plan-out` first.
- Empty: list the forge plans with status `approved` or `in-progress` and ask me which one. If there are none, ask me what to build.

Read [`${CLAUDE_PLUGIN_ROOT}/core/asking.md`](${CLAUDE_PLUGIN_ROOT}/core/asking.md) and follow it.

If `.forge/context.md` does not exist, stop and tell me to run `/base-kit` first.

## Terms

- Default branch, branch names and commit messages: from `.forge/context.md` section 3. If it names none: `main`, `feature/<slug>` and Conventional Commits.
- Slug: the forge plan file name without the date and `.md`.
- Work-item base: the commit before the current work item started.
- Review base: the merge base of the current branch with the default branch.

## 0. Check

Read `.forge/context.md`, `.forge/memory.md` and `.forge/baseline.md`.

With a forge plan:

- The status must be `approved` or `in-progress`. Otherwise stop and tell me why.
- If `ready: false`, stop and list the missing items from the section "Readiness" of `.forge/context.md`. Tell me to run `/base-kit ready`. Exception: with `bootstrap: true`, build the skeleton plan. Its last work item writes the verify commands into section 9 of `.forge/context.md` after my OK. Then tell me to run `/base-kit ready`.
- Read the reference modules the plan names, and one or two sibling modules.
- If you are on the default branch, create `feature/<slug>` or the name the convention gives.
- Set the plan to `status: in-progress`.

## Trivial and small lanes

- Trivial: make the change, run the verify commands, report.
- Small: tell me the plan in 2-3 sentences and go on. Do the risk pass from step 1b. Write the tests yourself; a bug fix is test-first. Implement. Run the verify commands as in step 1d. Run the [review checklist](${CLAUDE_PLUGIN_ROOT}/skills/engineering/sus/checklist.md) and report the result. Make one commit. No tester, no plan file, no tick.

## 1. Work items

Take the first unchecked work item. For each one:

### a. Announce

Tell me the work item and its files in one line.

### b. Risk pass

Check if the work item touches authorization or tenant boundaries, new external input, personal data, error responses, a new dependency, or a risk area from `.forge/context.md`.
Say each hit in one sentence and how you handle it. Before you change a risk area marked "ask before you change", get my OK. If nothing applies, say "no risk hits".

### c. Tests and code

- `test-first`: start the `forge:tester` subagent in test-first mode with the plan path, the work item ID and its acceptance criteria. It returns tests that fail for the expected reason. Then implement until they pass.
- `test-after`: implement, then start `forge:tester` in test-after mode with the plan path, the work item ID, its acceptance criteria and the work-item base.

Give the tester only these references. Never your reasoning or your view of what is hard. You may switch the test mode of a work item, except for bug fixes. Say why.

When the tester returns:

- Questions or gaps: stop and ask me. Write my answer into section 9 of the plan.
- Failing test-after tests: fix the code, not the tests. If the plan is wrong, follow the rule below.

While you implement:

- Follow the reference module. Say every deviation.
- No dead code, no commented-out code, no debug output, no unrelated changes.
- Never weaken, skip or delete a test to get to green.
- If the plan is wrong or incomplete, stop and tell me what is missing. Update sections 5, 6 and 9 of the plan with my answer. If scope or acceptance criteria change, show me the change and continue only after my OK. Code never overrides the plan silently.

### d. Verify

Run every `blocking` verify command and the `signal` commands that cover the change.

- A `blocking` command is green when every failure matches `.forge/baseline.md` and no count is higher.
- A new failure caused by the change: fix it.
- A failure that existed before but is not in the baseline: stop and ask me. Never add a baseline entry yourself.
- If the change fixes a baseline entry, remove it or lower its count.
- If a command cannot run, say so. Never claim it passed.

### e. Tick and commit

- Tick the work item in the plan. Add a line to section 10: work item ID, commit subject, verify result in a few words.
- Commit the work item together with these plan changes. Use the commit convention and put the work item ID at the end, e.g. `(W3)`.

### f. Phase end

When the last work item of a phase is done, stop. Tell me in 3-5 lines what the phase delivered, the verify result, and anything that changed from the plan. Continue with the next phase after my OK.

## 2. Review

After the last phase, for medium and large lanes:

- Start the `forge:reviewer` subagent in change-review mode with the plan path, `.forge/context.md`, `.forge/baseline.md`, the review base and the [review checklist](${CLAUDE_PLUGIN_ROOT}/skills/engineering/sus/checklist.md) path. Never your reasoning.
- Fix every blocker and should-fix finding, or reject it with a reason. Fix, reject or list each note. Run the verify commands again. After large fixes, run the reviewer again.
- Give escalations to me word for word. Never answer them yourself.

## 3. Docs

Name each living doc or diagram the change made wrong, and the feature status in the docs plans (`.forge/context.md` section 7) that should change. Tell me to run `/doc-it <topic>`. It updates the text and the diagrams.

## 4. Wrap up

Set the plan to `status: done`. Commit the review fixes and the status change as `chore: finish <slug>`, or by the commit convention.

Write the pull request description:

- First line: forge <version> · plan <link> · tests: forge:tester · review: forge:reviewer, <verdict>
- Lane and work items
- Verify: table of command, tier, result
- Review: how each finding was resolved
- Verification guide from the reviewer
- Deviations from the plan, skipped checks, open questions

Ask whether to push the branch and open the pull request with it. Then reply in 3-5 lines: what was built, the test layers, the verify result, the most important open point.
