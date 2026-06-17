# Workflow Automation Studio P03 - Cross-App Journey Templates And Saga Compensation And Process Definition And Process Mining And Action Adapter Governance Development Tasks

Suite: Enterprise Platform, Data, And Governance

App: Workflow Automation Studio

App slug: `workflow-automation-studio`

Implementation repository: `ts-epdg-workflow-automation-studio`

Phase: P03 - Cross-App Journey Templates And Saga Compensation And Process Definition And Process Mining And Action Adapter Governance

Phase file: `P03-cross-app-journey-templates-and-saga-compensation-and-process-definition.md`

Phase rationale: Build the Cross-App Journey Templates And Saga Compensation, Process Definition, Process Mining And Action Adapter Governance capability cluster for Workflow Automation Studio, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work.

Phase exit gate: Workflow Automation Studio can execute the Cross-App Journey Templates And Saga Compensation, Process Definition, Process Mining And Action Adapter Governance workflows through UI, API, `workflow_automation` persistence, outbox events, audit evidence, and release tests.

Out of scope for this phase: Runtime bootstrap is in P01; unrelated feature clusters and post-launch operations remain in their own phases.

Source tracker: [development-task-tracker.md](development-task-tracker.md)

Repository strategy: [TelcoSuite Repository Strategy](../../../../repository-strategy.md)

## Phase Coverage

- [Cross-App Journey Templates And Saga Compensation](../features/cross-app-journey-templates-and-saga-compensation.md)
- [Process Definition](../features/process-definition.md)
- [Process Mining And Action Adapter Governance](../features/process-mining-and-action-adapter-governance.md)

## Phase Tasks

