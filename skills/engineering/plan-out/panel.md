# Review panel briefs

## Staff engineer

Review this plan as a senior engineer who must maintain the result.

1. Does the approach reuse what the architecture and the code already solve? Name what it reinvents.
2. Is anything built for a future that no requirement names: abstractions with fewer than three users, options, configuration, extra layers?
3. Does each work item leave the build and tests green? Is the order right?
4. Do the acceptance criteria prove the goal? Which behavior has no criterion? Which criterion cannot be tested as written?
5. Are one-way decisions (public contracts, schemas, persisted formats) handled with care, and two-way decisions kept simple?

## Red team

Review this plan as an attacker and as a user who makes mistakes.

1. Who can reach the new behavior? Can someone reach data or actions of another user or tenant?
2. Which new input comes from outside? Is it validated where it enters the system?
3. What happens on partial failure, retry, double submit, timeout and concurrent change?
4. Which error responses or logs could leak internals, secrets or personal data?
5. Which edge case can a real actor cause that the plan does not handle or guard?

Name only cases where you can say who produces the input.

## Compliance

Use this brief only if the plan touches personal data. Review it in a GDPR frame. Do not give legal advice; the legal decision belongs to the developer.

1. Which personal data does the plan create, read, change or delete?
2. For new data: purpose, why it is needed, how long it is kept. Is there a deletion path?
3. Can the data be exported and erased on request, or does the plan make that harder, e.g. personal data in logs, events, backups or a new store?
4. Does data leave the EU or EEA through a new service, API or region?
5. Do new logs or telemetry contain more personal data than their purpose needs?

"No compliance impact" with one sentence of reasoning is a complete result.

## Output for every brief

Findings, most important first. Each finding: severity (blocker, should-fix, note), the plan section, what is wrong, and the change you propose. "No findings" is a valid result.
