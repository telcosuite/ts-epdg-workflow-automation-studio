# Workflow Automation Studio P02 - Automation And Intent And Automation Safety Task Calendar And Rule Simulation And Configuration And Extension Studio Development Tasks

Suite: Enterprise Platform, Data, And Governance

App: Workflow Automation Studio

App slug: `workflow-automation-studio`

Implementation repository: `ts-epdg-workflow-automation-studio`

Phase: P02 - Automation And Intent And Automation Safety Task Calendar And Rule Simulation And Configuration And Extension Studio

Phase file: `P02-automation-and-intent-and-automation-safety-task-calendar-and-rule-simulation.md`

Phase rationale: Build the Automation And Intent, Automation Safety Task Calendar And Rule Simulation, Configuration And Extension Studio capability cluster for Workflow Automation Studio, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work.

Phase exit gate: Workflow Automation Studio can execute the Automation And Intent, Automation Safety Task Calendar And Rule Simulation, Configuration And Extension Studio workflows through UI, API, `workflow_automation` persistence, outbox events, audit evidence, and release tests.

Out of scope for this phase: Runtime bootstrap is in P01; unrelated feature clusters and post-launch operations remain in their own phases.

Source tracker: [development-task-tracker.md](development-task-tracker.md)

Repository strategy: [TelcoSuite Repository Strategy](../../../../repository-strategy.md)

## Phase Coverage

- [Automation And Intent](../features/automation-and-intent.md)
- [Automation Safety Task Calendar And Rule Simulation](../features/automation-safety-task-calendar-and-rule-simulation.md)
- [Configuration And Extension Studio](../features/configuration-and-extension-studio.md)

## Phase Tasks

