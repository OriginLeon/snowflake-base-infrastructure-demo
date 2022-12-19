
module "raw_demo_future_do_all_role" {
  source                = "./roles"
  role_name             = "RAW_DEMO_FUTURE_DO_ALL_ROLE"
  database_name         = module.raw_demo_database.db_name
  database_privileges   = ["USAGE"]
  schema_name           = module.example_schema.schema_name
  schema_privileges     = ["USAGE"]
  future_grants         = true
  stage_read_privilege  = true
  stage_write_privilege = true
  stream_privileges     = ["SELECT", "USAGE"]
  procedure_privileges  = ["USAGE"]
  tasks_privileges      = ["OPERATE", "MONITOR"]
  pipes_privileges      = ["OPERATE", "MONITOR"]
  integrations_usage    = ["SNOWFLAKE_STAGING_RAW_INTEGRATION"]
  sequence_privileges   = ["USAGE"]
  table_privileges      = ["SELECT", "INSERT", "UPDATE", "DELETE", "TRUNCATE"]
  view_privileges       = ["SELECT"]
  snowflake_credentials = local.snowflake_credentials
}


/*
// Role that will grant SELECT on TABLES and VIEWS for all future schemas on EXAMPLE db
module "example_tables_views_future_readonly_role" {
  source                = "./roles"
  role_name             = "EXAMPLE_TABLES_VIEWS_FUTURE_READONLY_ROLE"
  future_grants         = true
  database_name         = module.example_database.db_name
  database_privileges   = ["USAGE"] // It creates basic USAGE for the main DATABASE
  schema_name           = null      //So it's for the whole database
  schema_privileges     = ["USAGE"]
  table_privileges      = ["SELECT"]
  view_privileges       = ["SELECT"]
  assign_this_role_to   = [] // Existing other roles which this new role will be granted to
  snowflake_credentials = local.snowflake_credentials
}

// Role that will grant ALL PRIVILEGES on TABLES and VIEWS for all future schemas on EXAMPLE db
module "example_tables_views_future_do_all_role" {
  source                = "./roles"
  role_name             = "EXAMPLE_TABLES_VIEWS_FUTURE_DO_ALL_ROLE"
  database_name         = module.example_database.db_name
  database_privileges   = []   // It won't create DB privileges on this role, but for stuff within
  schema_name           = null // So it's for the whole database
  future_grants         = true
  table_privileges      = ["INSERT", "UPDATE", "DELETE", "TRUNCATE"]
  additional_roles      = [module.example_tables_views_future_readonly_role.role_name] // Adding to this one the READONLY role as well
  snowflake_credentials = local.snowflake_credentials
}

module "raw_example_tables_views_future_readonly_role" {
  source                = "./roles"
  role_name             = "RAW_EXAMPLE_TABLES_VIEWS_FUTURE_READONLY_ROLE"
  future_grants         = true
  database_name         = module.raw_example_database.db_name
  database_privileges   = ["USAGE"] // It creates basic USAGE for the main DATABASE
  schema_privileges     = ["USAGE"]
  table_privileges      = ["SELECT"]
  view_privileges       = ["SELECT"]
  snowflake_credentials = local.snowflake_credentials
}

module "raw_example_tables_views_future_do_all_role" {
  source                = "./roles"
  role_name             = "RAW_EXAMPLE_TABLES_VIEWS_FUTURE_DO_ALL_ROLE"
  database_name         = module.raw_example_database.db_name
  future_grants         = true
  table_privileges      = ["INSERT", "UPDATE", "DELETE", "TRUNCATE"]
  additional_roles      = [module.raw_example_tables_views_future_readonly_role.role_name] // Adding to this one the READONLY role as well
  snowflake_credentials = local.snowflake_credentials
}

// Role that will have SELECT privileges on all future tools for the SDI_INTERNAL_WAREHOUSE schema of PRD_SDI_INTERNAL_DB
module "sdi_internal_wh_schema_future_select_role" {
  source                = "./roles"
  role_name             = "SDI_INTERNAL_WH_SCHEMA_FUTURE_SELECT_ROLE"
  database_name         = module.prd_sdi_internal_database.db_name
  schema_name           = module.sdi_internal_schema.schema_name
  future_grants         = true
  table_privileges      = ["SELECT"]
  view_privileges       = ["SELECT"]
  snowflake_credentials = local.snowflake_credentials
}
*/
