//Service USER
resource "snowflake_user" "SNOWFLAKE_USER" {
  name         = var.user_name
  login_name   = var.user_name
  password     = var.user_password
  disabled     = false
  display_name = var.user_name

  default_warehouse    = var.user_default_warehouse
  default_role         = snowflake_role.SNOWFLAKE_USER_SERVICE_ROLE.name
  must_change_password = false
}

//Created SERVICE USER main ROLE
resource "snowflake_role" "SNOWFLAKE_USER_SERVICE_ROLE" {
  name    = "${var.user_name}_SERVICE_ROLE"
  comment = "${var.user_name} unique user Service Role"
}

//GRANT the above main ROLE to created SERVICE USER
resource "snowflake_role_grants" "SNOWFLAKE_USER_SERVICE_ROLE_GRANT" {
  role_name = snowflake_role.SNOWFLAKE_USER_SERVICE_ROLE.name
  users     = [snowflake_user.SNOWFLAKE_USER.name]
}
