variable "role_name" {
  type = string
}

variable "database_name" {
  type = string
}

variable "database_privileges" {
  type    = list(string)
  default = []
}

variable "schema_name" {
  type    = string
  default = null
}

variable "schema_privileges" {
  type    = list(string)
  default = []
}

variable "future_grants" {
  type    = bool
  default = false
}

variable "table_privileges" {
  type    = list(string)
  default = []
}

variable "stage_read_privilege" {
  type    = bool
  default = false
}

variable "stage_write_privilege" {
  type    = bool
  default = false
}

variable "stream_privileges" {
  type    = list(string)
  default = []
}

variable "view_privileges" {
  type    = list(string)
  default = []
}

variable "sequence_privileges" {
  type    = list(string)
  default = []
}

variable "function_privileges" {
  type    = list(string)
  default = []
}

variable "procedure_privileges" {
  type    = list(string)
  default = []
}

variable "tasks_privileges" {
  type    = list(string)
  default = []
}

variable "pipes_privileges" {
  type    = list(string)
  default = []
}

variable "integrations_usage" {
  type    = list(string)
  default = []
}

variable "additional_roles" {
  type    = list(string)
  default = []
}

variable "assign_this_role_to" {
  type    = list(string)
  default = []
}

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

