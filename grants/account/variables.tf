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

variable "role_name" {
  type = string
}

variable "privileges" {
  type = list(string)
}
