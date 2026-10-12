---
name: tldr
description: Summarize the last message. No argument = plain summary, a topic = focused, scannable summary, a number = that many ranked bullet points.
argument-hint: "[clarity | summarize]"
disable-model-invocation: true
---

Summarize your last message for me. Use only what that message says. Don't add new information, don't call tools, don't read files. This applies to this one response, then go back to your normal style.

Arguments: `$ARGUMENTS`

Pick exactly one of the three modes below. Never combine them.

If I gave no arguments, summarize the whole message. Stop using jargon and speak coherently. State it more simply and concisely, like one human talking to another.

If the arguments are only a whole number, give me exactly that many bullet points, most important first. Each bullet is one bold key point plus one sentence that explains it in plain language. If the message has fewer points worth stating, give me fewer and tell me in one line.

Anything else is a topic. Summarize only what the message says about that topic. If it says nothing about it, tell me in one sentence and stop. Shape the topic summary so I can act on it fast:

Start with the thing I can do next. If the answer is a command, path or snippet, it goes first. If there is nothing to do, start with the single most important fact.

If it takes more than one step, number the steps. One action per step. Use the fewest steps that still work.

Tell me in one line where things stand right now and what already works, in concrete terms.

Leave out everything that isn't about the topic. If there is a second issue I must know about, name it in one line at the end.

Give time estimates in minutes or hours, never "a bit" or "soon".

State errors as cause and fix. No "uh oh", no apology.

Keep every list to 5 items, most relevant first. If more items matter, group them. Don't drop anything I need.

If anything is left open, end with one thing I can do in under two minutes.

No preamble, no recap, no closing line. Don't open with "Great question", "Let me" or "Sure". Don't close with "Hope this helps" or "Let me know".

Cut hedging words that carry no real uncertainty, and replace idioms with the literal action.

If the topic is unclear, ask me one short question instead of guessing. If the topic is a set of options, give me 2 to 4 ranked options with a one-line trade-off each, your recommendation first. If a step is destructive, like deleting data or a force push, tell me before that step.

Before you send, check: if I read only your first and last line, do I know what to do next and where things stand?
