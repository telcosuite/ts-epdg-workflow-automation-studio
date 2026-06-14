# Workflow And Automation Studio TMF API To DDL Review

Reviewed: 2026-06-14

Status: Complete for baseline app implementation. Endpoint-specific contract tests and final story-level field promotion still happen during build.

## Scope

This review covers `workflow_automation` in suite database `ts_enterprise_platform_governance`. It uses the local TMF Open API reference set, the suite data model, the API-to-DDL traceability matrix, and the V001 starter DDL.

The review confirms that the app can move into implementation with a V002 typed DDL baseline while preserving full TMF payload compatibility through validated `tmf_payload`, typed common TMF columns, and normalized support tables.

## TMF API Baseline Selection

| TMF API | Local baseline spec | Resources/path roots reviewed | V001 table groups |
| --- | --- | --- | --- |
| TMF701 | `references/tmforum-open-apis/openapi-specs/TMF701_ProcessFlow/TMF701-ProcessFlow-v4.0.0.swagger.json` | `processFlow` | process_definition; process_version; work_queue; task; provisioning_workflow_state |
| TMF696 | `references/tmforum-open-apis/openapi-specs/TMF696_RiskManagement/TMF696_Risk_Management_API_v4.0.0_swagger.json` | `partyRoleProductOfferingRiskAssessment`, `partyRoleRiskAssessment`, `productOfferingRiskAssessment`, `productOrderRiskAssessment`, `shoppingCartRiskAssessment` | rule_definition; decision_definition; credit_decision; risk_exposure; compliance_control |
| TMF679 | `references/tmforum-open-apis/openapi-specs/TMF679_ProductOfferingQualification/TMF679-Product_Offering_Qualification-v5.0.0.oas.yaml` | `checkProductOfferingQualification`, `queryProductOfferingQualification` | offering_qualification; serviceability_decision references |
| TMF697 | `references/tmforum-open-apis/openapi-specs/TMF697_Work_Order/TMF697-WorkOrder-v4.0.0.swagger.json` | `cancelWorkOrder`, `workOrder` | work_order; remediation_task; vendor_work_package; build_program |
| TMF921 | `references/tmforum-open-apis/openapi-specs/TMF921_Intent/TMF921_Intent_Management_v5.0.0.oas.yaml` | `intent`, `intentSpecification` | automation_playbook; intent_handling_metadata |
| TMF915 | `references/tmforum-open-apis/openapi-specs/TMF915_AIManagementSuite/TMF915_AI_Management_API_v4.0.0_swagger.json` | `aiContract`, `aiContractSpecification`, `aiContractViolation`, `aiModel`, `aiModelSpecification`, `alarm`, `monitor`, `rule`, `topic` | ai_model_governance |
| TMF672 | `references/tmforum-open-apis/openapi-specs/TMF672_UserRolesPermissions/TMF672-User_Role_Permission_Management_API-v5.1.0.oas.yaml` | `checkPermission`, `permissionSet`, `permissionSpecification`, `permissionSpecificationSet` | tenant; environment; platform_user; platform_role; platform_permission; developer_application references |
| TMF710 | `references/tmforum-open-apis/openapi-specs/TMF710_GeneralTestArtifact/TMF710_General_Test_Artifact_Management_API_v4.0.0_swagger.json` | `generalTestArtifact` | api_contract; api_contract_version; test_artifact; conformance_evidence |

## Current DDL Coverage

Current starter DDL is in `database/postgres/suites/ts_enterprise_platform_governance/V001__create_app_schemas_and_starter_tables.sql` under schema `workflow_automation`.

| Current table | TMF purpose | V002 decision |
| --- | --- | --- |
| `workflow_automation.process_definition` | Starter table for Workflow And Automation Studio; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_enterprise_platform_governance/V005__refine_workflow_automation_tmf_core.sql` |
| `workflow_automation.process_version` | Starter table for Workflow And Automation Studio; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_enterprise_platform_governance/V005__refine_workflow_automation_tmf_core.sql` |
| `workflow_automation.rule_definition` | Starter table for Workflow And Automation Studio; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_enterprise_platform_governance/V005__refine_workflow_automation_tmf_core.sql` |
| `workflow_automation.decision_definition` | Starter table for Workflow And Automation Studio; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_enterprise_platform_governance/V005__refine_workflow_automation_tmf_core.sql` |
| `workflow_automation.work_queue` | Starter table for Workflow And Automation Studio; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_enterprise_platform_governance/V005__refine_workflow_automation_tmf_core.sql` |
| `workflow_automation.task` | Starter table for Workflow And Automation Studio; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_enterprise_platform_governance/V005__refine_workflow_automation_tmf_core.sql` |
| `workflow_automation.automation_playbook` | Starter table for Workflow And Automation Studio; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_enterprise_platform_governance/V005__refine_workflow_automation_tmf_core.sql` |
| `workflow_automation.intent_handling_metadata` | Starter table for Workflow And Automation Studio; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_enterprise_platform_governance/V005__refine_workflow_automation_tmf_core.sql` |
| `workflow_automation.configuration_package` | Starter table for Workflow And Automation Studio; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_enterprise_platform_governance/V005__refine_workflow_automation_tmf_core.sql` |
| `workflow_automation.extension_schema` | Starter table for Workflow And Automation Studio; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_enterprise_platform_governance/V005__refine_workflow_automation_tmf_core.sql` |
| `workflow_automation.event_outbox` | App outbox for domain and TMF notification events. | Keep and refine through `database/postgres/suites/ts_enterprise_platform_governance/V005__refine_workflow_automation_tmf_core.sql` |

