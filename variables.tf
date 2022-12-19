
variable "snowflake_username" {
  type        = string
  description = "Username for Snowflake authentication"
}

variable "snowflake_account" {
  type        = string
  description = "Account for Snowflake authentication"
}

variable "snowflake_region" {
  type        = string
  description = "Region for Snowflake authentication"
}

variable "snowflake_password" {
  type        = string
  description = "Password for Snowflake authentication"
}

variable "application_name" {
  type        = string
  description = "The name of the application, i.e. network-discovery, or console-app-web"
  default     = "snowflake-base-infrastructure-demo"
}

variable "environment" {
  type        = string
  description = "The name of the environment that is currently being deployed to, i.e. staging or production"
}
