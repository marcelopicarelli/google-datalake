resource "google_notebooks_instance" "instance" {
  provider = google-beta
  name = var.name
  location = var.zone
  machine_type = var.machine_type

  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-latest-cpu"
  }

  instance_owners = [var.instance_owners]
  service_account = var.service_account

  install_gpu_driver = var.install_gpu_driver
  boot_disk_type = "PD_SSD"
  boot_disk_size_gb = var.boot_disk_size_gb

  no_public_ip = var.no_public_ip
  no_proxy_access = var.no_proxy_access

  network = var.network
  subnet = var.subnet

  labels = {
    k = "val"
  }

  metadata = {
    terraform = "true"
  }
}