
// Granting provided Databases privileges to created user
resource "snowflake_database_grant" "DATABASE_TO_USER_SERVICE_ROLE_GRANT" {
  database_name     = each.value.DATABASE_NAME
  privilege         = each.value.PRIVILEGE
  roles             = [snowflake_role.SNOWFLAKE_USER_SERVICE_ROLE.name]
  with_grant_option = false

  for_each = var.user_database_privileges
}

