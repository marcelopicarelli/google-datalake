resource "google_bigquery_dataset" "default" {
  dataset_id                  = var.dataset_id
  friendly_name               = var.friendly_name
  description                 = var.description
  location                    = var.location
  default_table_expiration_ms = var.default_table_expiration_ms

  labels = var.labels
}

resource "google_bigquery_table" "default" {
  dataset_id = google_bigquery_dataset.default.dataset_id
  table_id   = var.table_id

  time_partitioning {
    type = "DAY"
  }

  labels = var.labels

  schema = file("schema.json")
}
