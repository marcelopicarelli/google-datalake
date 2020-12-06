provider "google-beta" {
  credentials = file("/mnt/c/Users/marce/Downloads/CENTAURO/key/centauro-297317-787ad0bfeeb9.json")  
}
module "network" {
  source = "./modules/network"
  project_id = var.project_id
  region = var.region
  network_name = var.network_name
  subnet_cidr = var.subnet_cidr  
}
module "dataproc" {  
  source = "./modules/dataproc"
  project_id = var.project_id
  region = var.region
  zone = var.zone
  cluster_name = var.cluster_name
  network_name = "${var.network_name}-vpc"   
  bucket_name = var.bucket_name
  master_num_instances = var.master_num_instances
  master_machine_type = var.master_machine_type
  worker_num_instances = var.worker_num_instances
  worker_machine_type = var.worker_machine_type  
}
module "dataflow-job" {
  source                = "./modules/dataflow"
  project_id            = var.project_id
  name                  = var.dataflow_name
  on_delete             = var.dataflow_on_delete
  region                = var.region
  zone                  = var.zone
  max_workers           = var.dataflow_max_workers
  template_gcs_path     = var.dataflow_template_gcs_path
  temp_gcs_location     = var.dataflow_temp_gcs_location
  service_account_email = var.dataflow_service_account_email
  network_self_link     = "${var.network_name}-vpc"
  subnetwork_self_link  = var.dataflow_subnetwork_self_link
  machine_type          = var.dataflow_machine_type
  ip_configuration      = var.dataflow_ip_configuration
  force_destroy         = "false"
  parameters            = var.dataflow_parameters  
}
module "ai_platform_notebook" {
  source       = "./modules/aiplataform"
  zone     = var.zone
  project = var.project_id
  name         = var.name
  machine_type = var.machine_type
  instance_owners = var.instance_owners
  service_account = var.service_account
  install_gpu_driver = var.install_gpu_driver
  boot_disk_size_gb = var.boot_disk_size_gb
  no_public_ip = var.no_public_ip
  no_proxy_access = var.no_proxy_access
  network = var.network
  subnet = var.subnet
} 
module "bigtable_instance" {
  source          = "./modules/bigtable"
  name            = var.bigtable_name
  instance_type   = var.bigtable_instance_type
  cluster_id      = var.bigtable_cluster_id
  zone            = var.bigtable_zone
  storage_type    = var.bigtable_storage_type
  labels          = var.bigtable_labels
}
module "bigquery" {
  source                      = "./modules/bigquery"
  dataset_id                  = var.dataset_id      
  friendly_name               = var.friendly_name
  description                 = var.description
  location                    = var.zone
  default_table_expiration_ms = var.default_table_expiration_ms
  labels                      = var.big_labels
  table_id                    = var.table_id
}
module "datalake" {
  source        = "./modules/datalake"
  location      = var.region  
}