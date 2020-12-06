resource "google_storage_bucket" "dataproc_bucket" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true  
}

resource "google_dataproc_cluster" "centauro" {
  provider = google-beta
  name     = var.cluster_name
  region   = var.region
  
  labels = {
    environment = "dev"
  } 

  cluster_config {
    staging_bucket = google_storage_bucket.dataproc_bucket.name   

    master_config {
      num_instances = var.master_num_instances
      machine_type  = var.master_machine_type
      disk_config {
        boot_disk_type    = "pd-standard"
        boot_disk_size_gb = 25
      }
    }

    worker_config {
      num_instances    = var.worker_num_instances
      machine_type     = var.worker_machine_type
      min_cpu_platform = "Intel Skylake"
      disk_config {
        boot_disk_size_gb = 25
        num_local_ssds    = 1
      }
    }
   
    endpoint_config {
      enable_http_port_access = "true"
    }

    software_config {
      image_version = "1.5.23-debian10"
      
      override_properties = {
        "dataproc:dataproc.allow.zero.workers" = "true"
      }
    }

    gce_cluster_config {
      tags = ["environment", "dev"]
      network = var.network_name
      zone = var.zone
      service_account_scopes = [
        "https://www.googleapis.com/auth/monitoring",
        "useraccounts-ro",
        "storage-rw",
        "logging-write",
      ]
    }

    autoscaling_config {
      policy_uri = google_dataproc_autoscaling_policy.policy.name
    }

    # You can define multiple initialization_action blocks
    initialization_action {
      script      = "gs://dataproc-initialization-actions/stackdriver/stackdriver.sh"
      timeout_sec = 500
    }
  }
  #depends_on = [module.network.google_compute_subnetwork]
}

resource "google_dataproc_autoscaling_policy" "policy" {
  policy_id = "dataproc-policy"
  location  = var.region

  worker_config {
    max_instances = 3
  }

  basic_algorithm {
    yarn_config {
      graceful_decommission_timeout = "30s"

      scale_up_factor   = 0.5
      scale_down_factor = 0.5
    }
  }
}