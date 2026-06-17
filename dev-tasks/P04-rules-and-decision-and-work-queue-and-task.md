# Workflow Automation Studio P04 - Rules And Decision And Work Queue And Task Development Tasks

Suite: Enterprise Platform, Data, And Governance

App: Workflow Automation Studio

App slug: `workflow-automation-studio`

Implementation repository: `ts-epdg-workflow-automation-studio`

Phase: P04 - Rules And Decision And Work Queue And Task

Phase file: `P04-rules-and-decision-and-work-queue-and-task.md`

Phase rationale: Build the Rules And Decision, Work Queue And Task capability cluster for Workflow Automation Studio, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work.

Phase exit gate: Workflow Automation Studio can execute the Rules And Decision, Work Queue And Task workflows through UI, API, `workflow_automation` persistence, outbox events, audit evidence, and release tests.

Out of scope for this phase: Runtime bootstrap is in P01; unrelated feature clusters and post-launch operations remain in their own phases.

Source tracker: [development-task-tracker.md](development-task-tracker.md)

Repository strategy: [TelcoSuite Repository Strategy](../../../../repository-strategy.md)

## Phase Coverage

- [Rules And Decision](../features/rules-and-decision.md)
- [Work Queue And Task](../features/work-queue-and-task.md)

## Phase Tasks

