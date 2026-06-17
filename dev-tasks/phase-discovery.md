# Workflow Automation Studio Phase Discovery

## App Identity

| Field | Value |
| --- | --- |
| Suite | Enterprise Platform, Data, And Governance |
| App | Workflow Automation Studio |
| App slug | `workflow-automation-studio` |
| Implementation repo | `ts-epdg-workflow-automation-studio` |
| Database | `ts_enterprise_platform_governance` |
| Schema | `workflow_automation` |
| APIs | TMF701, TMF696, TMF679, TMF697, TMF921, TMF915, TMF672, TMF710 |
| Generated date | 2026-06-17 |
| Phase/task signature | 4 phases / P01=14, P02=7, P03=7, P04=5 |

Phase count decision: 4 phases are evidence-derived from the current app-repo state, P01 runtime bootstrap requirements, and 8 build-ready feature files grouped by lifecycle, UI/API/data/event ownership, integration risk, and release gates.

Repeated skeleton audit: Evidence-derived and accepted for this app. Even when another app shares a phase/task-count signature, this discovery file cites this app's feature files, phase files, current repo state, and split/merge decisions; regenerate and split or merge phases if those inputs change.

## Input Evidence Inventory

| Evidence | Link | Status |
| --- | --- | --- |
| App implementation usage | [../implementation-file-usage.md](../implementation-file-usage.md) | Present |
| App README | [../README.md](../README.md) | Present |
| Modules and features | [../modules-and-features.md](../modules-and-features.md) | Present |
| Personas and journeys | [../personas-and-user-journeys.md](../personas-and-user-journeys.md) | Present |
| Suite data model | [../../data-model.md](../../data-model.md) | Present |
| Suite tech/UI guidance | [../../tech-and-ui-guidance.md](../../tech-and-ui-guidance.md) | Present |
| Suite implementation guide | [../../implementation-file-usage-guide.md](../../implementation-file-usage-guide.md) | Present |
| Repository strategy | [../../../../repository-strategy.md](../../../../repository-strategy.md) | Present |
| Feature: Automation And Intent | [../features/automation-and-intent.md](../features/automation-and-intent.md) | Present |
| Feature: Automation Safety Task Calendar And Rule Simulation | [../features/automation-safety-task-calendar-and-rule-simulation.md](../features/automation-safety-task-calendar-and-rule-simulation.md) | Present |
| Feature: Configuration And Extension Studio | [../features/configuration-and-extension-studio.md](../features/configuration-and-extension-studio.md) | Present |
| Feature: Cross-App Journey Templates And Saga Compensation | [../features/cross-app-journey-templates-and-saga-compensation.md](../features/cross-app-journey-templates-and-saga-compensation.md) | Present |
| Feature: Process Definition | [../features/process-definition.md](../features/process-definition.md) | Present |
| Feature: Process Mining And Action Adapter Governance | [../features/process-mining-and-action-adapter-governance.md](../features/process-mining-and-action-adapter-governance.md) | Present |
| Feature: Rules And Decision | [../features/rules-and-decision.md](../features/rules-and-decision.md) | Present |
| Feature: Work Queue And Task | [../features/work-queue-and-task.md](../features/work-queue-and-task.md) | Present |

## App Repository Current State Inventory

| Marker | Value |
| --- | --- |
| Repo exists | Yes |
| Runnable frontend: | No |
| Runnable backend: | No |
| App-specific migrations: | Yes |
| OpenAPI contract | Yes |
| Event contracts | Yes |
| Deployment skeleton | Yes |
| CI workflow | No |
| Current implementation conclusion: | Keep the zero-to-one foundation explicit until runnable frontend, backend, migrations, contracts, CI, deployment, and proof-slice evidence are all present in `ts-epdg-workflow-automation-studio`. |

## Feature/Module Cluster Analysis

