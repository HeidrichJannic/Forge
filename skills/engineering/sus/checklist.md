# Change review checklist

Use it for the self-review of a small change, and as the base of every `forge:reviewer` change review.
For each point: OK, finding, or not applicable.

## Correctness

- The change does what the plan or the request says. Every acceptance criterion it claims is met.
- Edge cases a real actor can cause are handled or guarded.
- Errors fail loudly. No swallowed exceptions, no silent defaults.
- Concurrency, retries and partial failure are handled where the change creates them.

## Tests

- Tests exist per the test mode. A bug fix has a test that failed before the fix.
- Each test checks observable behavior through the public interface and fails when that behavior breaks.
- No weak assertions (only "not null", only "no exception"), no logic in tests, no expected values computed with the production code.
- Mocks only at system boundaries.
- No test was weakened, skipped or deleted to get to green.

## Fit

- The change follows the reference module of its pattern. Deviations are named.
- Module boundaries and dependency direction from `.forge/context.md` hold.
- New dependencies are allowed by `.forge/context.md` or approved by me.
- No dead code, commented-out code, debug output or unrelated changes.
- Names and structure follow the code conventions.

## Security

- Authorization is checked for every new path. Default is deny. One user or tenant cannot reach another's data.
- External input is validated where it enters the system. Queries are parameterized.
- No secrets in code, config, logs or tests.
- Error responses and logs leak no stack traces, paths, internal IDs or personal data.
- No security check, test, linter or hook was turned off.

## Personal data

- New personal data has a purpose and a deletion path.
- Logs, events and telemetry contain only the personal data their purpose needs.
- No data leaves the EU through a new service unless `.forge/context.md` allows it.

## Gates and docs

- The `blocking` verify commands show no failure outside the baseline. The output is shown.
- The baseline did not grow.
- Docs and diagrams the change made wrong are named.
- Risk areas from `.forge/context.md` were changed only with my approval.
