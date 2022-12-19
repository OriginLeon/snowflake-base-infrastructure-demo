
variable "warehouse_name" {
  type = string
}

variable "other_privileges" {
  type = list(string)
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
