
module "warehouse_role" {
  source                = "./warehouse_role"
  warehouse_name        = snowflake_warehouse.WAREHOUSE.name
  snowflake_credentials = var.snowflake_credentials
  other_privileges      = var.other_privileges
}
