locals {
  warehouses = {
    DEMO_WAREHOUSE = {
      name              = "DEMO_WAREHOUSE"
      comment           = "Warehouse for TECH SESSION"
      warehouse_size    = "xsmall"
      auto_suspend      = 10
      min_cluster_count = 2
      max_cluster_count = 5
    },
    DEMO_WAREHOUSE_LARGE = {
      name              = "DEMO_WAREHOUSE_LARGE"
      comment           = "Large Warehouse for TECH SESSION"
      warehouse_size    = "large"
      auto_suspend      = 5
      min_cluster_count = 1
      max_cluster_count = 2
    }
  }

  //DEMO USER CONFIG
  DEMO_USER_CONFIG = {
    database_privileges = {
      //DEMO_DATABASE_OWNERSHIP = { DATABASE_NAME = module.raw_demo_database.db_name, PRIVILEGE = "OWNERSHIP" }
      //DEMO_DATABASE_CREATE_SCHEMA = { DATABASE_NAME = module.raw_demo_database.db_name, PRIVILEGE = "USAGE" },
      //DEMO_DATABASE_CREATE_SCHEMA = { DATABASE_NAME = module.raw_demo_database.db_name, PRIVILEGE = "CREATE SCHEMA" },
      //EXAMPLE_DATABASE_MONITOR       = { DATABASE_NAME = module.raw_demo_database.db_name, PRIVILEGE = "MONITOR" },
    }
    schema_privileges = {
      EXAMPLE_SCHEMA_USAGE = { DATABASE_NAME = module.raw_demo_database.db_name, SCHEMA_NAME = module.example_schema.schema_name, PRIVILEGE = "USAGE" }
      EXAMPLE_SCHEMA_CSTA  = { DATABASE_NAME = module.raw_demo_database.db_name, SCHEMA_NAME = module.example_schema.schema_name, PRIVILEGE = "CREATE STAGE" }
      EXAMPLE_SCHEMA_CTAB  = { DATABASE_NAME = module.raw_demo_database.db_name, SCHEMA_NAME = module.example_schema.schema_name, PRIVILEGE = "CREATE TABLE" }
      EXAMPLE_SCHEMA_CPIP  = { DATABASE_NAME = module.raw_demo_database.db_name, SCHEMA_NAME = module.example_schema.schema_name, PRIVILEGE = "CREATE PIPE" }
      EXAMPLE_SCHEMA_CTAS  = { DATABASE_NAME = module.raw_demo_database.db_name, SCHEMA_NAME = module.example_schema.schema_name, PRIVILEGE = "CREATE TASK" }
      EXAMPLE_SCHEMA_CPROC = { DATABASE_NAME = module.raw_demo_database.db_name, SCHEMA_NAME = module.example_schema.schema_name, PRIVILEGE = "CREATE PROCEDURE" }
      EXAMPLE_SCHEMA_CVIEW = { DATABASE_NAME = module.raw_demo_database.db_name, SCHEMA_NAME = module.example_schema.schema_name, PRIVILEGE = "CREATE VIEW" }
    }
    additional_user_roles = [
      //WAREHOUSE USAGE ROLES :
      module.demo_warehouse.wh_role_name,
      module.demo_warehouse_large.wh_role_name,
      //OTHER ROLES :
      module.raw_demo_future_do_all_role.role_name
    ]
  }

  /*
  // EXAMPLE USER CONFIG
  EXAMPLE_USER_CONFIG = {
    database_privileges = {
      //EXAMPLE_DATABASE_USAGE         = { DATABASE_NAME = module.example_database.db_name, PRIVILEGE = "USAGE" },
      EXAMPLE_DATABASE_CREATE_SCHEMA = { DATABASE_NAME = module.example_database.db_name, PRIVILEGE = "CREATE SCHEMA" },
      EXAMPLE_DATABASE_MONITOR       = { DATABASE_NAME = module.example_database.db_name, PRIVILEGE = "MONITOR" },
    }
    schema_privileges = {
      //EXAMPLE_DB_PUBLIC_OWNERSHIP = { DATABASE_NAME = module.example_database.db_name, SCHEMA_NAME = "PUBLIC", PRIVILEGE = "OWNERSHIP" },
    }
    additional_user_roles = [
      //WAREHOUSE USAGE ROLES :
      module.example_warehouse.wh_role_name,
      //OTHER ROLES :
      module.example_tables_views_future_do_all_role.role_name
    ]
  }

  // EXAMPLE READONLY USER CONFIG //NOT USED RIGHT NOW
  EXAMPLE_READONLY_USER_CONFIG = {
    additional_user_roles = [
      //WAREHOUSE USAGE ROLES :
      module.example_warehouse.wh_role_name,
      //OTHER ROLES :
      module.example_tables_views_future_readonly_role.role_name
    ]
  }

  // EXAMPLE USER CONFIG
  RAW_EXAMPLE_USER_CONFIG = {
    database_privileges = {
      EXAMPLE_DATABASE_CREATE_SCHEMA = { DATABASE_NAME = module.raw_example_database.db_name, PRIVILEGE = "CREATE SCHEMA" },
      EXAMPLE_DATABASE_MONITOR       = { DATABASE_NAME = module.raw_example_database.db_name, PRIVILEGE = "MONITOR" },
    }
    additional_user_roles = [
      //WAREHOUSE USAGE ROLES :
      module.raw_example_warehouse.wh_role_name,
      //OTHER ROLES :
      module.raw_example_tables_views_future_do_all_role.role_name
    ]
  }

  // EXAMPLE USER CONFIG
  PRD_SDI_INTERNAL_USER_CONFIG = {
    database_privileges = {
      PRD_SDI_INTERNAL_DATABASE_USAGE = { DATABASE_NAME = module.prd_sdi_internal_database.db_name, PRIVILEGE = "USAGE" },
    }
    schema_privileges = {
      SDI_INTERNAL_WAREHOUSE_SCHEMA_USAGE = { DATABASE_NAME = module.prd_sdi_internal_database.db_name, SCHEMA_NAME = module.sdi_internal_schema.schema_name, PRIVILEGE = "USAGE" },
    }
    additional_user_roles = [
      //WAREHOUSE USAGE ROLES :
      module.sdi_internal_warehouse.wh_role_name,
      //OTHER ROLES :
      module.sdi_internal_wh_schema_future_select_role.role_name
    ]
  }
*/
  DEFAULT_CONFIG = {
    default_assign_user_role_to = ["SYSADMIN"]
  }

  snowflake_credentials = {
    account  = var.snowflake_account
    password = var.snowflake_password
    region   = var.snowflake_region
    username = var.snowflake_username
  }

}
