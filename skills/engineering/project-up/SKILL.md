---
name: "project-up"
description: "Plan a new project step by step: idea, tech stack, code conventions, folder structure and MVP. Then write the confirmed plan as Markdown files."
argument-hint: "[project idea]"
disable-model-invocation: true
---

# ProjectUp

Take my project idea to a confirmed plan in `docs/`.

My idea: `$ARGUMENTS`
If that is empty, ask me for my idea first.

Go through these steps in order:

1. Idea – ask me in rounds until the idea is clear, then confirm a summary with me.
2. Tech stack – use my preferences, recommend the rest.
3. Code conventions – use mine, fill the rest with the stack's standards.
4. Folder structure – pick the pattern that fits the project.
5. Confirm the foundation – wait for my explicit OK.
6. MVP plan – wait for my explicit OK.
7. Write the files under `docs/` and give me a short wrap-up.

Finish each step before you start the next. Write no files before my OK in step 5 and step 6.

I can go back to an earlier step at any time. If an answer changes an earlier decision,
update it and everything that depends on it, and tell me what changed.

## How to ask

These rules apply to every step.

Ask your questions with a question tool if one is available, otherwise in plain text.

There is no limit on rounds. I'd rather answer more questions than get a plan built on guesses.

Every question must change something in the plan. No filler questions.

Ask concrete questions. Not "Who is it for?" but "Is this for you, a specific group,
or public users who sign up?"

Never ask what I already answered.

If I say "just decide", decide and record it as an assumption.

## 1. Idea

Before round 1, take everything I already told you. Then ask in rounds until you could
describe the project in a way I'd recognize as my idea, with no important gaps left.

Start with what is most unclear. Round 1 asks what changes the plan the most.

Cover:
- Problem and target user
- Target market: which countries or regions
- Platform: web, mobile, desktop, API, CLI
- The 3-5 things a user must be able to do
- Accounts, login, multi-user, roles
- Money: payments, subscriptions, marketplace
- Data: what gets stored, files and media, realtime, and how sensitive it is:
  personal, payment, health or none
- Criticality: internal or customer-facing, revenue-relevant, what happens if it fails
- External integrations: APIs, AI, email, maps, ...
- Scale: users at launch and later, hobby tool or business
- Who builds it: team size, time budget, experience
- Who writes the code: people by hand, people with AI assistance, or mostly an AI coding agent
- Project name (a working title is fine)

In later rounds, go deeper into what the answers opened up.

Don't talk about technologies in this step. It's about what gets built, not how.

From data, market and sector, name the regulations that likely apply, e.g. GDPR in the EU,
as points for me to verify.

Then summarize the idea by the topics above, with every capability I described.
Continue when I confirm.

## 2. Tech stack

Ask me what I want to build with.
Ask per layer the project needs: languages and frameworks for backend and frontend,
database, cloud and hosting, services I have accounts for or experience with,
and what I don't want.

Use my preferences. If one fits the project badly, tell me the problem and the
alternative, and let me decide.

For every layer without a preference, recommend what fits best. Weigh in this
order: requirements, scale target, my experience, operating effort.

Size the stack for the scale, criticality and data protection needs I named.
No caches, queues, microservices or separate auth servers unless the requirements need them.

If two options are close, show both with one line of trade-off and recommend one.

Show a table: layer, choice, why for this project, mine or yours. Continue when I confirm.

## 3. Code conventions

Propose conventions for the stack, but never set them without asking me.

Ask whether I have my own conventions: a style guide, config files like `.editorconfig`,
linter or formatter configs, or a project to take them from. If I do, read them if you can.
They are the base.

Fill everything they don't cover with the standards of the chosen stack: the official
style guide and the usual formatter and linter, with their common defaults.

Show the proposal compactly, grouped by general, backend and frontend:
- Formatting: indentation, line length, quotes, and the tool that enforces it
- Linting and static analysis: tool and rule set
- Naming: files, types, functions, anything stack-specific
- Patterns: the few rules that shape the code, e.g. dependency injection, state, error handling
- Documentation and tests: what gets documented, test framework, where tests live
- Language of code and comments

Mark what comes from me and what is a stack default.

Prefer rules a tool can enforce over prose rules. Keep the list short.

Ask me for changes and additions. Continue when I confirm.

## 4. Folder structure

Pick the code structure that fits this project, not the most impressive one.
Consider general patterns and the platform's own, e.g. MVVM on mobile.
Combining patterns is fine. Follow each framework's own layout instead of fighting it.

Weigh:
- Fit: number and independence of the features, the stack's conventions
- Scalability: reaches the scale I named in users, code and team size without
  restructuring, but no heavier than that
- Readability: a new developer finds a feature's code without a guide. Few levels, obvious names
- Maintainability: a change to one feature touches few places. Boundaries block wrong dependencies

