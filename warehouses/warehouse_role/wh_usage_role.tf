
resource "snowflake_role" "WAREHOUSE_USAGE_ROLE" {
  name    = "${var.warehouse_name}_USAGE_ROLE"
  comment = "${var.warehouse_name} USAGE ROLE"
}

resource "snowflake_warehouse_grant" "WAREHOUSES_USAGE_GRANTS" {
  warehouse_name    = var.warehouse_name
  privilege         = "USAGE"
  roles             = [snowflake_role.WAREHOUSE_USAGE_ROLE.name]
  with_grant_option = false
}

resource "snowflake_warehouse_grant" "WAREHOUSES_OTHER_GRANTS" {
  warehouse_name    = var.warehouse_name
  privilege         = each.value
  roles             = [snowflake_role.WAREHOUSE_USAGE_ROLE.name]
  with_grant_option = false

  for_each = toset(var.other_privileges)
}
