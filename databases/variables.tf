variable "database_name" {
  type = string
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
