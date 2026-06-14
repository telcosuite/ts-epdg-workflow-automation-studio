-- TelcoSuite V005 TMF core refinement for Workflow And Automation Studio
-- Target database: ts_enterprise_platform_governance
-- App schema: workflow_automation
-- Generated from: planning/suite-details/tmf-api-ddl-reviews/workflow-automation.md
-- Reviewed: 2026-06-14

CREATE EXTENSION IF NOT EXISTS pgcrypto;

BEGIN;

COMMENT ON SCHEMA workflow_automation IS 'App-owned schema for Workflow And Automation Studio; V002 TMF baseline review complete on 2026-06-14.';

-- Promote common TMF resource fields on workflow_automation.process_definition.
ALTER TABLE workflow_automation.process_definition
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_process_definition_tmf_id ON workflow_automation.process_definition (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_process_definition_tmf_href ON workflow_automation.process_definition (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_process_definition_tmf_state ON workflow_automation.process_definition (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN workflow_automation.process_definition.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN workflow_automation.process_definition.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on workflow_automation.process_version.
ALTER TABLE workflow_automation.process_version
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_process_version_tmf_id ON workflow_automation.process_version (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_process_version_tmf_href ON workflow_automation.process_version (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_process_version_tmf_state ON workflow_automation.process_version (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN workflow_automation.process_version.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN workflow_automation.process_version.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on workflow_automation.rule_definition.
ALTER TABLE workflow_automation.rule_definition
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_rule_definition_tmf_id ON workflow_automation.rule_definition (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_rule_definition_tmf_href ON workflow_automation.rule_definition (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_rule_definition_tmf_state ON workflow_automation.rule_definition (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN workflow_automation.rule_definition.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN workflow_automation.rule_definition.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on workflow_automation.decision_definition.
ALTER TABLE workflow_automation.decision_definition
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_decision_definition_tmf_id ON workflow_automation.decision_definition (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_decision_definition_tmf_href ON workflow_automation.decision_definition (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_decision_definition_tmf_state ON workflow_automation.decision_definition (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN workflow_automation.decision_definition.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN workflow_automation.decision_definition.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on workflow_automation.work_queue.
ALTER TABLE workflow_automation.work_queue
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_work_queue_tmf_id ON workflow_automation.work_queue (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_work_queue_tmf_href ON workflow_automation.work_queue (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_work_queue_tmf_state ON workflow_automation.work_queue (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN workflow_automation.work_queue.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN workflow_automation.work_queue.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on workflow_automation.task.
ALTER TABLE workflow_automation.task
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_task_tmf_id ON workflow_automation.task (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_task_tmf_href ON workflow_automation.task (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_task_tmf_state ON workflow_automation.task (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN workflow_automation.task.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN workflow_automation.task.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on workflow_automation.automation_playbook.
ALTER TABLE workflow_automation.automation_playbook
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_automation_playbook_tmf_id ON workflow_automation.automation_playbook (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_automation_playbook_tmf_href ON workflow_automation.automation_playbook (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_automation_playbook_tmf_state ON workflow_automation.automation_playbook (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN workflow_automation.automation_playbook.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN workflow_automation.automation_playbook.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on workflow_automation.intent_handling_metadata.
ALTER TABLE workflow_automation.intent_handling_metadata
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_intent_handling_metadata_tmf_id ON workflow_automation.intent_handling_metadata (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_intent_handling_metadata_tmf_href ON workflow_automation.intent_handling_metadata (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_intent_handling_metadata_tmf_state ON workflow_automation.intent_handling_metadata (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN workflow_automation.intent_handling_metadata.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN workflow_automation.intent_handling_metadata.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on workflow_automation.configuration_package.
ALTER TABLE workflow_automation.configuration_package
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_configuration_package_tmf_id ON workflow_automation.configuration_package (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_configuration_package_tmf_href ON workflow_automation.configuration_package (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_configuration_package_tmf_state ON workflow_automation.configuration_package (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN workflow_automation.configuration_package.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN workflow_automation.configuration_package.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on workflow_automation.extension_schema.
ALTER TABLE workflow_automation.extension_schema
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_extension_schema_tmf_id ON workflow_automation.extension_schema (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_extension_schema_tmf_href ON workflow_automation.extension_schema (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_extension_schema_tmf_state ON workflow_automation.extension_schema (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN workflow_automation.extension_schema.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN workflow_automation.extension_schema.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on workflow_automation.event_outbox.
ALTER TABLE workflow_automation.event_outbox
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_event_outbox_tmf_id ON workflow_automation.event_outbox (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_event_outbox_tmf_href ON workflow_automation.event_outbox (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_event_outbox_tmf_state ON workflow_automation.event_outbox (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN workflow_automation.event_outbox.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN workflow_automation.event_outbox.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

CREATE TABLE IF NOT EXISTS workflow_automation.tmf_api_resource_map (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tmf_api text NOT NULL,
    tmf_resource text NOT NULL,
    resource_path text,
    anchor_table text NOT NULL,
    ownership_role text NOT NULL DEFAULT 'master_or_projection',
    field_strategy text NOT NULL,
    local_spec_path text,
    promoted_fields jsonb NOT NULL DEFAULT '[]'::jsonb,
    payload_required boolean NOT NULL DEFAULT true,
    contract_test_required boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uk_tmf_api_resource_map UNIQUE (tmf_api, tmf_resource, anchor_table)
);

CREATE TABLE IF NOT EXISTS workflow_automation.tmf_resource_reference (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    reference_role text NOT NULL,
    referenced_api text,
    referenced_resource text,
    referenced_id text,
    referenced_href text,
    referenced_name text,
    referred_type text,
    reference_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    valid_from timestamptz,
    valid_to timestamptz,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    CONSTRAINT ck_tmf_resource_reference_validity CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE TABLE IF NOT EXISTS workflow_automation.tmf_characteristic (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    characteristic_name text NOT NULL,
    value_type text,
    characteristic_value jsonb NOT NULL DEFAULT '{}'::jsonb,
    value_from timestamptz,
    value_to timestamptz,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    CONSTRAINT ck_tmf_characteristic_validity CHECK (value_to IS NULL OR value_from IS NULL OR value_to >= value_from)
);

CREATE TABLE IF NOT EXISTS workflow_automation.tmf_external_identifier (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    owner text,
    external_identifier_type text,
    external_identifier_id text NOT NULL,
    external_href text,
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uk_tmf_external_identifier UNIQUE (tenant_id, source_table, external_identifier_id)
);

CREATE TABLE IF NOT EXISTS workflow_automation.tmf_related_party (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    party_id text,
    party_href text,
    party_name text,
    party_role text,
    party_referred_type text,
    related_party_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS workflow_automation.tmf_note (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    note_author text,
    note_date timestamptz,
    note_text text NOT NULL,
    note_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS workflow_automation.tmf_attachment (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    attachment_id text,
    attachment_href text,
    attachment_name text,
    attachment_type text,
    mime_type text,
    content_url text,
    size_amount numeric,
    size_units text,
    attachment_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS workflow_automation.tmf_relationship (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    relationship_type text NOT NULL,
    target_table text,
    target_record_id uuid,
    target_canonical_id text,
    target_api text,
    target_resource text,
    target_href text,
    relationship_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    valid_from timestamptz,
    valid_to timestamptz,
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT ck_tmf_relationship_validity CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE TABLE IF NOT EXISTS workflow_automation.event_contract (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    event_name text NOT NULL,
    event_version text NOT NULL DEFAULT 'v1',
    tmf_api text,
    tmf_resource text,
    source_table text NOT NULL,
    event_type text NOT NULL,
    event_key_strategy text NOT NULL,
    payload_basis text NOT NULL,
    outbox_table text NOT NULL DEFAULT 'workflow_automation.event_outbox',
    retention_class text NOT NULL DEFAULT 'event_replay_90d',
    masking_policy text NOT NULL DEFAULT 'Apply source table masking policy before external publication',
    consumer_notes text,
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uk_event_contract UNIQUE (event_name, event_version)
);

CREATE TABLE IF NOT EXISTS workflow_automation.privacy_retention_policy (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    table_name text NOT NULL,
    data_domain text NOT NULL,
    data_classification text NOT NULL,
    retention_class text NOT NULL,
    retention_basis text NOT NULL,
    default_retention_days integer,
    legal_hold_supported boolean NOT NULL DEFAULT true,
    residency_rule text,
    masking_policy text NOT NULL,
    audit_level text NOT NULL DEFAULT 'standard',
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uk_privacy_retention_policy UNIQUE (table_name)
);

CREATE INDEX IF NOT EXISTS ix_tmf_api_resource_map_lookup ON workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource);
CREATE INDEX IF NOT EXISTS ix_tmf_resource_reference_lookup ON workflow_automation.tmf_resource_reference (tenant_id, source_table, source_canonical_id);
CREATE INDEX IF NOT EXISTS ix_tmf_characteristic_lookup ON workflow_automation.tmf_characteristic (tenant_id, source_table, characteristic_name);
CREATE INDEX IF NOT EXISTS ix_tmf_external_identifier_lookup ON workflow_automation.tmf_external_identifier (tenant_id, external_identifier_id);
CREATE INDEX IF NOT EXISTS ix_tmf_related_party_lookup ON workflow_automation.tmf_related_party (tenant_id, party_id);
CREATE INDEX IF NOT EXISTS ix_tmf_note_lookup ON workflow_automation.tmf_note (tenant_id, source_table, source_canonical_id);
CREATE INDEX IF NOT EXISTS ix_tmf_attachment_lookup ON workflow_automation.tmf_attachment (tenant_id, source_table, source_canonical_id);
CREATE INDEX IF NOT EXISTS ix_tmf_relationship_lookup ON workflow_automation.tmf_relationship (tenant_id, source_table, relationship_type);
CREATE INDEX IF NOT EXISTS ix_event_contract_lookup ON workflow_automation.event_contract (event_name, event_version);
CREATE INDEX IF NOT EXISTS ix_privacy_retention_policy_lookup ON workflow_automation.privacy_retention_policy (table_name);

COMMENT ON TABLE workflow_automation.tmf_api_resource_map IS 'V002 TMF support/control table for Workflow And Automation Studio.';
COMMENT ON TABLE workflow_automation.tmf_resource_reference IS 'V002 TMF support/control table for Workflow And Automation Studio.';
COMMENT ON TABLE workflow_automation.tmf_characteristic IS 'V002 TMF support/control table for Workflow And Automation Studio.';
COMMENT ON TABLE workflow_automation.tmf_external_identifier IS 'V002 TMF support/control table for Workflow And Automation Studio.';
COMMENT ON TABLE workflow_automation.tmf_related_party IS 'V002 TMF support/control table for Workflow And Automation Studio.';
COMMENT ON TABLE workflow_automation.tmf_note IS 'V002 TMF support/control table for Workflow And Automation Studio.';
COMMENT ON TABLE workflow_automation.tmf_attachment IS 'V002 TMF support/control table for Workflow And Automation Studio.';
COMMENT ON TABLE workflow_automation.tmf_relationship IS 'V002 TMF support/control table for Workflow And Automation Studio.';
COMMENT ON TABLE workflow_automation.event_contract IS 'V002 TMF support/control table for Workflow And Automation Studio.';
COMMENT ON TABLE workflow_automation.privacy_retention_policy IS 'V002 TMF support/control table for Workflow And Automation Studio.';


INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF701', 'processFlow', '/processFlow', 'process_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF701_ProcessFlow/TMF701-ProcessFlow-v4.0.0.swagger.json', '["id", "href", "processFlowDate", "processFlowSpecification", "channel", "characteristic", "relatedEntity", "relatedParty", "state", "taskFlow", "@baseType", "@schemaLocation", "@type"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.process_flow.created', 'v1', 'TMF701', 'processFlow', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.process_flow.updated', 'v1', 'TMF701', 'processFlow', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.process_flow.stateChanged', 'v1', 'TMF701', 'processFlow', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.process_flow.deleted', 'v1', 'TMF701', 'processFlow', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF696', 'partyRoleProductOfferingRiskAssessment', '/partyRoleProductOfferingRiskAssessment', 'rule_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF696_RiskManagement/TMF696_Risk_Management_API_v4.0.0_swagger.json', '["id", "href", "status", "characteristic", "partyRole", "place", "productOffering", "riskAssessmentResult", "@baseType", "@schemaLocation", "@type"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.party_role_product_offering_risk_assessment.created', 'v1', 'TMF696', 'partyRoleProductOfferingRiskAssessment', 'workflow_automation.rule_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.party_role_product_offering_risk_assessment.updated', 'v1', 'TMF696', 'partyRoleProductOfferingRiskAssessment', 'workflow_automation.rule_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.party_role_product_offering_risk_assessment.stateChanged', 'v1', 'TMF696', 'partyRoleProductOfferingRiskAssessment', 'workflow_automation.rule_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.party_role_product_offering_risk_assessment.deleted', 'v1', 'TMF696', 'partyRoleProductOfferingRiskAssessment', 'workflow_automation.rule_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF696', 'partyRoleRiskAssessment', '/partyRoleRiskAssessment', 'rule_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF696_RiskManagement/TMF696_Risk_Management_API_v4.0.0_swagger.json', '["id", "href", "status", "characteristic", "place", "riskAssessmentResult", "@baseType", "@schemaLocation", "@type"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.party_role_risk_assessment.created', 'v1', 'TMF696', 'partyRoleRiskAssessment', 'workflow_automation.rule_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.party_role_risk_assessment.updated', 'v1', 'TMF696', 'partyRoleRiskAssessment', 'workflow_automation.rule_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.party_role_risk_assessment.stateChanged', 'v1', 'TMF696', 'partyRoleRiskAssessment', 'workflow_automation.rule_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.party_role_risk_assessment.deleted', 'v1', 'TMF696', 'partyRoleRiskAssessment', 'workflow_automation.rule_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF696', 'productOfferingRiskAssessment', '/productOfferingRiskAssessment', 'rule_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF696_RiskManagement/TMF696_Risk_Management_API_v4.0.0_swagger.json', '["id", "href", "status", "characteristic", "partyRole", "place", "productOffering", "riskAssessmentResult", "@baseType", "@schemaLocation", "@type"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.product_offering_risk_assessment.created', 'v1', 'TMF696', 'productOfferingRiskAssessment', 'workflow_automation.rule_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.product_offering_risk_assessment.updated', 'v1', 'TMF696', 'productOfferingRiskAssessment', 'workflow_automation.rule_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.product_offering_risk_assessment.stateChanged', 'v1', 'TMF696', 'productOfferingRiskAssessment', 'workflow_automation.rule_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.product_offering_risk_assessment.deleted', 'v1', 'TMF696', 'productOfferingRiskAssessment', 'workflow_automation.rule_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF696', 'productOrderRiskAssessment', '/productOrderRiskAssessment', 'rule_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF696_RiskManagement/TMF696_Risk_Management_API_v4.0.0_swagger.json', '["id", "href", "status", "characteristic", "place", "productOrder", "riskAssessmentResult", "@baseType", "@schemaLocation", "@type"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.product_order_risk_assessment.created', 'v1', 'TMF696', 'productOrderRiskAssessment', 'workflow_automation.rule_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.product_order_risk_assessment.updated', 'v1', 'TMF696', 'productOrderRiskAssessment', 'workflow_automation.rule_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.product_order_risk_assessment.stateChanged', 'v1', 'TMF696', 'productOrderRiskAssessment', 'workflow_automation.rule_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.product_order_risk_assessment.deleted', 'v1', 'TMF696', 'productOrderRiskAssessment', 'workflow_automation.rule_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF696', 'shoppingCartRiskAssessment', '/shoppingCartRiskAssessment', 'rule_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF696_RiskManagement/TMF696_Risk_Management_API_v4.0.0_swagger.json', '["id", "href", "status", "characteristic", "place", "riskAssessmentResult", "shoppingCart", "@baseType", "@schemaLocation", "@type"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.shopping_cart_risk_assessment.created', 'v1', 'TMF696', 'shoppingCartRiskAssessment', 'workflow_automation.rule_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.shopping_cart_risk_assessment.updated', 'v1', 'TMF696', 'shoppingCartRiskAssessment', 'workflow_automation.rule_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.shopping_cart_risk_assessment.stateChanged', 'v1', 'TMF696', 'shoppingCartRiskAssessment', 'workflow_automation.rule_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.shopping_cart_risk_assessment.deleted', 'v1', 'TMF696', 'shoppingCartRiskAssessment', 'workflow_automation.rule_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF679', 'checkProductOfferingQualification', '/checkProductOfferingQualification', 'process_definition', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF679_ProductOfferingQualification/TMF679-Product_Offering_Qualification-v5.0.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.check_product_offering_qualification.created', 'v1', 'TMF679', 'checkProductOfferingQualification', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.check_product_offering_qualification.updated', 'v1', 'TMF679', 'checkProductOfferingQualification', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.check_product_offering_qualification.stateChanged', 'v1', 'TMF679', 'checkProductOfferingQualification', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.check_product_offering_qualification.deleted', 'v1', 'TMF679', 'checkProductOfferingQualification', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF679', 'queryProductOfferingQualification', '/queryProductOfferingQualification', 'process_definition', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF679_ProductOfferingQualification/TMF679-Product_Offering_Qualification-v5.0.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.query_product_offering_qualification.created', 'v1', 'TMF679', 'queryProductOfferingQualification', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.query_product_offering_qualification.updated', 'v1', 'TMF679', 'queryProductOfferingQualification', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.query_product_offering_qualification.stateChanged', 'v1', 'TMF679', 'queryProductOfferingQualification', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.query_product_offering_qualification.deleted', 'v1', 'TMF679', 'queryProductOfferingQualification', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF697', 'cancelWorkOrder', '/cancelWorkOrder', 'work_queue', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF697_Work_Order/TMF697-WorkOrder-v4.0.0.swagger.json', '["id", "href", "cancellationDate", "cancellationReason", "category", "completionDate", "description", "expectedCompletionDate", "externalId", "notificationContact", "orderDate", "priority", "requestedCompletionDate", "requestedStartDate", "startDate", "stateChangeDate"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.cancel_work_order.created', 'v1', 'TMF697', 'cancelWorkOrder', 'workflow_automation.work_queue', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.cancel_work_order.updated', 'v1', 'TMF697', 'cancelWorkOrder', 'workflow_automation.work_queue', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.cancel_work_order.stateChanged', 'v1', 'TMF697', 'cancelWorkOrder', 'workflow_automation.work_queue', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.cancel_work_order.deleted', 'v1', 'TMF697', 'cancelWorkOrder', 'workflow_automation.work_queue', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF697', 'workOrder', '/workOrder', 'work_queue', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF697_Work_Order/TMF697-WorkOrder-v4.0.0.swagger.json', '["id", "href", "cancellationDate", "cancellationReason", "category", "completionDate", "description", "expectedCompletionDate", "externalId", "notificationContact", "orderDate", "priority", "requestedCompletionDate", "requestedStartDate", "startDate", "stateChangeDate"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.work_order.created', 'v1', 'TMF697', 'workOrder', 'workflow_automation.work_queue', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.work_order.updated', 'v1', 'TMF697', 'workOrder', 'workflow_automation.work_queue', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.work_order.stateChanged', 'v1', 'TMF697', 'workOrder', 'workflow_automation.work_queue', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.work_order.deleted', 'v1', 'TMF697', 'workOrder', 'workflow_automation.work_queue', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF921', 'intent', '/intent', 'intent_handling_metadata', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF921_Intent/TMF921_Intent_Management_v5.0.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.intent.created', 'v1', 'TMF921', 'intent', 'workflow_automation.intent_handling_metadata', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.intent.updated', 'v1', 'TMF921', 'intent', 'workflow_automation.intent_handling_metadata', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.intent.stateChanged', 'v1', 'TMF921', 'intent', 'workflow_automation.intent_handling_metadata', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.intent.deleted', 'v1', 'TMF921', 'intent', 'workflow_automation.intent_handling_metadata', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF921', 'intentSpecification', '/intentSpecification', 'intent_handling_metadata', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF921_Intent/TMF921_Intent_Management_v5.0.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.intent_specification.created', 'v1', 'TMF921', 'intentSpecification', 'workflow_automation.intent_handling_metadata', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.intent_specification.updated', 'v1', 'TMF921', 'intentSpecification', 'workflow_automation.intent_handling_metadata', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.intent_specification.stateChanged', 'v1', 'TMF921', 'intentSpecification', 'workflow_automation.intent_handling_metadata', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.intent_specification.deleted', 'v1', 'TMF921', 'intentSpecification', 'workflow_automation.intent_handling_metadata', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF915', 'aiContract', '/aiContract', 'process_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF915_AIManagementSuite/TMF915_AI_Management_API_v4.0.0_swagger.json', '["id", "href", "approvalDate", "approved", "description", "name", "state", "version", "aiContractSpecification", "aiModel", "characteristic", "relatedParty", "rule", "template", "validFor", "@baseType"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_contract.created', 'v1', 'TMF915', 'aiContract', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_contract.updated', 'v1', 'TMF915', 'aiContract', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_contract.stateChanged', 'v1', 'TMF915', 'aiContract', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_contract.deleted', 'v1', 'TMF915', 'aiContract', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF915', 'aiContractSpecification', '/aiContractSpecification', 'process_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF915_AIManagementSuite/TMF915_AI_Management_API_v4.0.0_swagger.json', '["id", "href", "description", "isBundle", "lastUpdate", "lifecycleStatus", "name", "version", "attachment", "constraint", "entitySpecRelationship", "relatedParty", "specCharacteristic", "targetEntitySchema", "validFor", "@baseType"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_contract_specification.created', 'v1', 'TMF915', 'aiContractSpecification', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_contract_specification.updated', 'v1', 'TMF915', 'aiContractSpecification', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_contract_specification.stateChanged', 'v1', 'TMF915', 'aiContractSpecification', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_contract_specification.deleted', 'v1', 'TMF915', 'aiContractSpecification', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF915', 'aiContractViolation', '/aiContractViolation', 'process_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF915_AIManagementSuite/TMF915_AI_Management_API_v4.0.0_swagger.json', '["id", "href", "actualValue", "comment", "consequence", "operator", "referenceValue", "tolerance", "unit", "violationAverage", "attachment", "rule", "@baseType", "@schemaLocation", "@type"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_contract_violation.created', 'v1', 'TMF915', 'aiContractViolation', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_contract_violation.updated', 'v1', 'TMF915', 'aiContractViolation', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_contract_violation.stateChanged', 'v1', 'TMF915', 'aiContractViolation', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_contract_violation.deleted', 'v1', 'TMF915', 'aiContractViolation', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF915', 'aiModel', '/aiModel', 'process_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF915_AIManagementSuite/TMF915_AI_Management_API_v4.0.0_swagger.json', '["id", "href", "category", "description", "endDate", "hasStarted", "isBundle", "isServiceEnabled", "isStateful", "name", "serviceDate", "serviceType", "startDate", "startMode", "aiModelSpecification", "feature"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_model.created', 'v1', 'TMF915', 'aiModel', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_model.updated', 'v1', 'TMF915', 'aiModel', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_model.stateChanged', 'v1', 'TMF915', 'aiModel', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_model.deleted', 'v1', 'TMF915', 'aiModel', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF915', 'aiModelSpecification', '/aiModelSpecification', 'process_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF915_AIManagementSuite/TMF915_AI_Management_API_v4.0.0_swagger.json', '["id", "href", "deploymentRecord", "description", "inheritedModel", "isBundle", "lastUpdate", "lifecycleStatus", "modelContractVersionHistory", "modelDataSheet", "modelEvaluationData", "modelSpecificationHistory", "modelTrainingData", "name", "version", "attachment"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_model_specification.created', 'v1', 'TMF915', 'aiModelSpecification', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_model_specification.updated', 'v1', 'TMF915', 'aiModelSpecification', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_model_specification.stateChanged', 'v1', 'TMF915', 'aiModelSpecification', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.ai_model_specification.deleted', 'v1', 'TMF915', 'aiModelSpecification', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF915', 'alarm', '/alarm', 'process_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF915_AIManagementSuite/TMF915_AI_Management_API_v4.0.0_swagger.json', '["id", "href", "ackState", "ackSystemId", "ackUserId", "alarmChangedTime", "alarmClearedTime", "alarmDetails", "alarmEscalation", "alarmRaisedTime", "alarmReportingTime", "alarmedObjectType", "clearSystemId", "clearUserId", "externalAlarmId", "isRootCause"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.alarm.created', 'v1', 'TMF915', 'alarm', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.alarm.updated', 'v1', 'TMF915', 'alarm', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.alarm.stateChanged', 'v1', 'TMF915', 'alarm', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.alarm.deleted', 'v1', 'TMF915', 'alarm', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF915', 'monitor', '/monitor', 'process_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF915_AIManagementSuite/TMF915_AI_Management_API_v4.0.0_swagger.json', '["id", "href", "sourceHref", "state", "request", "response", "@baseType", "@schemaLocation", "@type"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.monitor.created', 'v1', 'TMF915', 'monitor', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.monitor.updated', 'v1', 'TMF915', 'monitor', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.monitor.stateChanged', 'v1', 'TMF915', 'monitor', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.monitor.deleted', 'v1', 'TMF915', 'monitor', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF915', 'rule', '/rule', 'rule_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF915_AIManagementSuite/TMF915_AI_Management_API_v4.0.0_swagger.json', '["id", "href", "conformanceComparatorLower", "conformanceComparatorUpper", "conformanceTargetLower", "conformanceTargetUpper", "gracePeriods", "name", "perfAlarmSpecThresholdCrossingDescription", "thresholdRuleCondition", "thresholdRuleName", "thresholdRuleSeverity", "thresholdTarget", "conformancePeriod", "consequence", "measurement"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.rule.created', 'v1', 'TMF915', 'rule', 'workflow_automation.rule_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.rule.updated', 'v1', 'TMF915', 'rule', 'workflow_automation.rule_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.rule.stateChanged', 'v1', 'TMF915', 'rule', 'workflow_automation.rule_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.rule.deleted', 'v1', 'TMF915', 'rule', 'workflow_automation.rule_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF915', 'topic', '/topic', 'process_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF915_AIManagementSuite/TMF915_AI_Management_API_v4.0.0_swagger.json', '["id", "href", "contentQuery", "headerQuery", "name", "@baseType", "@schemaLocation", "@type"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.topic.created', 'v1', 'TMF915', 'topic', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.topic.updated', 'v1', 'TMF915', 'topic', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.topic.stateChanged', 'v1', 'TMF915', 'topic', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.topic.deleted', 'v1', 'TMF915', 'topic', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF672', 'checkPermission', '/checkPermission', 'process_definition', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF672_UserRolesPermissions/TMF672-User_Role_Permission_Management_API-v5.1.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.check_permission.created', 'v1', 'TMF672', 'checkPermission', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.check_permission.updated', 'v1', 'TMF672', 'checkPermission', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.check_permission.stateChanged', 'v1', 'TMF672', 'checkPermission', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.check_permission.deleted', 'v1', 'TMF672', 'checkPermission', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF672', 'permissionSet', '/permissionSet', 'process_definition', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF672_UserRolesPermissions/TMF672-User_Role_Permission_Management_API-v5.1.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.permission_set.created', 'v1', 'TMF672', 'permissionSet', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.permission_set.updated', 'v1', 'TMF672', 'permissionSet', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.permission_set.stateChanged', 'v1', 'TMF672', 'permissionSet', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.permission_set.deleted', 'v1', 'TMF672', 'permissionSet', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF672', 'permissionSpecification', '/permissionSpecification', 'process_definition', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF672_UserRolesPermissions/TMF672-User_Role_Permission_Management_API-v5.1.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.permission_specification.created', 'v1', 'TMF672', 'permissionSpecification', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.permission_specification.updated', 'v1', 'TMF672', 'permissionSpecification', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.permission_specification.stateChanged', 'v1', 'TMF672', 'permissionSpecification', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.permission_specification.deleted', 'v1', 'TMF672', 'permissionSpecification', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF672', 'permissionSpecificationSet', '/permissionSpecificationSet', 'process_definition', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF672_UserRolesPermissions/TMF672-User_Role_Permission_Management_API-v5.1.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.permission_specification_set.created', 'v1', 'TMF672', 'permissionSpecificationSet', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.permission_specification_set.updated', 'v1', 'TMF672', 'permissionSpecificationSet', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.permission_specification_set.stateChanged', 'v1', 'TMF672', 'permissionSpecificationSet', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.permission_specification_set.deleted', 'v1', 'TMF672', 'permissionSpecificationSet', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF710', 'generalTestArtifact', '/generalTestArtifact', 'process_definition', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF710_GeneralTestArtifact/TMF710_General_Test_Artifact_Management_API_v4.0.0_swagger.json', '["id", "href", "description", "version", "versionDescription", "agreement", "attribute", "generalArtifactDefinition", "relatedParty", "state", "@baseType", "@schemaLocation", "@type"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.general_test_artifact.created', 'v1', 'TMF710', 'generalTestArtifact', 'workflow_automation.process_definition', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.general_test_artifact.updated', 'v1', 'TMF710', 'generalTestArtifact', 'workflow_automation.process_definition', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.general_test_artifact.stateChanged', 'v1', 'TMF710', 'generalTestArtifact', 'workflow_automation.process_definition', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO workflow_automation.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('workflow_automation.general_test_artifact.deleted', 'v1', 'TMF710', 'generalTestArtifact', 'workflow_automation.process_definition', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();

INSERT INTO workflow_automation.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('workflow_automation.process_definition', 'workflow_automation', 'internal', 'domain_lifecycle', 'Suite data model and TMF API baseline review', 1095, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Apply tenant isolation and redact source identifiers in shared read models.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO workflow_automation.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('workflow_automation.process_version', 'workflow_automation', 'internal', 'domain_lifecycle', 'Suite data model and TMF API baseline review', 1095, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Apply tenant isolation and redact source identifiers in shared read models.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO workflow_automation.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('workflow_automation.rule_definition', 'workflow_automation', 'internal', 'domain_lifecycle', 'Suite data model and TMF API baseline review', 1095, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Apply tenant isolation and redact source identifiers in shared read models.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO workflow_automation.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('workflow_automation.decision_definition', 'workflow_automation', 'internal', 'domain_lifecycle', 'Suite data model and TMF API baseline review', 1095, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Apply tenant isolation and redact source identifiers in shared read models.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO workflow_automation.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('workflow_automation.work_queue', 'workflow_automation', 'internal', 'domain_lifecycle', 'Suite data model and TMF API baseline review', 1095, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Apply tenant isolation and redact source identifiers in shared read models.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO workflow_automation.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('workflow_automation.task', 'workflow_automation', 'internal', 'domain_lifecycle', 'Suite data model and TMF API baseline review', 1095, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Apply tenant isolation and redact source identifiers in shared read models.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO workflow_automation.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('workflow_automation.automation_playbook', 'workflow_automation', 'internal', 'domain_lifecycle', 'Suite data model and TMF API baseline review', 1095, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Apply tenant isolation and redact source identifiers in shared read models.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO workflow_automation.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('workflow_automation.intent_handling_metadata', 'workflow_automation', 'internal', 'domain_lifecycle', 'Suite data model and TMF API baseline review', 1095, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Apply tenant isolation and redact source identifiers in shared read models.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO workflow_automation.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('workflow_automation.configuration_package', 'workflow_automation', 'internal', 'domain_lifecycle', 'Suite data model and TMF API baseline review', 1095, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Apply tenant isolation and redact source identifiers in shared read models.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO workflow_automation.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('workflow_automation.extension_schema', 'workflow_automation', 'internal', 'domain_lifecycle', 'Suite data model and TMF API baseline review', 1095, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Apply tenant isolation and redact source identifiers in shared read models.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO workflow_automation.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('workflow_automation.event_outbox', 'workflow_automation', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();

COMMIT;
