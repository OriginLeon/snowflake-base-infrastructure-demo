
// Grant provided existing roles to this new role
resource "snowflake_role_grants" "GRANT_EXISTING_ROLES_TO_THIS_ROLE" {
  role_name = each.value
  roles     = [snowflake_role.new_snowflake_role.name]

  for_each = toset(var.additional_roles)
}

// Do the opposite from above:
// Grant this new role to provided existing roles
resource "snowflake_role_grants" "GRANT_THIS_ROLE_TO_EXISTING_ROLES" {
  role_name = snowflake_role.new_snowflake_role.name
  roles     = [each.value]

  for_each = toset(var.assign_this_role_to)
}
