
module "raw_demo_database" {
  source                = "./databases"
  database_name         = "RAW_DEMO_DB"
  snowflake_credentials = local.snowflake_credentials
}

module "example_schema" {
  source                = "./schemas"
  database_name         = module.raw_demo_database.db_name
  schema_name           = "EXAMPLE_SCHEMA"
  snowflake_credentials = local.snowflake_credentials
}

module "demo_user_account_privileges" {
  source                = "./grants/account"
  role_name             = module.demo_user.user_role_name
  privileges            = ["EXECUTE TASK", "MONITOR USAGE", "MONITOR EXECUTION"]
  snowflake_credentials = local.snowflake_credentials
}

module "execute_task_on_account" {
  source                = "./grants/account"
  role_name             = module.demo_user.user_role_name
  privileges            = ["EXECUTE TASK"]
  snowflake_credentials = local.snowflake_credentials
}

/*
module "example_database" {
  source                = "./databases"
  database_name         = "EXAMPLE_DATABASE"
  snowflake_credentials = local.snowflake_credentials
}

module "raw_example_database" {
  source                = "./databases"
  database_name         = "RAW_EXAMPLE_DB"
  snowflake_credentials = local.snowflake_credentials
}

module "prd_sdi_internal_database" {
  source                = "./databases"
  database_name         = "PRD_SDI_INTERNAL_DB"
  snowflake_credentials = local.snowflake_credentials
}

module "sdi_internal_schema" {
  source                = "./schemas"
  database_name         = module.prd_sdi_internal_database.db_name
  schema_name           = "SDI_INTERNAL_WAREHOUSE"
  snowflake_credentials = local.snowflake_credentials
}
*/