### DT-06-workflow-automation-studio-P02-T001: Build Automation And Intent API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P02 - Automation And Intent And Automation Safety Task Calendar And Rule Simulation And Configuration And Extension Studio |
| Priority | P0 |
| Source evidence | [Automation And Intent](../features/automation-and-intent.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Automation And Intent |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/enterpriseplatformdatagovernance/workflowautomationstudio/AutomationAndIntentController.java`, `workflow_automation.automation_and_intent`, `contracts/events/AutomationAndIntentStateChangedEvent.json`, and `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/automation-and-intent` |
| Dependencies | DT-06-workflow-automation-studio-P01-T013 |
| Outputs | `AutomationAndIntentController`, `AutomationAndIntentService`, `workflow_automation.automation_and_intent` migration, `AutomationAndIntentStateChangedEvent` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/automation-and-intent` using TMF672, TMF679, TMF696, TMF697, TMF701, TMF710, TMF915, TMF921, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Automation And Intent` state in `workflow_automation.automation_and_intent` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `AutomationAndIntentStateChangedEvent` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Playbook design, Intent intake, Automation execution, Rollback and human intervention.
- Carry source details into code and tests for personas Process owner, Journey owner, Automation architect and objects automation playbook, intent request, trigger, precondition; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/automation-and-intent`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `workflow_automation.automation_and_intent.id`, and appends `AutomationAndIntentStateChangedEvent` to `workflow_automation.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/automation-and-intent/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Automation And Intent` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `workflow_automation.automation_and_intent` is required.

#### Definition Of Done

- `AutomationAndIntentController`, service, repository, DTOs, validation, error model, and migration for `workflow_automation.automation_and_intent` are committed under `ts-epdg-workflow-automation-studio`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/automation-and-intent`, `workflow_automation.automation_and_intent`, and `AutomationAndIntentStateChangedEvent`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/automation-and-intent` return `403` and write a denial audit row instead of exposing `Automation And Intent` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `workflow_automation.automation_and_intent` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `AutomationAndIntentStateChangedEvent` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Automation And Intent` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `workflow_automation.automation_and_intent` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `AutomationAndIntentService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/automation-and-intent` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `workflow_automation.automation_and_intent` columns and indexes; event replay tests validate `contracts/events/AutomationAndIntentStateChangedEvent.json` and `workflow_automation.event_outbox` ordering.

### DT-06-workflow-automation-studio-P02-T002: Build Automation And Intent workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P02 - Automation And Intent And Automation Safety Task Calendar And Rule Simulation And Configuration And Extension Studio |
| Priority | P1 |
| Source evidence | [Automation And Intent](../features/automation-and-intent.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Automation And Intent |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/automation-and-intent/`, `tests/e2e/automation-and-intent.spec.ts`, Grafana panel `automation-and-intent`, and `docs/operations-runbook.md#automation-and-intent` |
| Dependencies | DT-06-workflow-automation-studio-P02-T001 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/automation-and-intent/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Process owner, Journey owner, Automation architect.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Playbook design, Intent intake, Automation execution, Rollback and human intervention, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/workflow-automation-studio/automation-and-intent`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Automation And Intent` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `automation-and-intent` refreshes, then it shows the metric and links to `docs/operations-runbook.md#automation-and-intent`.

#### Definition Of Done

- `frontend/src/app/pages/automation-and-intent/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/automation-and-intent.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Automation And Intent` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Automation And Intent` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/automation-and-intent.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-06-workflow-automation-studio-P02-T003: Build Automation Safety Task Calendar And Rule Simulation API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P02 - Automation And Intent And Automation Safety Task Calendar And Rule Simulation And Configuration And Extension Studio |
| Priority | P0 |
| Source evidence | [Automation Safety Task Calendar And Rule Simulation](../features/automation-safety-task-calendar-and-rule-simulation.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Automation Safety Task Calendar And Rule Simulation |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/enterpriseplatformdatagovernance/workflowautomationstudio/AutomationSafetyTaskCalendarAndRuleSimulationController.java`, `workflow_automation.automation_safety_task_calendar_and_rule_simulation`, `contracts/events/AutomationSafetyTaskCalendarAndRuleSimulationStateChangedEvent.json`, and `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/automation-safety-task-calendar-and-rule-simulation` |
| Dependencies | DT-06-workflow-automation-studio-P02-T001 |
| Outputs | `AutomationSafetyTaskCalendarAndRuleSimulationController`, `AutomationSafetyTaskCalendarAndRuleSimulationService`, `workflow_automation.automation_safety_task_calendar_and_rule_simulation` migration, `AutomationSafetyTaskCalendarAndRuleSimulationStateChangedEvent` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/automation-safety-task-calendar-and-rule-simulation` using TMF672, TMF679, TMF696, TMF697, TMF701, TMF710, TMF915, TMF921, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Automation Safety Task Calendar And Rule Simulation` state in `workflow_automation.automation_safety_task_calendar_and_rule_simulation` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `AutomationSafetyTaskCalendarAndRuleSimulationStateChangedEvent` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Automation dry-run, Blast-radius review, Rule simulation, Emergency break-glass.
- Carry source details into code and tests for personas Process owner, Journey owner, Automation architect and objects dry-run result, blast-radius analysis, task calendar, SLA calendar rule; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/automation-safety-task-calendar-and-rule-simulation`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `workflow_automation.automation_safety_task_calendar_and_rule_simulation.id`, and appends `AutomationSafetyTaskCalendarAndRuleSimulationStateChangedEvent` to `workflow_automation.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/automation-safety-task-calendar-and-rule-simulation/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Automation Safety Task Calendar And Rule Simulation` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `workflow_automation.automation_safety_task_calendar_and_rule_simulation` is required.

#### Definition Of Done

- `AutomationSafetyTaskCalendarAndRuleSimulationController`, service, repository, DTOs, validation, error model, and migration for `workflow_automation.automation_safety_task_calendar_and_rule_simulation` are committed under `ts-epdg-workflow-automation-studio`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/automation-safety-task-calendar-and-rule-simulation`, `workflow_automation.automation_safety_task_calendar_and_rule_simulation`, and `AutomationSafetyTaskCalendarAndRuleSimulationStateChangedEvent`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/automation-safety-task-calendar-and-rule-simulation` return `403` and write a denial audit row instead of exposing `Automation Safety Task Calendar And Rule Simulation` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `workflow_automation.automation_safety_task_calendar_and_rule_simulation` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `AutomationSafetyTaskCalendarAndRuleSimulationStateChangedEvent` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Automation Safety Task Calendar And Rule Simulation` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `workflow_automation.automation_safety_task_calendar_and_rule_simulation` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `AutomationSafetyTaskCalendarAndRuleSimulationService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/automation-safety-task-calendar-and-rule-simulation` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `workflow_automation.automation_safety_task_calendar_and_rule_simulation` columns and indexes; event replay tests validate `contracts/events/AutomationSafetyTaskCalendarAndRuleSimulationStateChangedEvent.json` and `workflow_automation.event_outbox` ordering.

### DT-06-workflow-automation-studio-P02-T004: Build Automation Safety Task Calendar And Rule Simulation workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P02 - Automation And Intent And Automation Safety Task Calendar And Rule Simulation And Configuration And Extension Studio |
| Priority | P1 |
| Source evidence | [Automation Safety Task Calendar And Rule Simulation](../features/automation-safety-task-calendar-and-rule-simulation.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Automation Safety Task Calendar And Rule Simulation |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/automation-safety-task-calendar-and-rule-simulation/`, `tests/e2e/automation-safety-task-calendar-and-rule-simulation.spec.ts`, Grafana panel `automation-safety-task-calendar-and-rule-simulation`, and `docs/operations-runbook.md#automation-safety-task-calendar-and-rule-simulation` |
| Dependencies | DT-06-workflow-automation-studio-P02-T003 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/automation-safety-task-calendar-and-rule-simulation/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Process owner, Journey owner, Automation architect.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Automation dry-run, Blast-radius review, Rule simulation, Emergency break-glass, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/workflow-automation-studio/automation-safety-task-calendar-and-rule-simulation`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Automation Safety Task Calendar And Rule Simulation` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `automation-safety-task-calendar-and-rule-simulation` refreshes, then it shows the metric and links to `docs/operations-runbook.md#automation-safety-task-calendar-and-rule-simulation`.

#### Definition Of Done

- `frontend/src/app/pages/automation-safety-task-calendar-and-rule-simulation/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/automation-safety-task-calendar-and-rule-simulation.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Automation Safety Task Calendar And Rule Simulation` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Automation Safety Task Calendar And Rule Simulation` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/automation-safety-task-calendar-and-rule-simulation.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-06-workflow-automation-studio-P02-T005: Build Configuration And Extension Studio API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P02 - Automation And Intent And Automation Safety Task Calendar And Rule Simulation And Configuration And Extension Studio |
| Priority | P0 |
| Source evidence | [Configuration And Extension Studio](../features/configuration-and-extension-studio.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Configuration And Extension Studio |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/enterpriseplatformdatagovernance/workflowautomationstudio/ConfigurationAndExtensionStudioController.java`, `workflow_automation.configuration_and_extension_studio`, `contracts/events/ConfigurationAndExtensionStudioStateChangedEvent.json`, and `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/configuration-and-extension-studio` |
| Dependencies | DT-06-workflow-automation-studio-P02-T003 |
| Outputs | `ConfigurationAndExtensionStudioController`, `ConfigurationAndExtensionStudioService`, `workflow_automation.configuration_and_extension_studio` migration, `ConfigurationAndExtensionStudioStateChangedEvent` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/configuration-and-extension-studio` using TMF672, TMF679, TMF696, TMF697, TMF701, TMF710, TMF915, TMF921, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Configuration And Extension Studio` state in `workflow_automation.configuration_and_extension_studio` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `ConfigurationAndExtensionStudioStateChangedEvent` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Configuration authoring, Tenant variant review, Test and release, Rollback or deprecation.
- Carry source details into code and tests for personas Process owner, Journey owner, Automation architect and objects configuration package, form definition, page flow, extension schema; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/configuration-and-extension-studio`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `workflow_automation.configuration_and_extension_studio.id`, and appends `ConfigurationAndExtensionStudioStateChangedEvent` to `workflow_automation.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/configuration-and-extension-studio/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Configuration And Extension Studio` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `workflow_automation.configuration_and_extension_studio` is required.

#### Definition Of Done

- `ConfigurationAndExtensionStudioController`, service, repository, DTOs, validation, error model, and migration for `workflow_automation.configuration_and_extension_studio` are committed under `ts-epdg-workflow-automation-studio`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/configuration-and-extension-studio`, `workflow_automation.configuration_and_extension_studio`, and `ConfigurationAndExtensionStudioStateChangedEvent`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/configuration-and-extension-studio` return `403` and write a denial audit row instead of exposing `Configuration And Extension Studio` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `workflow_automation.configuration_and_extension_studio` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `ConfigurationAndExtensionStudioStateChangedEvent` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Configuration And Extension Studio` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `workflow_automation.configuration_and_extension_studio` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `ConfigurationAndExtensionStudioService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/06-enterprise-platform-data-governance/workflow-automation-studio/v1/configuration-and-extension-studio` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `workflow_automation.configuration_and_extension_studio` columns and indexes; event replay tests validate `contracts/events/ConfigurationAndExtensionStudioStateChangedEvent.json` and `workflow_automation.event_outbox` ordering.

### DT-06-workflow-automation-studio-P02-T006: Build Configuration And Extension Studio workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P02 - Automation And Intent And Automation Safety Task Calendar And Rule Simulation And Configuration And Extension Studio |
| Priority | P1 |
| Source evidence | [Configuration And Extension Studio](../features/configuration-and-extension-studio.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Configuration And Extension Studio |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/configuration-and-extension-studio/`, `tests/e2e/configuration-and-extension-studio.spec.ts`, Grafana panel `configuration-and-extension-studio`, and `docs/operations-runbook.md#configuration-and-extension-studio` |
| Dependencies | DT-06-workflow-automation-studio-P02-T005 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/configuration-and-extension-studio/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Process owner, Journey owner, Automation architect.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Configuration authoring, Tenant variant review, Test and release, Rollback or deprecation, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/workflow-automation-studio/configuration-and-extension-studio`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Configuration And Extension Studio` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `configuration-and-extension-studio` refreshes, then it shows the metric and links to `docs/operations-runbook.md#configuration-and-extension-studio`.

#### Definition Of Done

- `frontend/src/app/pages/configuration-and-extension-studio/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/configuration-and-extension-studio.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Configuration And Extension Studio` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Configuration And Extension Studio` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/configuration-and-extension-studio.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-06-workflow-automation-studio-P02-T007: Prove Automation And Intent And Automation Safety Task Calendar And Rule Simulation And Configuration And Extension Studio release gate, replay, and handoff evidence

| Field | Value |
| --- | --- |
| Phase | P02 - Automation And Intent And Automation Safety Task Calendar And Rule Simulation And Configuration And Extension Studio |
| Priority | P1 |
| Source evidence | [Automation And Intent](../features/automation-and-intent.md), [Automation Safety Task Calendar And Rule Simulation](../features/automation-safety-task-calendar-and-rule-simulation.md), [Configuration And Extension Studio](../features/configuration-and-extension-studio.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../workflow-automation-studio.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Automation And Intent And Automation Safety Task Calendar And Rule Simulation And Configuration And Extension Studio |
| Build area | Test/Ops/Release/Event |
| Target artifact | `tests/release/automation-and-intent-and-automation-safety-task-calendar-and-rule-simulation.spec.ts`, `docs/release-notes/automation-and-intent-and-automation-safety-task-calendar-and-rule-simulation.md`, Grafana dashboard `automation-and-intent-and-automation-safety-task-calendar-and-rule-simulation`, and replay fixtures |
| Dependencies | DT-06-workflow-automation-studio-P02-T002, DT-06-workflow-automation-studio-P02-T004, DT-06-workflow-automation-studio-P02-T006 |
| Outputs | Release-gate test, replay/reconciliation evidence, accessibility/security/performance reports, dashboard/runbook links, support handoff notes |
| Missing evidence | No |

#### Implementation Notes

- Create a release-gate checklist for `automation-and-intent-and-automation-safety-task-calendar-and-rule-simulation` covering Automation And Intent, Automation Safety Task Calendar And Rule Simulation, Configuration And Extension Studio, with happy path, assisted path, negative path, edge cases, event replay, data reconciliation, security, accessibility, performance, and support evidence.
- Record producer and consumer acknowledgements for phase events, reconcile `workflow_automation.event_outbox`, and link replay fixtures and correlation IDs.
- Update `docs/operations-runbook.md`, `docs/release-notes/automation-and-intent-and-automation-safety-task-calendar-and-rule-simulation.md`, and `development-task-tracker.md` with release evidence and unresolved blockers.

#### Acceptance Criteria

1. Given all tasks in `P02-automation-and-intent-and-automation-safety-task-calendar-and-rule-simulation.md` are complete, when `tests/release/automation-and-intent-and-automation-safety-task-calendar-and-rule-simulation.spec.ts` runs, then it returns exit code `0` and links evidence for UI, API, data, event, security, ops, and test gates.
2. Given a consumer rejects an event from `automation-and-intent-and-automation-safety-task-calendar-and-rule-simulation`, when replay is triggered, then the replay fixture preserves `$.correlationId`, `$.eventId`, and consumer acknowledgement state.
3. Given release notes are generated, when support reviews `docs/release-notes/automation-and-intent-and-automation-safety-task-calendar-and-rule-simulation.md`, then open blockers, rollback steps, runbook links, and ownership contacts are present.

#### Definition Of Done

- `tests/release/automation-and-intent-and-automation-safety-task-calendar-and-rule-simulation.spec.ts`, replay fixtures, dashboard/runbook links, and release notes are committed.
- Accessibility, security, contract, migration, event replay, performance, and operational-readiness evidence is linked from the tracker.
- Open blockers have owner, due date, target increment, and rollback or removal criteria.

#### Negative Scenarios

- Do not mark the phase Done if event replay, reconciliation, accessibility, security, or downstream acknowledgement evidence is missing.
- Do not release `automation-and-intent-and-automation-safety-task-calendar-and-rule-simulation` with unresolved cross-app writes, direct schema coupling, or stale source authority assumptions.
- Do not suppress failed release gates; record failures with owner, due date, and target increment.

#### Edge Cases

- Coordinated release gates may require downstream app windows; record scheduling, owner, and fallback route in release notes.
- Historical backfill, replay, bulk update, or migration repair runs must include preview, partial failure report, and rollback evidence.
- High-volume launch periods require dashboard thresholds, alert owners, queue back-pressure, and support escalation paths.

#### Test Expectations

- `tests/release/automation-and-intent-and-automation-safety-task-calendar-and-rule-simulation.spec.ts`, `mvn test`, OpenAPI/event replay tests, Flyway checks, Playwright/Cypress E2E, accessibility, security, and k6/performance gates pass.
- `docker compose config`, clean-checkout smoke, `helm lint`, Kubernetes dry-run, dashboard JSON validation, and runbook link checks pass.
- Tracker evidence links command output, PRs, screenshots, replay payloads, dashboards, release notes, and support handoff notes.
