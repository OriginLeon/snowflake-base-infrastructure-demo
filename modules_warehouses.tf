
module "demo_warehouse" {
  source                = "./warehouses"
  warehouse_config      = local.warehouses.DEMO_WAREHOUSE
  snowflake_credentials = local.snowflake_credentials
  other_privileges      = ["MONITOR"]
}


module "demo_warehouse_large" {
  source                = "./warehouses"
  warehouse_config      = local.warehouses.DEMO_WAREHOUSE_LARGE
  snowflake_credentials = local.snowflake_credentials
  other_privileges      = ["MONITOR"]
}

