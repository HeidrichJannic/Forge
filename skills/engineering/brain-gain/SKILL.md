---
name: brain-gain
description: Turn a repeated correction, a review finding, an escaped bug or a retro insight into a forge change - root cause, gap, a new check or rule, and a regression check. Applies project changes in .forge/, writes proposals for the forge plugin.
argument-hint: "[what happened]"
disable-model-invocation: true
---

# BrainGain

Close a class of error, not only the single case. The next session in this repository, or in every repository, must not repeat it.

What happened: `$ARGUMENTS`
If that is empty, take it from this conversation. If the conversation has nothing, ask me.

Read [`${CLAUDE_PLUGIN_ROOT}/core/asking.md`](${CLAUDE_PLUGIN_ROOT}/core/asking.md) and follow it.

If `.forge/context.md` does not exist, stop and tell me to run `/base-kit` first.

Rule of three: what I had to correct or explain three times belongs in forge. The counts are under "Corrections" in `.forge/memory.md`. Earlier only if one case was expensive: security, data loss, production incident.

Go through these steps in order:

## 1. Facts

Write down what happened, where, and the evidence: commit, review finding, failing test, my correction in the chat. Facts only.

## 2. Root cause

Ask "why" until the answer is about the system that produced the work, not about the single result. Typical answers:

- The agent did not know a fact.
- The agent knew it, but nothing checked it.
- A rule was unclear.
- The docs were wrong.
- The reviewer had no reason to look there.

## 3. Gap and fix

| Gap | Fix | Where |
| --- | --- | --- |
| Missing or wrong project fact | Context entry | `.forge/context.md` |
| Same question asked again | Memory entry, or move the answer into the context | `.forge/memory.md` |
| Same accepted verify failure reported again | Baseline entry | `/base-kit baseline` |
| Same accepted review finding reported again | Exception or memory entry | `/base-kit exception` or `.forge/memory.md` |
| Missing check a tool can do | New or stricter verify command: lint rule, architecture test, scan | `.forge/context.md` section 9 |
| Missing or unclear rule for this project | Project rule | `CLAUDE.md` of the repository |
| Missing or unclear rule for every project | Core rule change | forge plugin |
| Skill, checklist or tester gap | Skill, checklist or agent change | forge plugin |

Prefer a check over a rule. Write a rule only for what no tool can check.
Never add a rule that repeats an existing one. Make the existing one sharper.

## 4. Regression check

Say how we will know the fix works: a test or check that fails on the old case, a verify command that catches it, or a task an agent can run again that failed before. No fix without a regression check.

## 5. Propose and apply

Show me the proposal: facts, root cause, gap, fix with its place, regression check. Wait for my OK.

- Project fix: apply it after my OK. For baseline entries, constraints and exceptions, tell me to run `/base-kit baseline`, `constraint` or `exception`. Then set the count of the correction in `.forge/memory.md` to 0.
- Plugin fix: never edit the installed plugin. Write the proposal to `.forge/learn/YYYY-MM-DD-<topic>.md`, starting with the frontmatter `scope: forge`. Ask whether to open an issue in `HeidrichJannic/Forge` with it.

Then reply in 2-3 lines: what changed, or where the proposal is.
