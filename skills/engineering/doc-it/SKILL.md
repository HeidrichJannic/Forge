---
name: "doc-it"
description: "Create or update the docs in docs/ for a topic, including Mermaid diagrams drawn from the code: a new feature, a changed feature, plans, architecture or decisions. Without a topic, document the decisions from the current conversation. If there are none, compare all docs with the code."
argument-hint: "[topic]"
disable-model-invocation: true
---

# DocIt

Bring `docs/` up to date for one topic. Write new docs or update the ones that exist, including their diagrams.

Topic: `$ARGUMENTS`

Pick exactly one mode:

- I gave a topic: document that topic.
- I gave no topic and this conversation holds decisions I confirmed: document those.
- I gave no topic and nothing was decided here: compare all docs with the code.

Go through these steps in order:

1. Collect – gather what is new.
2. Read – read the docs and the code it touches.
3. Close gaps – ask me in rounds until every entry can be written.
4. Confirm – show me the change list and wait for my explicit OK.
5. Write – small edits directly, new parts section by section.
6. Check – verify the result and give me a short wrap-up.

Write no files before my OK in step 4. Change only files under `docs/`. No code, no commits.

## How to ask

These rules apply to every step.

Ask with a question tool if one is available, otherwise in plain text.

Ask in rounds. One round holds every question you can ask now. A question that depends
on an answer still open waits for the next round.

Number each question and give your recommended answer.

Ask only what a doc entry can't be written without. No filler questions.

Finding facts is your job. Never ask me what you can look up in the docs, the files I
named or the code.

Never ask what I already answered.

If I say "just decide", decide and record it as an assumption.

If I leave a point open, record it as an open question in the docs. Never write it as a fact.

## 1. Collect

Take what is new from these sources:

- The topic and this conversation. Take only what I confirmed. A recommendation of yours
  counts only if I accepted it.
- Files I name, e.g. brainstorm notes. Read them in full.

Sort each point into a kind: new feature, change to an existing feature, plan or scope,
tech stack, folder structure, code conventions, requirements, or a decision where a real
alternative was weighed.

If a point can't be matched to exactly one existing feature, ask me which one I mean.

If there is nothing that changes the docs, tell me and stop.

## 2. Read

Read `docs/README.md` first. It says what lives where. Follow it.

If there is no README, read the whole `docs/` folder and take the layout from what exists.

If there is no `docs/` folder, stop and ask me where the docs live.

Read every doc a point touches, in full, before you plan an edit. Note every diagram in them.

Read the code the topic touches and compare it with those docs. When comparing all docs
with the code, go through every doc and check it against the repo.

Collect every difference:

- Documented, but the code does it differently
- In the code, but not documented
- Marked as done in the plan, but not in the code
- A diagram that shows something the code does differently

A feature the plan marks as planned and the code doesn't have yet is no difference.

## 3. Close gaps

Ask me about:

- What is missing to write an entry
- Points that contradict each other or the existing docs
- Every difference between code and docs: show both sides and ask me which one is right

Never resolve a contradiction or a difference yourself.

Go on when nothing is left that blocks an entry.

## 4. Confirm

Every fact lives in exactly one file. The other files link to it.

Decide for each point where it belongs, by the layout from step 2.

A new feature gets:

- Its own file in the folder the layout names for features. If there is none, use
  `docs/features/<name>.md`. It contains: what the feature is for and for whom, what the
  user can do, rules and edge cases, the technical approach, what it depends on, open questions.
- An entry in the plan that links to the file. If there is more than one plan and I
  didn't say which, ask me.

The status of a feature lives in the plan, on its entry: planned, in progress or done.
Never in the feature file. A new feature starts as planned. Change a status when I say
so or when the code shows it.

A decision where a real alternative was weighed gets its own record, if the docs keep
decision records. Don't rewrite old records. Mark them as replaced and link the new one.

If a change affects other docs, include them. E.g. a stack change can change conventions
and folder structure.

Diagrams: add one where a doc explains something text cannot show well, and update every
diagram that is now wrong. Draw from the code, not from a plan. Usually one or two per topic.

| Question | Mermaid type |
| --- | --- |
| Which parts exist and how do they connect? | `flowchart` |
| What happens in which order between parts? | `sequenceDiagram` |
| Which states does an entity have and what changes them? | `stateDiagram-v2` |
| Which data belongs together? | `erDiagram` |

Every box and arrow maps to real code. Short labels, at most 12 nodes. Split larger ones.

Show me the change list, one block per file:

- Create, change or delete
- What changes, in one line each
- For new files: the sections you plan
- For each diagram: where it goes, the type, and the Mermaid source

Below it, list the assumptions you made for me and the open questions.

Ask: "Is this right? Anything to change before I write?"

Apply every change I ask for and show me the updated parts. Continue only after my explicit OK.

## 5. Write

Small changes to existing content: write them directly. Edit only the parts that change.
Don't rewrite or reformat the rest of a file.

New files and new sections: write one section at a time. Tell me which section you wrote
and wait for my feedback. Apply it as targeted edits, don't rewrite the section. Use what
I correct in the sections that follow. Go on to the next section when I say it fits.

For all of it:

Write in ASD-STE100 Simplified Technical English. This applies to the text you write,
not to text you leave unchanged.

Keep each file's language and layout. Write new files in the language the docs already use.

Write only what I confirmed. No new decisions, no filler.

Create a file only if it has real content. No empty folders, no placeholder files.

Use relative links. If you created a new folder, add its line to `docs/README.md`.

Put each diagram in a fenced `mermaid` block next to the text it belongs to, with one
sentence above it that says what it shows. Replace an outdated diagram. Never keep two versions.

## 6. Check

Re-read every file you touched. Check:

- Every link points to a file that exists
- No fact is stated in two files
- Nothing contradicts the rest of the docs
- Every status in the plan matches what I confirmed
- Every diagram matches the code

Fix what you find. If a fix needs a decision, ask me.

If sub-agents are available, run a reader test. Write 5 questions someone would ask about
this topic. Give a fresh sub-agent only the docs and the questions, nothing from this
conversation. Where it answers wrong or has to guess, make the docs clearer. If that
needs a decision, ask me.

Then reply in 3-5 lines: which files you created or changed, the most important change in
one sentence, and the most important open question, if any. Don't paste the documents.
