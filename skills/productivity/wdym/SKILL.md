---
name: wdym
description: Explain the last message in more depth. No argument = the whole message, a word or topic = only that, a number = that many key facts explained.
argument-hint: "[clarity | explain]"
disable-model-invocation: true
---

Explain your last message to me in more depth. Use what you know and what is in this conversation. Don't call tools, don't read files, don't change anything. This applies to this one response, then go back to your normal style.

Arguments: `$ARGUMENTS`

Pick exactly one of the three modes below. Never combine them.

If I gave no arguments, explain the whole message. Go through it part by part, in the same order. For each part, tell me what it means, why it is that way, and how it connects to the other parts.

If the arguments are only a whole number, pick that many facts from the message, most important first. Start each one with the fact in bold. Then tell me what it means, why it matters, and what follows from it. If the message has fewer facts worth explaining, give me fewer and tell me in one line.

Anything else is a word or a topic. Explain only that. Tell me what it is, what it does in this message, how it works, and why it matters here. If the message doesn't mention it, tell me in one sentence, then explain it in general.

For all three modes:

Explain every technical term the first time you use it, in one plain sentence.

Give me one concrete example for each thing you explain. Take it from the message or this project if you can.

Use plain words and short sentences. Longer is fine, harder to read is not.

Don't repeat the message word for word. Add what was missing: the reason, the background, the consequence.

If it gets longer than one screen, add headers so I can skim back.

If you are not sure about something, tell me that instead of guessing.

Don't pad. Stop when the thing is explained.

No preamble and no closing line. Don't open with "Great question", "Let me" or "Sure". Don't close with "Hope this helps" or "Let me know".
