
// Grant provided existing roles this user's default role
resource "snowflake_role_grants" "GRANT_EXISTING_ROLES_TO_USER_ROLE" {
  role_name = each.value
  roles     = [snowflake_role.SNOWFLAKE_USER_SERVICE_ROLE.name]

  for_each = toset(var.additional_user_roles)
}

// Do the opposite from above:
// Grant this user's default role to provided existing roles
resource "snowflake_role_grants" "GRANT_USERS_ROLE_TO_EXISTING_ROLES" {
  role_name = snowflake_role.SNOWFLAKE_USER_SERVICE_ROLE.name
  roles     = [each.value]

  for_each = toset(var.assign_user_role_to)
}