### DT-06-workflow-automation-studio-P03-T001: Build Cross-App Journey Templates And Saga Compensation API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P03 - Cross-App Journey Templates And Saga Compensation And Process Definition And Process Mining And Action Adapter Governance |
| Priority | P0 |
| Source evidence | [Cross-App Journey Templates And Saga Compensation](../features/cross-app-journey-templates-and-saga-compensation.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Cross-App Journey Templates And Saga Compensation |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/enterpriseplatformdatagovernance/workflowautomationstudio/CrossAppJourneyTemplatesAndSagaCompensationController.java`, `workflow_automation.cross_app_journey_templates_and_saga_compensation`, `contracts/events/CrossAppJourneyTemplatesAndSagaCompensationStateChangedEvent.json`, and `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/cross-app-journey-templates-and-saga-compensation` |
| Dependencies | DT-06-workflow-automation-studio-P01-T013 |
| Outputs | `CrossAppJourneyTemplatesAndSagaCompensationController`, `CrossAppJourneyTemplatesAndSagaCompensationService`, `workflow_automation.cross_app_journey_templates_and_saga_compensation` migration, `CrossAppJourneyTemplatesAndSagaCompensationStateChangedEvent` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/cross-app-journey-templates-and-saga-compensation` using TMF621, TMF622, TMF641, TMF652, TMF655, TMF672, TMF679, TMF696, TMF697, TMF701, TMF710, TMF915, TMF921, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Cross-App Journey Templates And Saga Compensation` state in `workflow_automation.cross_app_journey_templates_and_saga_compensation` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `CrossAppJourneyTemplatesAndSagaCompensationStateChangedEvent` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Journey template design, Saga execution, Compensation handling, Exception repair and closure.
- Carry source details into code and tests for personas Process owner, Journey owner, Automation architect and objects journey template, saga instance, compensation step, resumable checkpoint; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/cross-app-journey-templates-and-saga-compensation`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `workflow_automation.cross_app_journey_templates_and_saga_compensation.id`, and appends `CrossAppJourneyTemplatesAndSagaCompensationStateChangedEvent` to `workflow_automation.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/cross-app-journey-templates-and-saga-compensation/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Cross-App Journey Templates And Saga Compensation` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `workflow_automation.cross_app_journey_templates_and_saga_compensation` is required.

#### Definition Of Done

- `CrossAppJourneyTemplatesAndSagaCompensationController`, service, repository, DTOs, validation, error model, and migration for `workflow_automation.cross_app_journey_templates_and_saga_compensation` are committed under `ts-epdg-workflow-automation-studio`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/cross-app-journey-templates-and-saga-compensation`, `workflow_automation.cross_app_journey_templates_and_saga_compensation`, and `CrossAppJourneyTemplatesAndSagaCompensationStateChangedEvent`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/cross-app-journey-templates-and-saga-compensation` return `403` and write a denial audit row instead of exposing `Cross-App Journey Templates And Saga Compensation` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `workflow_automation.cross_app_journey_templates_and_saga_compensation` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `CrossAppJourneyTemplatesAndSagaCompensationStateChangedEvent` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Cross-App Journey Templates And Saga Compensation` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `workflow_automation.cross_app_journey_templates_and_saga_compensation` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `CrossAppJourneyTemplatesAndSagaCompensationService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/cross-app-journey-templates-and-saga-compensation` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `workflow_automation.cross_app_journey_templates_and_saga_compensation` columns and indexes; event replay tests validate `contracts/events/CrossAppJourneyTemplatesAndSagaCompensationStateChangedEvent.json` and `workflow_automation.event_outbox` ordering.

### DT-06-workflow-automation-studio-P03-T002: Build Cross-App Journey Templates And Saga Compensation workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P03 - Cross-App Journey Templates And Saga Compensation And Process Definition And Process Mining And Action Adapter Governance |
| Priority | P1 |
| Source evidence | [Cross-App Journey Templates And Saga Compensation](../features/cross-app-journey-templates-and-saga-compensation.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Cross-App Journey Templates And Saga Compensation |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/cross-app-journey-templates-and-saga-compensation/`, `tests/e2e/cross-app-journey-templates-and-saga-compensation.spec.ts`, Grafana panel `cross-app-journey-templates-and-saga-compensation`, and `docs/operations-runbook.md#cross-app-journey-templates-and-saga-compensation` |
| Dependencies | DT-06-workflow-automation-studio-P03-T001 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/cross-app-journey-templates-and-saga-compensation/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Process owner, Journey owner, Automation architect.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Journey template design, Saga execution, Compensation handling, Exception repair and closure, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/workflow-automation-studio/cross-app-journey-templates-and-saga-compensation`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Cross-App Journey Templates And Saga Compensation` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `cross-app-journey-templates-and-saga-compensation` refreshes, then it shows the metric and links to `docs/operations-runbook.md#cross-app-journey-templates-and-saga-compensation`.

#### Definition Of Done

- `frontend/src/app/pages/cross-app-journey-templates-and-saga-compensation/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/cross-app-journey-templates-and-saga-compensation.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Cross-App Journey Templates And Saga Compensation` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Cross-App Journey Templates And Saga Compensation` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/cross-app-journey-templates-and-saga-compensation.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-06-workflow-automation-studio-P03-T003: Build Process Definition API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P03 - Cross-App Journey Templates And Saga Compensation And Process Definition And Process Mining And Action Adapter Governance |
| Priority | P0 |
| Source evidence | [Process Definition](../features/process-definition.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Process Definition |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/enterpriseplatformdatagovernance/workflowautomationstudio/ProcessDefinitionController.java`, `workflow_automation.process_definition`, `contracts/events/ProcessDefinitionStateChangedEvent.json`, and `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/process-definition` |
| Dependencies | DT-06-workflow-automation-studio-P03-T001 |
| Outputs | `ProcessDefinitionController`, `ProcessDefinitionService`, `workflow_automation.process_definition` migration, `ProcessDefinitionStateChangedEvent` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/process-definition` using TMF672, TMF679, TMF696, TMF697, TMF701, TMF710, TMF915, TMF921, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Process Definition` state in `workflow_automation.process_definition` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `ProcessDefinitionStateChangedEvent` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Process modeling, Version approval, Publication, Process retirement.
- Carry source details into code and tests for personas Process owner, Journey owner, Automation architect and objects process definition, state model, transition, timer; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/process-definition`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `workflow_automation.process_definition.id`, and appends `ProcessDefinitionStateChangedEvent` to `workflow_automation.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/process-definition/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Process Definition` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `workflow_automation.process_definition` is required.

#### Definition Of Done

- `ProcessDefinitionController`, service, repository, DTOs, validation, error model, and migration for `workflow_automation.process_definition` are committed under `ts-epdg-workflow-automation-studio`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/process-definition`, `workflow_automation.process_definition`, and `ProcessDefinitionStateChangedEvent`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/process-definition` return `403` and write a denial audit row instead of exposing `Process Definition` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `workflow_automation.process_definition` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `ProcessDefinitionStateChangedEvent` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Process Definition` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `workflow_automation.process_definition` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `ProcessDefinitionService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/process-definition` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `workflow_automation.process_definition` columns and indexes; event replay tests validate `contracts/events/ProcessDefinitionStateChangedEvent.json` and `workflow_automation.event_outbox` ordering.

### DT-06-workflow-automation-studio-P03-T004: Build Process Definition workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P03 - Cross-App Journey Templates And Saga Compensation And Process Definition And Process Mining And Action Adapter Governance |
| Priority | P1 |
| Source evidence | [Process Definition](../features/process-definition.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Process Definition |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/process-definition/`, `tests/e2e/process-definition.spec.ts`, Grafana panel `process-definition`, and `docs/operations-runbook.md#process-definition` |
| Dependencies | DT-06-workflow-automation-studio-P03-T003 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/process-definition/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Process owner, Journey owner, Automation architect.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Process modeling, Version approval, Publication, Process retirement, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/workflow-automation-studio/process-definition`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Process Definition` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `process-definition` refreshes, then it shows the metric and links to `docs/operations-runbook.md#process-definition`.

#### Definition Of Done

- `frontend/src/app/pages/process-definition/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/process-definition.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Process Definition` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Process Definition` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/process-definition.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-06-workflow-automation-studio-P03-T005: Build Process Mining And Action Adapter Governance API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P03 - Cross-App Journey Templates And Saga Compensation And Process Definition And Process Mining And Action Adapter Governance |
| Priority | P0 |
| Source evidence | [Process Mining And Action Adapter Governance](../features/process-mining-and-action-adapter-governance.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Process Mining And Action Adapter Governance |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/enterpriseplatformdatagovernance/workflowautomationstudio/ProcessMiningAndActionAdapterGovernanceController.java`, `workflow_automation.process_mining_and_action_adapter_governance`, `contracts/events/ProcessMiningAndActionAdapterGovernanceStateChangedEvent.json`, and `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/process-mining-and-action-adapter-governance` |
| Dependencies | DT-06-workflow-automation-studio-P03-T003 |
| Outputs | `ProcessMiningAndActionAdapterGovernanceController`, `ProcessMiningAndActionAdapterGovernanceService`, `workflow_automation.process_mining_and_action_adapter_governance` migration, `ProcessMiningAndActionAdapterGovernanceStateChangedEvent` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/process-mining-and-action-adapter-governance` using TMF672, TMF679, TMF696, TMF697, TMF701, TMF710, TMF915, TMF921, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Process Mining And Action Adapter Governance` state in `workflow_automation.process_mining_and_action_adapter_governance` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `ProcessMiningAndActionAdapterGovernanceStateChangedEvent` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Process mining ingestion, Bottleneck review, Action adapter certification, Automation value tracking.
- Carry source details into code and tests for personas Process owner, Journey owner, Automation architect and objects process event log, bottleneck insight, variant analysis, action adapter; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/process-mining-and-action-adapter-governance`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `workflow_automation.process_mining_and_action_adapter_governance.id`, and appends `ProcessMiningAndActionAdapterGovernanceStateChangedEvent` to `workflow_automation.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/process-mining-and-action-adapter-governance/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Process Mining And Action Adapter Governance` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `workflow_automation.process_mining_and_action_adapter_governance` is required.

#### Definition Of Done

- `ProcessMiningAndActionAdapterGovernanceController`, service, repository, DTOs, validation, error model, and migration for `workflow_automation.process_mining_and_action_adapter_governance` are committed under `ts-epdg-workflow-automation-studio`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/process-mining-and-action-adapter-governance`, `workflow_automation.process_mining_and_action_adapter_governance`, and `ProcessMiningAndActionAdapterGovernanceStateChangedEvent`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/process-mining-and-action-adapter-governance` return `403` and write a denial audit row instead of exposing `Process Mining And Action Adapter Governance` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `workflow_automation.process_mining_and_action_adapter_governance` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `ProcessMiningAndActionAdapterGovernanceStateChangedEvent` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Process Mining And Action Adapter Governance` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `workflow_automation.process_mining_and_action_adapter_governance` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `ProcessMiningAndActionAdapterGovernanceService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/process-mining-and-action-adapter-governance` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `workflow_automation.process_mining_and_action_adapter_governance` columns and indexes; event replay tests validate `contracts/events/ProcessMiningAndActionAdapterGovernanceStateChangedEvent.json` and `workflow_automation.event_outbox` ordering.

### DT-06-workflow-automation-studio-P03-T006: Build Process Mining And Action Adapter Governance workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P03 - Cross-App Journey Templates And Saga Compensation And Process Definition And Process Mining And Action Adapter Governance |
| Priority | P1 |
| Source evidence | [Process Mining And Action Adapter Governance](../features/process-mining-and-action-adapter-governance.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Process Mining And Action Adapter Governance |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/process-mining-and-action-adapter-governance/`, `tests/e2e/process-mining-and-action-adapter-governance.spec.ts`, Grafana panel `process-mining-and-action-adapter-governance`, and `docs/operations-runbook.md#process-mining-and-action-adapter-governance` |
| Dependencies | DT-06-workflow-automation-studio-P03-T005 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/process-mining-and-action-adapter-governance/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Process owner, Journey owner, Automation architect.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Process mining ingestion, Bottleneck review, Action adapter certification, Automation value tracking, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/workflow-automation-studio/process-mining-and-action-adapter-governance`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Process Mining And Action Adapter Governance` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `process-mining-and-action-adapter-governance` refreshes, then it shows the metric and links to `docs/operations-runbook.md#process-mining-and-action-adapter-governance`.

#### Definition Of Done

- `frontend/src/app/pages/process-mining-and-action-adapter-governance/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/process-mining-and-action-adapter-governance.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Process Mining And Action Adapter Governance` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Process Mining And Action Adapter Governance` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/process-mining-and-action-adapter-governance.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-06-workflow-automation-studio-P03-T007: Prove Cross-App Journey Templates And Saga Compensation And Process Definition And Process Mining And Action Adapter Governance release gate, replay, and handoff evidence

| Field | Value |
| --- | --- |
| Phase | P03 - Cross-App Journey Templates And Saga Compensation And Process Definition And Process Mining And Action Adapter Governance |
| Priority | P1 |
| Source evidence | [Cross-App Journey Templates And Saga Compensation](../features/cross-app-journey-templates-and-saga-compensation.md), [Process Definition](../features/process-definition.md), [Process Mining And Action Adapter Governance](../features/process-mining-and-action-adapter-governance.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Cross-App Journey Templates And Saga Compensation And Process Definition And Process Mining And Action Adapter Governance |
| Build area | Test/Ops/Release/Event |
| Target artifact | `tests/release/cross-app-journey-templates-and-saga-compensation-and-process-definition.spec.ts`, `docs/release-notes/cross-app-journey-templates-and-saga-compensation-and-process-definition.md`, Grafana dashboard `cross-app-journey-templates-and-saga-compensation-and-process-definition`, and replay fixtures |
| Dependencies | DT-06-workflow-automation-studio-P03-T002, DT-06-workflow-automation-studio-P03-T004, DT-06-workflow-automation-studio-P03-T006 |
| Outputs | Release-gate test, replay/reconciliation evidence, accessibility/security/performance reports, dashboard/runbook links, support handoff notes |
| Missing evidence | No |

#### Implementation Notes

- Create a release-gate checklist for `cross-app-journey-templates-and-saga-compensation-and-process-definition` covering Cross-App Journey Templates And Saga Compensation, Process Definition, Process Mining And Action Adapter Governance, with happy path, assisted path, negative path, edge cases, event replay, data reconciliation, security, accessibility, performance, and support evidence.
- Record producer and consumer acknowledgements for phase events, reconcile `workflow_automation.event_outbox`, and link replay fixtures and correlation IDs.
- Update `docs/operations-runbook.md`, `docs/release-notes/cross-app-journey-templates-and-saga-compensation-and-process-definition.md`, and `development-task-tracker.md` with release evidence and unresolved blockers.

#### Acceptance Criteria

1. Given all tasks in `P03-cross-app-journey-templates-and-saga-compensation-and-process-definition.md` are complete, when `tests/release/cross-app-journey-templates-and-saga-compensation-and-process-definition.spec.ts` runs, then it returns exit code `0` and links evidence for UI, API, data, event, security, ops, and test gates.
2. Given a consumer rejects an event from `cross-app-journey-templates-and-saga-compensation-and-process-definition`, when replay is triggered, then the replay fixture preserves `$.correlationId`, `$.eventId`, and consumer acknowledgement state.
3. Given release notes are generated, when support reviews `docs/release-notes/cross-app-journey-templates-and-saga-compensation-and-process-definition.md`, then open blockers, rollback steps, runbook links, and ownership contacts are present.

#### Definition Of Done

- `tests/release/cross-app-journey-templates-and-saga-compensation-and-process-definition.spec.ts`, replay fixtures, dashboard/runbook links, and release notes are committed.
- Accessibility, security, contract, migration, event replay, performance, and operational-readiness evidence is linked from the tracker.
- Open blockers have owner, due date, target increment, and rollback or removal criteria.

#### Negative Scenarios

- Do not mark the phase Done if event replay, reconciliation, accessibility, security, or downstream acknowledgement evidence is missing.
- Do not release `cross-app-journey-templates-and-saga-compensation-and-process-definition` with unresolved cross-app writes, direct schema coupling, or stale source authority assumptions.
- Do not suppress failed release gates; record failures with owner, due date, and target increment.

#### Edge Cases

- Coordinated release gates may require downstream app windows; record scheduling, owner, and fallback route in release notes.
- Historical backfill, replay, bulk update, or migration repair runs must include preview, partial failure report, and rollback evidence.
- High-volume launch periods require dashboard thresholds, alert owners, queue back-pressure, and support escalation paths.

#### Test Expectations

- `tests/release/cross-app-journey-templates-and-saga-compensation-and-process-definition.spec.ts`, `mvn test`, OpenAPI/event replay tests, Flyway checks, Playwright/Cypress E2E, accessibility, security, and k6/performance gates pass.
- `docker compose config`, clean-checkout smoke, `helm lint`, Kubernetes dry-run, dashboard JSON validation, and runbook link checks pass.
- Tracker evidence links command output, PRs, screenshots, replay payloads, dashboards, release notes, and support handoff notes.
