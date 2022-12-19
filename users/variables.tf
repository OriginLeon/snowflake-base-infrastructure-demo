variable "snowflake_credentials" {
  type = object(
    {
      account  = string
      password = string
      region   = string
      username = string
    }
  )
}

variable "user_name" {
  type        = string
  description = "Username"
}

variable "user_password" {
  type        = string
  description = "User password"
}

variable "user_default_warehouse" {
  type        = string
  description = "User default warehouse"
}

variable "user_database_privileges" {
  type = map(object(
    {
      DATABASE_NAME = string
      PRIVILEGE     = string
  }))
  default = {}
}

variable "user_schema_privileges" {
  type = map(object(
    {
      DATABASE_NAME = string
      SCHEMA_NAME   = string
      PRIVILEGE     = string
  }))
  default = {}
}

variable "additional_user_roles" {
  type    = list(string)
  default = []
}

variable "assign_user_role_to" {
  type    = list(string)
  default = []
}
