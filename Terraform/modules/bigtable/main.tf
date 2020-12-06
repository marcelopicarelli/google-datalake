resource "google_bigtable_instance" "development-instance" {
  name          = var.name
  instance_type = var.instance_type

  cluster {
    cluster_id   = var.cluster_id
    zone         = var.zone
    storage_type = var.storage_type
  }

  labels = var.labels
}