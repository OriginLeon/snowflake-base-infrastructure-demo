
//Database
resource "snowflake_database_grant" "grant" {
  database_name     = var.database_name
  privilege         = each.value
  roles             = [snowflake_role.new_snowflake_role.name]
  with_grant_option = false

  for_each = toset(var.database_privileges)
}

//Schema
resource "snowflake_schema_grant" "grant" {
  database_name     = var.database_name
  schema_name       = var.future_grants ? null : var.schema_name
  privilege         = each.value
  roles             = [snowflake_role.new_snowflake_role.name]
  on_future         = var.future_grants
  with_grant_option = false

  for_each = toset(var.schema_privileges)
}

//Table
resource "snowflake_table_grant" "table_grants_for_role" {
  database_name = var.database_name
  schema_name   = var.schema_name //On table case may be null when future is true applying to all future schemas
  privilege     = each.value
  roles         = [snowflake_role.new_snowflake_role.name]
  on_future     = var.future_grants

  for_each = toset(var.table_privileges)
}

//Views
resource "snowflake_view_grant" "view_grants_for_role" {
  database_name = var.database_name
  schema_name   = var.schema_name //On view case may be null when future is true applying to all future schemas
  privilege     = each.value
  roles         = [snowflake_role.new_snowflake_role.name]
  on_future     = var.future_grants

  for_each = toset(var.view_privileges)
}

//Sequences
resource "snowflake_sequence_grant" "sequence_grants_for_role" {
  database_name = var.database_name
  schema_name   = var.schema_name
  privilege     = each.value
  roles         = [snowflake_role.new_snowflake_role.name]
  on_future     = var.future_grants

  for_each = toset(var.sequence_privileges)
}

//Stages
resource "snowflake_stage_grant" "stage_read_grant_for_role" {
  database_name = var.database_name
  schema_name   = var.schema_name
  privilege     = each.value
  roles         = [snowflake_role.new_snowflake_role.name]
  on_future     = var.future_grants

  for_each = var.stage_read_privilege ? toset(["READ", "USAGE"]) : toset([])
}

resource "snowflake_stage_grant" "stage_write_grant_for_role" {
  depends_on = [snowflake_stage_grant.stage_read_grant_for_role]

  database_name = var.database_name
  schema_name   = var.schema_name
  privilege     = each.value
  roles         = [snowflake_role.new_snowflake_role.name]
  on_future     = var.future_grants

  for_each = var.stage_write_privilege ? toset(["WRITE"]) : toset([])
}

//Functions
resource "snowflake_function_grant" "function_grants_for_role" {
  database_name = var.database_name
  schema_name   = var.schema_name
  privilege     = each.value
  roles         = [snowflake_role.new_snowflake_role.name]
  on_future     = var.future_grants

  for_each = toset(var.function_privileges)
}

//Procedures
resource "snowflake_procedure_grant" "procedure_grants_for_role" {
  database_name = var.database_name
  schema_name   = var.schema_name
  privilege     = each.value
  roles         = [snowflake_role.new_snowflake_role.name]
  on_future     = var.future_grants

  for_each = toset(var.procedure_privileges)
}

//Task
resource "snowflake_task_grant" "task_grants_for_role" {
  database_name = var.database_name
  schema_name   = var.schema_name
  privilege     = each.value
  roles         = [snowflake_role.new_snowflake_role.name]
  on_future     = var.future_grants

  for_each = toset(var.tasks_privileges)
}

//Pipes
resource "snowflake_pipe_grant" "pipes_grants_for_role" {
  database_name = var.database_name
  schema_name   = var.schema_name
  privilege     = each.value
  roles         = [snowflake_role.new_snowflake_role.name]
  on_future     = var.future_grants

  for_each = toset(var.pipes_privileges)
}

//Integrations
resource "snowflake_integration_grant" "integration_grants_for_role" {
  integration_name = each.value
  privilege        = "USAGE"
  roles            = [snowflake_role.new_snowflake_role.name]
  for_each         = toset(var.integrations_usage)
}
