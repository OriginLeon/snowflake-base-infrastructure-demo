
module "demo_user" {
  source        = "./users"
  user_name     = "DEMO_USER"
  user_password = "demoPass"

  user_default_warehouse   = module.demo_warehouse.wh_name
  user_database_privileges = local.DEMO_USER_CONFIG.database_privileges
  user_schema_privileges   = local.DEMO_USER_CONFIG.schema_privileges
  // Existing other roles that should be granted to this user's default role
  additional_user_roles = local.DEMO_USER_CONFIG.additional_user_roles
  // Existing other roles which this user's default role will be granted to
  assign_user_role_to = local.DEFAULT_CONFIG.default_assign_user_role_to

  snowflake_credentials = local.snowflake_credentials
}

/*
module "readonly_user" {
  source        = "./users"
  user_name     = "READONLY_USER"
  user_password = "Read0nlyP@ss"

  user_default_warehouse = module.example_warehouse.wh_name
  additional_user_roles  = local.EXAMPLE_READONLY_USER_CONFIG.additional_user_roles

  snowflake_credentials = local.snowflake_credentials
}

module "raw_example_user" {
  source        = "./users"
  user_name     = "RAW_EXAMPLE_USER"
  user_password = "myP@ass"

  user_default_warehouse   = module.raw_example_warehouse.wh_name
  user_database_privileges = local.RAW_EXAMPLE_USER_CONFIG.database_privileges
  // Existing other roles that should be granted to this user's default role
  additional_user_roles = local.RAW_EXAMPLE_USER_CONFIG.additional_user_roles
  // Existing other roles which this user's default role will be granted to
  assign_user_role_to = local.DEFAULT_CONFIG.default_assign_user_role_to

  snowflake_credentials = local.snowflake_credentials
}

// User that will only have read privileges on tables and views created on SDI_INTERNAL only schema
module "sdi_internal_readonly_user" {
  source        = "./users"
  user_name     = "SDI_INTERNAL_READONLY_USER"
  user_password = "FJ+Qr4d^mrba)1H^"

  user_default_warehouse   = module.sdi_internal_warehouse.wh_name
  user_database_privileges = local.PRD_SDI_INTERNAL_USER_CONFIG.database_privileges
  user_schema_privileges   = local.PRD_SDI_INTERNAL_USER_CONFIG.schema_privileges
  // Existing other roles that should be granted to this user's default role
  additional_user_roles = local.PRD_SDI_INTERNAL_USER_CONFIG.additional_user_roles
  // Existing other roles which this user's default role will be granted to
  assign_user_role_to = local.DEFAULT_CONFIG.default_assign_user_role_to

  snowflake_credentials = local.snowflake_credentials
}
*/
