resource "google_storage_bucket" "transient" {
  name          = "transient"
  location      = var.location
  force_destroy = true  
}
resource "google_storage_bucket" "raw" {
  name          = "raw"
  location      = var.location
  force_destroy = true  
}
resource "google_storage_bucket" "trusted" {
  name          = "trusted"
  location      = var.location
  force_destroy = true  
}
resource "google_storage_bucket" "refined" {
  name          = "refined"
  location      = var.location
  force_destroy = true  
}