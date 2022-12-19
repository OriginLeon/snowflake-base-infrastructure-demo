
variable "warehouse_config" {
  type = object(
    {
      name              = string
      warehouse_size    = string
      auto_suspend      = number
      min_cluster_count = number
      max_cluster_count = number
    }
  )
}

variable "other_privileges" {
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
