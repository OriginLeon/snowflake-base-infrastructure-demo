
output "wh_name" {
  value = snowflake_warehouse.WAREHOUSE.name
}

output "wh_role_name" {
  value = module.warehouse_role.wh_role_name
}
