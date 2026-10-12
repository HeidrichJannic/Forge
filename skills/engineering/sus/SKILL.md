---
name: sus
description: Let the independent forge reviewer check the current change against the plan, the forge context and the review checklist, with a security and personal-data lens. Returns findings and a verification guide.
argument-hint: "[base branch or plan file]"
disable-model-invocation: true
---

# Sus

Get an independent review of the current change. `/hammer-time` starts the reviewer for medium and large lanes. Use this skill for changes made without it.

Input: `$ARGUMENTS`

- A branch name: use it as the diff base.
- A plan file: review against that plan. The diff base is the merge base with the default branch.
- Empty: the diff base is the merge base with the default branch from `.forge/context.md` section 3. Find the forge plan whose slug (file name without date) matches the current branch, if there is one.

If `.forge/context.md` does not exist, stop and tell me to run `/base-kit` first.
If there are no changes against the base, tell me and stop.

## Steps

1. Collect the references: diff base, plan path (if any), `.forge/context.md`, `.forge/baseline.md`.
2. Start the `forge:reviewer` subagent in change-review mode. Give it only these references and the [checklist](${CLAUDE_SKILL_DIR}/checklist.md) path. Never your reasoning about the change.
3. Show me the result:
   - Verdict: ready, ready after fixes, or not ready
   - Findings by severity: blocker, should-fix, note. One line each, with file and line
   - Escalations: unchanged, word for word
   - The verification guide
4. Ask me which findings to fix. Fix only those. Then run the `blocking` verify commands and show the output.
5. After larger fixes, offer a second review.

Never answer an escalation for me. Never mark a finding as fixed without the change and a green verify run.