Don't over-structure. For a solo developer and a small app, keep projects and layers few.

If I have my own layout, use it as the base and only point out where it conflicts with the project.

Show:
- The pattern in one or two sentences, and why it beats the nearest alternative
- The tree with real names and the features from step 1, a short comment on
  non-obvious folders, and the `docs/` folder

Ask me for changes. Continue when I confirm.

## 5. Confirm the foundation

Post one compact summary of everything decided so far:
- The idea in one sentence, target user, platform, project name, scale target
- Every capability I described
- The tech stack as a table
- The code conventions as a short list
- The folder structure: pattern name and top-level tree
- The assumptions you made for me

Before you send it, re-read my first message and all my answers. Check that every
capability I described is in the summary.

Ask: "Does this match? Anything to change before I plan the MVP?"

Apply every change. Re-check what depends on it, e.g. a stack change can change
conventions and structure. Show me the updated parts.

Continue only after my explicit OK.

## 6. MVP plan

Propose the MVP: the smallest version that delivers the core value to a real user.

Be opinionated. Users usually over-scope. Move nice-to-haves to a "Later" list with
a one-line reason each, e.g. admin dashboards, analytics, social features, dark mode,
multiple languages, native apps when web works.

Write each MVP feature as a user action, e.g. "User can create a workout plan and share it via link".

Every capability I described goes either into the MVP or into "Later". None disappears.

Legal must-haves, e.g. privacy policy or account deletion, go into the MVP, not into "Later".

Drop stack parts and folders that only "Later" features need, and tell me.

Plan the build order: setup first, then all MVP features. What others build on comes first.
For each, say what it must be able to do when it's done and what it depends on. No how-to steps.

Estimate the effort per feature and for the whole MVP:
- Use the build mode from step 1. If I named none or a mix, give both: by hand and with an AI agent.
- With an AI agent only writing code gets much faster. Estimate separately what doesn't:
  review and testing, design and product decisions, setting up accounts, cloud resources
  and keys, integrating and debugging external services, app store reviews.
- Give ranges like "2-4 days" and the assumption behind them.
- Check the total against my time budget. If it doesn't fit, cut scope, don't stretch the estimate.

Show the MVP features with their estimates, the "Later" list and the implementation plan.
Ask: "Is this the right MVP? Anything to move in or out?"

Apply changes. Continue only after my explicit OK.

## 7. Write the docs

Write the files into `docs/` in the current working directory, in the language I wrote in
unless I ask for another. If `docs/` or any of the files already exist, ask me before overwriting.

Each file must contain:

| File | Must contain |
|------|--------------|
| `docs/README.md` | One line per existing folder: what lives there. The rule "one fact, one place" |
| `docs/requirements/requirements.md` | One-sentence pitch. Problem and target user. Every capability I described, marked MVP or Later with a link to the plan. Constraints: platform, target market, data sensitivity, criticality, scale target, team, build mode, time budget, integrations. Regulations to verify. Assumptions and open questions, if any |
| `docs/plans/mvp-plan.md` | MVP goal. Features as user actions, each with an effort range. Total effort with its build mode, the parts that don't shrink with an AI agent, and the fit to my time budget. Link to the implementation plan |
| `docs/plans/mvp-implementation.md` | Setup and the MVP features in build order. For each: what it must be able to do when done, and what it depends on. No how-to steps |
| `docs/plans/feature-plan.md` | Every feature not in the MVP: why it can wait, what it adds to stack or structure. Ordered by how soon it likely follows |
| `docs/architecture/tech-stack.md` | Per layer: choice and why for this project |
| `docs/architecture/folder-structure.md` | The pattern and why it fits. The folder tree with short comments, only folders the MVP uses. What may depend on what, and where new code goes |
| `docs/architecture/code-conventions.md` | The conventions from step 3, grouped by general, backend, frontend |
| `docs/decisions/NNNN-<topic>.md` | Only for decisions where a real alternative was weighed. Each: context, decision, rejected alternatives with reasons, consequences, date. No folder if there are none |

Lay out each file as you see fit. Keep it scannable, readable in a few minutes.

Put each fact in exactly one file and link to it from the others. MVP features only in
`mvp-plan.md`, Later features only in `feature-plan.md`, the stack only in `tech-stack.md`,
the folder tree only in `folder-structure.md`.

Create a file only if it has real content. No empty folders, no placeholder files.
Always create the three architecture files, even if they are short.

Write only what I confirmed in steps 5 and 6. No new decisions.

Use relative links. Check that every link points to a file you created.

Then reply in 3-5 lines: which files you created, the MVP in one sentence, the stack in
one line, and the most important open question, if any. Don't paste the documents.