## Resource To Table Decisions

| TMF API/resource | Master or anchor table | Path coverage | Promoted field candidates | Field handling strategy |
| --- | --- | --- | --- | --- |
| TMF701 `processFlow` | `workflow_automation.process_definition` | `/processFlow`, `/processFlow/{id}`, `/processFlow/{processFlowId}/taskFlow` | `id`, `href`, `processFlowDate`, `processFlowSpecification`, `channel`, `characteristic`, `relatedEntity`, `relatedParty` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF696 `partyRoleProductOfferingRiskAssessment` | `workflow_automation.rule_definition` | `/partyRoleProductOfferingRiskAssessment`, `/partyRoleProductOfferingRiskAssessment/{id}` | `id`, `href`, `status`, `characteristic`, `partyRole`, `place`, `productOffering`, `riskAssessmentResult` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF696 `partyRoleRiskAssessment` | `workflow_automation.rule_definition` | `/partyRoleRiskAssessment`, `/partyRoleRiskAssessment/{id}` | `id`, `href`, `status`, `characteristic`, `place`, `riskAssessmentResult`, `@baseType`, `@schemaLocation` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF696 `productOfferingRiskAssessment` | `workflow_automation.rule_definition` | `/productOfferingRiskAssessment`, `/productOfferingRiskAssessment/{id}` | `id`, `href`, `status`, `characteristic`, `partyRole`, `place`, `productOffering`, `riskAssessmentResult` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF696 `productOrderRiskAssessment` | `workflow_automation.rule_definition` | `/productOrderRiskAssessment`, `/productOrderRiskAssessment/{id}` | `id`, `href`, `status`, `characteristic`, `place`, `productOrder`, `riskAssessmentResult`, `@baseType` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF696 `shoppingCartRiskAssessment` | `workflow_automation.rule_definition` | `/shoppingCartRiskAssessment`, `/shoppingCartRiskAssessment/{id}` | `id`, `href`, `status`, `characteristic`, `place`, `riskAssessmentResult`, `shoppingCart`, `@baseType` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF679 `checkProductOfferingQualification` | `workflow_automation.process_definition` | `/checkProductOfferingQualification`, `/checkProductOfferingQualification/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF679 `queryProductOfferingQualification` | `workflow_automation.process_definition` | `/queryProductOfferingQualification`, `/queryProductOfferingQualification/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF697 `cancelWorkOrder` | `workflow_automation.work_queue` | `/cancelWorkOrder`, `/cancelWorkOrder/{id}` | `id`, `href`, `cancellationDate`, `cancellationReason`, `category`, `completionDate`, `description`, `expectedCompletionDate` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF697 `workOrder` | `workflow_automation.work_queue` | `/workOrder`, `/workOrder/{id}` | `id`, `href`, `cancellationDate`, `cancellationReason`, `category`, `completionDate`, `description`, `expectedCompletionDate` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF921 `intent` | `workflow_automation.intent_handling_metadata` | `/intent`, `/intent/{id}`, `/intent/{intentId}/intentReport` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF921 `intentSpecification` | `workflow_automation.intent_handling_metadata` | `/intentSpecification`, `/intentSpecification/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF915 `aiContract` | `workflow_automation.process_definition` | `/aiContract`, `/aiContract/{id}` | `id`, `href`, `approvalDate`, `approved`, `description`, `name`, `state`, `version` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF915 `aiContractSpecification` | `workflow_automation.process_definition` | `/aiContractSpecification`, `/aiContractSpecification/{id}` | `id`, `href`, `description`, `isBundle`, `lastUpdate`, `lifecycleStatus`, `name`, `version` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF915 `aiContractViolation` | `workflow_automation.process_definition` | `/aiContractViolation`, `/aiContractViolation/{id}` | `id`, `href`, `actualValue`, `comment`, `consequence`, `operator`, `referenceValue`, `tolerance` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF915 `aiModel` | `workflow_automation.process_definition` | `/aiModel`, `/aiModel/{id}` | `id`, `href`, `category`, `description`, `endDate`, `hasStarted`, `isBundle`, `isServiceEnabled` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF915 `aiModelSpecification` | `workflow_automation.process_definition` | `/aiModelSpecification`, `/aiModelSpecification/{id}` | `id`, `href`, `deploymentRecord`, `description`, `inheritedModel`, `isBundle`, `lastUpdate`, `lifecycleStatus` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF915 `alarm` | `workflow_automation.process_definition` | `/alarm`, `/alarm/{id}` | `id`, `href`, `ackState`, `ackSystemId`, `ackUserId`, `alarmChangedTime`, `alarmClearedTime`, `alarmDetails` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF915 `monitor` | `workflow_automation.process_definition` | `/monitor`, `/monitor/{id}` | `id`, `href`, `sourceHref`, `state`, `request`, `response`, `@baseType`, `@schemaLocation` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF915 `rule` | `workflow_automation.rule_definition` | `/rule`, `/rule/{id}` | `id`, `href`, `conformanceComparatorLower`, `conformanceComparatorUpper`, `conformanceTargetLower`, `conformanceTargetUpper`, `gracePeriods`, `name` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF915 `topic` | `workflow_automation.process_definition` | `/topic`, `/topic/{id}`, `/topic/{topicId}/event` | `id`, `href`, `contentQuery`, `headerQuery`, `name`, `@baseType`, `@schemaLocation`, `@type` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF672 `checkPermission` | `workflow_automation.process_definition` | `/checkPermission`, `/checkPermission/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF672 `permissionSet` | `workflow_automation.process_definition` | `/permissionSet`, `/permissionSet/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF672 `permissionSpecification` | `workflow_automation.process_definition` | `/permissionSpecification`, `/permissionSpecification/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF672 `permissionSpecificationSet` | `workflow_automation.process_definition` | `/permissionSpecificationSet`, `/permissionSpecificationSet/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF710 `generalTestArtifact` | `workflow_automation.process_definition` | `/generalTestArtifact`, `/generalTestArtifact/{id}` | `id`, `href`, `description`, `version`, `versionDescription`, `agreement`, `attribute`, `generalArtifactDefinition` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |

## V002 DDL Refinement

Migration: `database/postgres/suites/ts_enterprise_platform_governance/V005__refine_workflow_automation_tmf_core.sql`

The migration adds this implementation baseline for the app:

| Area | Decision |
| --- | --- |
| Common TMF fields | Add reusable typed columns such as `tmf_id`, `tmf_href`, `tmf_type`, `tmf_base_type`, `tmf_schema_location`, `tmf_referred_type`, `tmf_name`, `tmf_description`, `tmf_lifecycle_status`, `tmf_state`, dates, priority, and external ID to every V001 app table. |
| Full TMF compatibility | Keep the V001 `tmf_payload` column as the complete validated TMF resource snapshot for fields that are not yet promoted to typed columns. |
| Characteristics and references | Add normalized `tmf_characteristic`, `tmf_resource_reference`, `tmf_external_identifier`, `tmf_related_party`, `tmf_note`, `tmf_attachment`, and `tmf_relationship` support tables. |
| API/resource map | Add `tmf_api_resource_map` rows for the selected local TMF APIs and resource roots. |
| Event contracts | Add baseline event contract rows for create, update, state-change, and delete events per reviewed API resource. |
| Privacy and audit | Add table-level privacy, retention, legal-hold, residency, masking, and audit policy rows. |
| High-volume candidates | `workflow_automation.event_outbox` |

## Event Contract Baseline

Events are registered in `workflow_automation.event_contract` using `workflow_automation.event_outbox` as the publication basis. Consumers must be added when integrations are designed; no app should directly write another app schema.

## Privacy, Retention, And Audit Baseline

| Table | Data classification | Retention class | Audit level |
| --- | --- | --- | --- |
| `workflow_automation.process_definition` | internal | domain_lifecycle | standard |
| `workflow_automation.process_version` | internal | domain_lifecycle | standard |
| `workflow_automation.rule_definition` | internal | domain_lifecycle | standard |
| `workflow_automation.decision_definition` | internal | domain_lifecycle | standard |
| `workflow_automation.work_queue` | internal | domain_lifecycle | standard |
| `workflow_automation.task` | internal | domain_lifecycle | standard |
| `workflow_automation.automation_playbook` | internal | domain_lifecycle | standard |
| `workflow_automation.intent_handling_metadata` | internal | domain_lifecycle | standard |
| `workflow_automation.configuration_package` | internal | domain_lifecycle | standard |
| `workflow_automation.extension_schema` | internal | domain_lifecycle | standard |
| `workflow_automation.event_outbox` | internal | operational_telemetry | standard |

## Build Gate Result

| Gate item | Result |
| --- | --- |
| API/resource review | Complete for baseline implementation |
| V002 typed DDL | Complete: `database/postgres/suites/ts_enterprise_platform_governance/V005__refine_workflow_automation_tmf_core.sql` |
| Event contract register | Baseline complete |
| Privacy/retention/audit classification | Baseline complete |
| Remaining implementation control | Validate exact endpoint operations and contract tests as Angular/Spring Boot features are built |
