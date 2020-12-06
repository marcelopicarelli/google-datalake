# commom variables
variable "region" {
  default = "us-east1"
}
variable "zone" {
  default = "us-east1-d"
}
variable "project_id" {
default = "centauro-297317"
}
# network variables
variable "network_name" {
  default = "default-network-centauro-dev"
}
variable "subnet_cidr" {
  default = "10.10.0.0/24"
}

# dataproc variables
variable "cluster_name" {
  default = "centauro-dataproc"
}
variable "bucket_name" {
  default = "teste-dataproc-cluster"
}
variable "master_num_instances" {
  default = 1
}
variable "master_machine_type" {
  default = "n1-standard-1"
}
variable "worker_num_instances" {
  default = 2
}
variable "worker_machine_type" {
  default = "n1-standard-1"
}
# dataflow variables
variable "dataflow_name" {
    default = "dataflow-centauro"
}
variable "dataflow_force_destroy" {
    default = "false"
}
variable "dataflow_on_delete" {
    default = "cancel"
}
variable "dataflow_max_workers" {
    default = "3"
}
variable "dataflow_template_gcs_path" {
    default = "gs://dataflow-templates/latest/Word_Count"
}
variable "dataflow_temp_gcs_location" {
    default = "gs://centauro-prova01/"
}
variable "dataflow_parameters" {
    type = map(string)
    default = {
        inputFile = "gs://dataflow-samples/shakespeare/kinglear.txt"
        output    = "gs://centauro-prova01/latest/wordcount"
    }
}
variable "dataflow_service_account_email" {
    default = ""
}
variable "dataflow_network_self_link" {
    default = ""
}
variable "dataflow_subnetwork_self_link" {
    default = ""
}
variable "dataflow_machine_type" {
    default = "n1-standard-1"
}
variable "dataflow_ip_configuration" {
    default = ""
}
# ai plataform variables
variable "name" {
  default = "ai-notebook"
}

variable "machine_type" {
    default = "e2-medium"
}
variable "instance_owners" {
    default = "marcelo.picarelli83@gmail.com"
}
variable "service_account" {
    default = "picarelli@centauro-297317.iam.gserviceaccount.com"
}
variable "install_gpu_driver" {
    default = true
}
variable "boot_disk_size_gb" {
    default = 110
}
variable "no_public_ip" {
    default = false
}
variable "no_proxy_access" {
    default = true
}
variable "network" {
    default = "projects/centauro-297317/global/networks/default"
}
variable "subnet" {
    default = "projects/centauro-297317/regions/us-east1/subnetworks/default"
}
# Big Table variables
variable "bigtable_name" {
  default = "centauro-realtime"
}
variable "bigtable_instance_type" {
  default = "DEVELOPMENT"
}
variable "bigtable_cluster_id" {
  default = "centauro-realtime-cluster"
}
variable "bigtable_zone" {
  default = "us-east1-d"
}
variable "bigtable_storage_type" {
  default = "HDD"
}
variable "bigtable_labels" {
  type = map(string)
  default = {
    projeto = "centauro"
    environment = "dev"
  }
}
# bigquery variables
variable "dataset_id" {
  default = "dataset_id15135"
}
variable "friendly_name" {
  default = "centauro-bq"
}
variable "description" {
  default = "This is a description"
}
variable "location" {
  default = ""
}
variable "default_table_expiration_ms" {
  default = 3600000
}
variable "big_labels" {
  type = map(string)
  default = {
    projeto = "centauro"
    environment = "dev"
  }
}
variable "table_id" {
  default = "centauro"
}
