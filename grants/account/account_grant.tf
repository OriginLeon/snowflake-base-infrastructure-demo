resource "snowflake_account_grant" "grant" {
  privilege         = each.value
  roles             = [var.role_name, "SYSADMIN"]
  with_grant_option = false

  for_each = toset(var.privileges)
}