| Feature | Feature ID | Source detail carried into tasks | Implementing task IDs | Phase |
| --- | --- | --- | --- | --- |
| [Automation And Intent](../features/automation-and-intent.md) | F-workflow-automation-studio-001 |  | DT-06-workflow-automation-studio-P02-T001, DT-06-workflow-automation-studio-P02-T002, DT-06-workflow-automation-studio-P02-T007 | P02 - Automation And Intent And Automation Safety Task Calendar And Rule Simulation And Configuration And Extension Studio |
| [Automation Safety Task Calendar And Rule Simulation](../features/automation-safety-task-calendar-and-rule-simulation.md) | F-workflow-automation-studio-001 |  | DT-06-workflow-automation-studio-P02-T003, DT-06-workflow-automation-studio-P02-T004, DT-06-workflow-automation-studio-P02-T007 | P02 - Automation And Intent And Automation Safety Task Calendar And Rule Simulation And Configuration And Extension Studio |
| [Configuration And Extension Studio](../features/configuration-and-extension-studio.md) | F-workflow-automation-studio-001 |  | DT-06-workflow-automation-studio-P02-T005, DT-06-workflow-automation-studio-P02-T006, DT-06-workflow-automation-studio-P02-T007 | P02 - Automation And Intent And Automation Safety Task Calendar And Rule Simulation And Configuration And Extension Studio |
| [Cross-App Journey Templates And Saga Compensation](../features/cross-app-journey-templates-and-saga-compensation.md) | F-workflow-automation-studio-001 |  | DT-06-workflow-automation-studio-P03-T001, DT-06-workflow-automation-studio-P03-T002, DT-06-workflow-automation-studio-P03-T007 | P03 - Cross-App Journey Templates And Saga Compensation And Process Definition And Process Mining And Action Adapter Governance |
| [Process Definition](../features/process-definition.md) | F-workflow-automation-studio-001 |  | DT-06-workflow-automation-studio-P03-T003, DT-06-workflow-automation-studio-P03-T004, DT-06-workflow-automation-studio-P03-T007 | P03 - Cross-App Journey Templates And Saga Compensation And Process Definition And Process Mining And Action Adapter Governance |
| [Process Mining And Action Adapter Governance](../features/process-mining-and-action-adapter-governance.md) | F-workflow-automation-studio-001 |  | DT-06-workflow-automation-studio-P03-T005, DT-06-workflow-automation-studio-P03-T006, DT-06-workflow-automation-studio-P03-T007 | P03 - Cross-App Journey Templates And Saga Compensation And Process Definition And Process Mining And Action Adapter Governance |
| [Rules And Decision](../features/rules-and-decision.md) | F-workflow-automation-studio-001 |  | DT-06-workflow-automation-studio-P04-T001, DT-06-workflow-automation-studio-P04-T002, DT-06-workflow-automation-studio-P04-T005 | P04 - Rules And Decision And Work Queue And Task |
| [Work Queue And Task](../features/work-queue-and-task.md) | F-workflow-automation-studio-001 |  | DT-06-workflow-automation-studio-P04-T003, DT-06-workflow-automation-studio-P04-T004, DT-06-workflow-automation-studio-P04-T005 | P04 - Rules And Decision And Work Queue And Task |

## Phase Decision Matrix

| Phase file | Task count | Evidence basis | Exit gate |
| --- | --- | --- | --- |
| [P01-from-scratch-app-foundation-and-delivery-runtime.md](P01-from-scratch-app-foundation-and-delivery-runtime.md) | 14 | The planning pack and local repo inspection do not prove a complete runnable implementation for `ts-epdg-workflow-automation-studio`; this from-scratch foundation phase creates the app-root runtime, governance, contracts, data, CI, deployment, observability, and proof slice before feature delivery. | A clean checkout of `ts-epdg-workflow-automation-studio` can run Angular and Spring Boot, apply `workflow_automation` migrations, validate contracts/events, run Docker Compose and Helm checks, and prove one UI/API/data/event slice. |
| [P02-automation-and-intent-and-automation-safety-task-calendar-and-rule-simulation.md](P02-automation-and-intent-and-automation-safety-task-calendar-and-rule-simulation.md) | 7 | Build the Automation And Intent, Automation Safety Task Calendar And Rule Simulation, Configuration And Extension Studio capability cluster for Workflow Automation Studio, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work. | Workflow Automation Studio can execute the Automation And Intent, Automation Safety Task Calendar And Rule Simulation, Configuration And Extension Studio workflows through UI, API, `workflow_automation` persistence, outbox events, audit evidence, and release tests. |
| [P03-cross-app-journey-templates-and-saga-compensation-and-process-definition.md](P03-cross-app-journey-templates-and-saga-compensation-and-process-definition.md) | 7 | Build the Cross-App Journey Templates And Saga Compensation, Process Definition, Process Mining And Action Adapter Governance capability cluster for Workflow Automation Studio, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work. | Workflow Automation Studio can execute the Cross-App Journey Templates And Saga Compensation, Process Definition, Process Mining And Action Adapter Governance workflows through UI, API, `workflow_automation` persistence, outbox events, audit evidence, and release tests. |
| [P04-rules-and-decision-and-work-queue-and-task.md](P04-rules-and-decision-and-work-queue-and-task.md) | 5 | Build the Rules And Decision, Work Queue And Task capability cluster for Workflow Automation Studio, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work. | Workflow Automation Studio can execute the Rules And Decision, Work Queue And Task workflows through UI, API, `workflow_automation` persistence, outbox events, audit evidence, and release tests. |

## Split/Merge Decisions

- P01 remains the app-runtime foundation because the local repo inspection does not prove a complete runnable implementation for `ts-epdg-workflow-automation-studio`.
- Feature phases are grouped from source `features/*.md` files by lifecycle ownership, UI workbench/API/data/event coupling, security/privacy controls, observability, and release-test needs.
- Every feature file appears in task `Source evidence`, the tracker coverage matrix, and this discovery artifact; tracker-only feature references are not accepted as coverage.
- Generic phase names from older task packs are retired by this refresh and replaced with feature-derived phase names.

## Validator and Regeneration Notes

- Run `python3 telcosuite-skills/skills/tmf-dev-task-planner/scripts/validate_dev_tasks.py --root ts-planning/planning/suite-details/06-enterprise-platform-data-governance/workflow-automation-studio --strict` after refresh.
- Re-run the mirror driver after validation so `ts-epdg-workflow-automation-studio/dev-tasks/` remains byte-identical to the planning source.
- If a source feature changes, refresh this app pack and verify phase count, feature coverage, task detail quality, and mirror parity again.