### DT-06-workflow-automation-studio-P04-T001: Build Rules And Decision API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P04 - Rules And Decision And Work Queue And Task |
| Priority | P0 |
| Source evidence | [Rules And Decision](../features/rules-and-decision.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Rules And Decision |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/enterpriseplatformdatagovernance/workflowautomationstudio/RulesAndDecisionController.java`, `workflow_automation.rules_and_decision`, `contracts/events/RulesAndDecisionStateChangedEvent.json`, and `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/rules-and-decision` |
| Dependencies | DT-06-workflow-automation-studio-P01-T013 |
| Outputs | `RulesAndDecisionController`, `RulesAndDecisionService`, `workflow_automation.rules_and_decision` migration, `RulesAndDecisionStateChangedEvent` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/rules-and-decision` using TMF672, TMF679, TMF696, TMF697, TMF701, TMF710, TMF915, TMF921, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Rules And Decision` state in `workflow_automation.rules_and_decision` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `RulesAndDecisionStateChangedEvent` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Rule authoring, Simulation, Approval and promotion, Decision audit review.
- Carry source details into code and tests for personas Process owner, Journey owner, Automation architect and objects decision table, rule set, decision service, simulation case; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/rules-and-decision`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `workflow_automation.rules_and_decision.id`, and appends `RulesAndDecisionStateChangedEvent` to `workflow_automation.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/rules-and-decision/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Rules And Decision` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `workflow_automation.rules_and_decision` is required.

#### Definition Of Done

- `RulesAndDecisionController`, service, repository, DTOs, validation, error model, and migration for `workflow_automation.rules_and_decision` are committed under `ts-epdg-workflow-automation-studio`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/rules-and-decision`, `workflow_automation.rules_and_decision`, and `RulesAndDecisionStateChangedEvent`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/rules-and-decision` return `403` and write a denial audit row instead of exposing `Rules And Decision` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `workflow_automation.rules_and_decision` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `RulesAndDecisionStateChangedEvent` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Rules And Decision` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `workflow_automation.rules_and_decision` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `RulesAndDecisionService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/rules-and-decision` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `workflow_automation.rules_and_decision` columns and indexes; event replay tests validate `contracts/events/RulesAndDecisionStateChangedEvent.json` and `workflow_automation.event_outbox` ordering.

### DT-06-workflow-automation-studio-P04-T002: Build Rules And Decision workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P04 - Rules And Decision And Work Queue And Task |
| Priority | P1 |
| Source evidence | [Rules And Decision](../features/rules-and-decision.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Rules And Decision |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/rules-and-decision/`, `tests/e2e/rules-and-decision.spec.ts`, Grafana panel `rules-and-decision`, and `docs/operations-runbook.md#rules-and-decision` |
| Dependencies | DT-06-workflow-automation-studio-P04-T001 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/rules-and-decision/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Process owner, Journey owner, Automation architect.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Rule authoring, Simulation, Approval and promotion, Decision audit review, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/workflow-automation-studio/rules-and-decision`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Rules And Decision` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `rules-and-decision` refreshes, then it shows the metric and links to `docs/operations-runbook.md#rules-and-decision`.

#### Definition Of Done

- `frontend/src/app/pages/rules-and-decision/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/rules-and-decision.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Rules And Decision` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Rules And Decision` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/rules-and-decision.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-06-workflow-automation-studio-P04-T003: Build Work Queue And Task API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P04 - Rules And Decision And Work Queue And Task |
| Priority | P0 |
| Source evidence | [Work Queue And Task](../features/work-queue-and-task.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Work Queue And Task |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/enterpriseplatformdatagovernance/workflowautomationstudio/WorkQueueAndTaskController.java`, `workflow_automation.work_queue_and_task`, `contracts/events/WorkQueueAndTaskStateChangedEvent.json`, and `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/work-queue-and-task` |
| Dependencies | DT-06-workflow-automation-studio-P04-T001 |
| Outputs | `WorkQueueAndTaskController`, `WorkQueueAndTaskService`, `workflow_automation.work_queue_and_task` migration, `WorkQueueAndTaskStateChangedEvent` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/work-queue-and-task` using TMF672, TMF679, TMF696, TMF697, TMF701, TMF710, TMF915, TMF921, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Work Queue And Task` state in `workflow_automation.work_queue_and_task` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `WorkQueueAndTaskStateChangedEvent` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Task creation, Assignment and escalation, Manual completion, Queue performance review.
- Carry source details into code and tests for personas Process owner, Journey owner, Automation architect and objects work queue, manual task, assignment, priority; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/work-queue-and-task`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `workflow_automation.work_queue_and_task.id`, and appends `WorkQueueAndTaskStateChangedEvent` to `workflow_automation.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/work-queue-and-task/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Work Queue And Task` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `workflow_automation.work_queue_and_task` is required.

#### Definition Of Done

- `WorkQueueAndTaskController`, service, repository, DTOs, validation, error model, and migration for `workflow_automation.work_queue_and_task` are committed under `ts-epdg-workflow-automation-studio`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/work-queue-and-task`, `workflow_automation.work_queue_and_task`, and `WorkQueueAndTaskStateChangedEvent`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/work-queue-and-task` return `403` and write a denial audit row instead of exposing `Work Queue And Task` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `workflow_automation.work_queue_and_task` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `WorkQueueAndTaskStateChangedEvent` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Work Queue And Task` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `workflow_automation.work_queue_and_task` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `WorkQueueAndTaskService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/work-queue-and-task` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `workflow_automation.work_queue_and_task` columns and indexes; event replay tests validate `contracts/events/WorkQueueAndTaskStateChangedEvent.json` and `workflow_automation.event_outbox` ordering.

### DT-06-workflow-automation-studio-P04-T004: Build Work Queue And Task workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P04 - Rules And Decision And Work Queue And Task |
| Priority | P1 |
| Source evidence | [Work Queue And Task](../features/work-queue-and-task.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Work Queue And Task |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/work-queue-and-task/`, `tests/e2e/work-queue-and-task.spec.ts`, Grafana panel `work-queue-and-task`, and `docs/operations-runbook.md#work-queue-and-task` |
| Dependencies | DT-06-workflow-automation-studio-P04-T003 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/work-queue-and-task/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Process owner, Journey owner, Automation architect.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Task creation, Assignment and escalation, Manual completion, Queue performance review, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/workflow-automation-studio/work-queue-and-task`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Work Queue And Task` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `work-queue-and-task` refreshes, then it shows the metric and links to `docs/operations-runbook.md#work-queue-and-task`.

#### Definition Of Done

- `frontend/src/app/pages/work-queue-and-task/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/work-queue-and-task.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Work Queue And Task` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Work Queue And Task` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/work-queue-and-task.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-06-workflow-automation-studio-P04-T005: Prove Rules And Decision And Work Queue And Task release gate, replay, and handoff evidence

| Field | Value |
| --- | --- |
| Phase | P04 - Rules And Decision And Work Queue And Task |
| Priority | P1 |
| Source evidence | [Rules And Decision](../features/rules-and-decision.md), [Work Queue And Task](../features/work-queue-and-task.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Rules And Decision And Work Queue And Task |
| Build area | Test/Ops/Release/Event |
| Target artifact | `tests/release/rules-and-decision-and-work-queue-and-task.spec.ts`, `docs/release-notes/rules-and-decision-and-work-queue-and-task.md`, Grafana dashboard `rules-and-decision-and-work-queue-and-task`, and replay fixtures |
| Dependencies | DT-06-workflow-automation-studio-P04-T002, DT-06-workflow-automation-studio-P04-T004 |
| Outputs | Release-gate test, replay/reconciliation evidence, accessibility/security/performance reports, dashboard/runbook links, support handoff notes |
| Missing evidence | No |

#### Implementation Notes

- Create a release-gate checklist for `rules-and-decision-and-work-queue-and-task` covering Rules And Decision, Work Queue And Task, with happy path, assisted path, negative path, edge cases, event replay, data reconciliation, security, accessibility, performance, and support evidence.
- Record producer and consumer acknowledgements for phase events, reconcile `workflow_automation.event_outbox`, and link replay fixtures and correlation IDs.
- Update `docs/operations-runbook.md`, `docs/release-notes/rules-and-decision-and-work-queue-and-task.md`, and `development-task-tracker.md` with release evidence and unresolved blockers.

#### Acceptance Criteria

1. Given all tasks in `P04-rules-and-decision-and-work-queue-and-task.md` are complete, when `tests/release/rules-and-decision-and-work-queue-and-task.spec.ts` runs, then it returns exit code `0` and links evidence for UI, API, data, event, security, ops, and test gates.
2. Given a consumer rejects an event from `rules-and-decision-and-work-queue-and-task`, when replay is triggered, then the replay fixture preserves `$.correlationId`, `$.eventId`, and consumer acknowledgement state.
3. Given release notes are generated, when support reviews `docs/release-notes/rules-and-decision-and-work-queue-and-task.md`, then open blockers, rollback steps, runbook links, and ownership contacts are present.

#### Definition Of Done

- `tests/release/rules-and-decision-and-work-queue-and-task.spec.ts`, replay fixtures, dashboard/runbook links, and release notes are committed.
- Accessibility, security, contract, migration, event replay, performance, and operational-readiness evidence is linked from the tracker.
- Open blockers have owner, due date, target increment, and rollback or removal criteria.

#### Negative Scenarios

- Do not mark the phase Done if event replay, reconciliation, accessibility, security, or downstream acknowledgement evidence is missing.
- Do not release `rules-and-decision-and-work-queue-and-task` with unresolved cross-app writes, direct schema coupling, or stale source authority assumptions.
- Do not suppress failed release gates; record failures with owner, due date, and target increment.

#### Edge Cases

- Coordinated release gates may require downstream app windows; record scheduling, owner, and fallback route in release notes.
- Historical backfill, replay, bulk update, or migration repair runs must include preview, partial failure report, and rollback evidence.
- High-volume launch periods require dashboard thresholds, alert owners, queue back-pressure, and support escalation paths.

#### Test Expectations

- `tests/release/rules-and-decision-and-work-queue-and-task.spec.ts`, `mvn test`, OpenAPI/event replay tests, Flyway checks, Playwright/Cypress E2E, accessibility, security, and k6/performance gates pass.
- `docker compose config`, clean-checkout smoke, `helm lint`, Kubernetes dry-run, dashboard JSON validation, and runbook link checks pass.
- Tracker evidence links command output, PRs, screenshots, replay payloads, dashboards, release notes, and support handoff notes.
