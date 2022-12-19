resource "snowflake_warehouse" "WAREHOUSE" {
  name                = var.warehouse_config.name
  warehouse_size      = var.warehouse_config.warehouse_size
  auto_suspend        = var.warehouse_config.auto_suspend
  min_cluster_count   = var.warehouse_config.min_cluster_count
  max_cluster_count   = var.warehouse_config.max_cluster_count
  initially_suspended = true
}

