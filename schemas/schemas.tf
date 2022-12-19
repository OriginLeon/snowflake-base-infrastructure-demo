
resource "snowflake_schema" "schema" {
  database = var.database_name
  name     = var.schema_name
}
