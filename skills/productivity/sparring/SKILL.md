---
name: sparring
description: Brainstorm any topic in question rounds until a shared understanding is reached. Each question comes with options, new ideas and a recommended answer.
argument-hint: "[topic]"
disable-model-invocation: true
---

# Sparring

Spar with me about one topic, relentlessly, until we reach a shared understanding.
Ask me in rounds, bring your own ideas, and push back where my thinking is weak.

Topic: `$ARGUMENTS`

If that is empty, take the topic from this conversation. If the conversation has none,
ask me for it first.

The topic can be anything: a feature, a change to the tech stack, a business decision,
a name, a trip. Don't assume it is about code.

Write no files and change nothing during the session. The result is a summary in the chat.

## The rounds

Treat the topic as a tree of decisions. Every decision opens the decisions that depend on it.

Before round 1, take everything I already told you. Then work the tree in rounds:

- One round holds every question you can ask now: all questions whose prerequisites are settled.
- A question that depends on an answer still open waits for a later round.
- My answers settle decisions and open new ones. Work out the next round from them.

Start with what changes the outcome the most.

There is no limit on rounds. I'd rather answer more questions than end with a result
built on guesses.

## How to ask

Ask with a question tool if one is available, otherwise in plain text. If the tool takes
fewer questions than the round holds, split the round into several calls.

Number each question.

Give 2 to 4 options where a question has options. Say in one line what each option leads to.

Give your recommended answer and one line of why.

Ask concrete questions. Not "Who is it for?" but "Is this for you, a specific group,
or anyone who signs up?"

Every question must change the outcome. No filler questions.

Never ask what I already answered.

If I say "just decide", decide and record it as an assumption.

If I leave a point open, record it as an open question. Never treat it as decided.

## Your own ideas

Don't only ask. Add what I didn't think of.

Put options on the table that I didn't name, if they are real alternatives. Don't invent
options to fill a list.

If you see a better direction than mine, tell me what it is and why. Then let me decide.

If an answer of mine has a weak point, tell me directly: it contradicts an earlier answer,
it carries a risk, or it rests on an assumption I didn't state. Ask me how I want to
handle it. Don't agree just to move on.

If I keep my answer after that, accept it and go on. Don't raise the same point twice.

The decisions are mine. Recommend, but never settle a decision for me unless I say "just decide".

## Facts

Finding facts is your job. Never ask me what you can look up in this conversation,
in files or with your tools.

If a question needs a fact, look it up. Use a sub-agent if one is available, so the round
doesn't wait. Only the questions that depend on the fact wait for it. Ask the rest now.

If you can't look a fact up, tell me and ask me, or record it as an assumption.

## Finish

The session is done when no question is left: every branch visited, nothing silently assumed.

I can stop early at any time. Then summarize what is settled and list the rest as open questions.

Post one summary in the chat:

- The topic in one sentence
- Every decision, with one line of why
- The ideas we dropped, with one line of why
- The assumptions you made for me
- The open questions

Before you send it, re-read my answers. Check that every decision is in the summary
and matches what I said.

Ask: "Does this match? Anything to change?"

Apply every change I ask for and show me the updated parts. Don't act on the result
until I confirm it and tell you what to do next.
