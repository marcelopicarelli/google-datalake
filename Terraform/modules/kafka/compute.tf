provider "google" {
  credentials = file("/mnt/c/Users/marce/Downloads/CENTAURO/key/lab-picarelli-893146022a2c.json")
  project = "lab-picarelli"
  #region  = "us-central1"  
}

resource "google_compute_instance" "rest" {
  name         = "kafka-rest"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  

  boot_disk {
    initialize_params {
      image = "rhel-7-v20201112"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP      
    }
  }
  tags = ["http-server"] 

  metadata = {
    ssh-keys = "mpicarelli:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDf7tLb//wKDr9QG3j7yv1ci6pBKhiEarHBSXYDK0/Ibb/ZDLH8ZWbeB0L4m+I4aPSwzhBl47CexOC/jGb8MtdmLm/S6wKqyVhll0OG4PUBlRkDsqAnq3h/1rmxLdw0Uc6tzYcv0Nzvmingj65gvkU7JrR2QshZqQysrbsl7bnrRoERL/l6ybuSY5COAgCdMWx5JniHknQvWVsoPuBM6EKbnHSbusMsrQaIgdKyhH9V3VCE3VRo9WZx7dZF4/K29tp+WG3zyGK89Bisvk/YU6xfggrMXzCFGXP7ePGfrLOhyjSUhRziDfwXnUKLuXaBgSpjyPXiU5XlxvnIh5TI6BeB"
  }  
}

resource "google_compute_instance" "connect" {
  name         = "kafka-connect"
  machine_type = "e2-medium"
  zone         = "us-west4-a"

  

  boot_disk {
    initialize_params {
      image = "rhel-7-v20201112"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  } 
  tags = ["http-server"]
  metadata = {
    ssh-keys = "mpicarelli:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDf7tLb//wKDr9QG3j7yv1ci6pBKhiEarHBSXYDK0/Ibb/ZDLH8ZWbeB0L4m+I4aPSwzhBl47CexOC/jGb8MtdmLm/S6wKqyVhll0OG4PUBlRkDsqAnq3h/1rmxLdw0Uc6tzYcv0Nzvmingj65gvkU7JrR2QshZqQysrbsl7bnrRoERL/l6ybuSY5COAgCdMWx5JniHknQvWVsoPuBM6EKbnHSbusMsrQaIgdKyhH9V3VCE3VRo9WZx7dZF4/K29tp+WG3zyGK89Bisvk/YU6xfggrMXzCFGXP7ePGfrLOhyjSUhRziDfwXnUKLuXaBgSpjyPXiU5XlxvnIh5TI6BeB"
  }
}

resource "google_compute_instance" "ksql" {
  name         = "kafka-ksql"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  

  boot_disk {
    initialize_params {
      image = "rhel-7-v20201112"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  } 
  tags = ["http-server"]
  metadata = {
    ssh-keys = "mpicarelli:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDf7tLb//wKDr9QG3j7yv1ci6pBKhiEarHBSXYDK0/Ibb/ZDLH8ZWbeB0L4m+I4aPSwzhBl47CexOC/jGb8MtdmLm/S6wKqyVhll0OG4PUBlRkDsqAnq3h/1rmxLdw0Uc6tzYcv0Nzvmingj65gvkU7JrR2QshZqQysrbsl7bnrRoERL/l6ybuSY5COAgCdMWx5JniHknQvWVsoPuBM6EKbnHSbusMsrQaIgdKyhH9V3VCE3VRo9WZx7dZF4/K29tp+WG3zyGK89Bisvk/YU6xfggrMXzCFGXP7ePGfrLOhyjSUhRziDfwXnUKLuXaBgSpjyPXiU5XlxvnIh5TI6BeB"
  }
}

resource "google_compute_instance" "control_center" {
  name         = "kafka-control-center"
  machine_type = "e2-medium"
  zone         = "us-west4-a"

  

  boot_disk {
    initialize_params {
      image = "rhel-7-v20201112"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  } 
  tags = ["http-server"]
  metadata = {
    ssh-keys = "mpicarelli:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDf7tLb//wKDr9QG3j7yv1ci6pBKhiEarHBSXYDK0/Ibb/ZDLH8ZWbeB0L4m+I4aPSwzhBl47CexOC/jGb8MtdmLm/S6wKqyVhll0OG4PUBlRkDsqAnq3h/1rmxLdw0Uc6tzYcv0Nzvmingj65gvkU7JrR2QshZqQysrbsl7bnrRoERL/l6ybuSY5COAgCdMWx5JniHknQvWVsoPuBM6EKbnHSbusMsrQaIgdKyhH9V3VCE3VRo9WZx7dZF4/K29tp+WG3zyGK89Bisvk/YU6xfggrMXzCFGXP7ePGfrLOhyjSUhRziDfwXnUKLuXaBgSpjyPXiU5XlxvnIh5TI6BeB"
  }
}

resource "google_compute_instance" "schema" {
  name         = "kafka-schema-registry"
  machine_type = "e2-medium"
  zone         = "us-east1-d"

  

  boot_disk {
    initialize_params {
      image = "rhel-7-v20201112"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  } 
  tags = ["http-server"]
  metadata = {
    ssh-keys = "mpicarelli:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDf7tLb//wKDr9QG3j7yv1ci6pBKhiEarHBSXYDK0/Ibb/ZDLH8ZWbeB0L4m+I4aPSwzhBl47CexOC/jGb8MtdmLm/S6wKqyVhll0OG4PUBlRkDsqAnq3h/1rmxLdw0Uc6tzYcv0Nzvmingj65gvkU7JrR2QshZqQysrbsl7bnrRoERL/l6ybuSY5COAgCdMWx5JniHknQvWVsoPuBM6EKbnHSbusMsrQaIgdKyhH9V3VCE3VRo9WZx7dZF4/K29tp+WG3zyGK89Bisvk/YU6xfggrMXzCFGXP7ePGfrLOhyjSUhRziDfwXnUKLuXaBgSpjyPXiU5XlxvnIh5TI6BeB"
  }
}

resource "google_compute_instance" "broker" {
  name         = "kafka-broker"
  machine_type = "e2-medium"
  zone         = "us-east1-d"

  

  boot_disk {
    initialize_params {
      image = "rhel-7-v20201112"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  } 
  tags = ["http-server"]
  metadata = {
    ssh-keys = "mpicarelli:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDf7tLb//wKDr9QG3j7yv1ci6pBKhiEarHBSXYDK0/Ibb/ZDLH8ZWbeB0L4m+I4aPSwzhBl47CexOC/jGb8MtdmLm/S6wKqyVhll0OG4PUBlRkDsqAnq3h/1rmxLdw0Uc6tzYcv0Nzvmingj65gvkU7JrR2QshZqQysrbsl7bnrRoERL/l6ybuSY5COAgCdMWx5JniHknQvWVsoPuBM6EKbnHSbusMsrQaIgdKyhH9V3VCE3VRo9WZx7dZF4/K29tp+WG3zyGK89Bisvk/YU6xfggrMXzCFGXP7ePGfrLOhyjSUhRziDfwXnUKLuXaBgSpjyPXiU5XlxvnIh5TI6BeB"
  }
}

resource "google_compute_instance" "zookeeper" {
  name         = "kafka-zookeeper"
  machine_type = "e2-medium"
  zone         = "us-east1-d"

  

  boot_disk {
    initialize_params {
      image = "rhel-7-v20201112"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  } 
  tags = ["http-server"]
  metadata = {
    ssh-keys = "mpicarelli:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDf7tLb//wKDr9QG3j7yv1ci6pBKhiEarHBSXYDK0/Ibb/ZDLH8ZWbeB0L4m+I4aPSwzhBl47CexOC/jGb8MtdmLm/S6wKqyVhll0OG4PUBlRkDsqAnq3h/1rmxLdw0Uc6tzYcv0Nzvmingj65gvkU7JrR2QshZqQysrbsl7bnrRoERL/l6ybuSY5COAgCdMWx5JniHknQvWVsoPuBM6EKbnHSbusMsrQaIgdKyhH9V3VCE3VRo9WZx7dZF4/K29tp+WG3zyGK89Bisvk/YU6xfggrMXzCFGXP7ePGfrLOhyjSUhRziDfwXnUKLuXaBgSpjyPXiU5XlxvnIh5TI6BeB"
  }
}

resource "google_compute_instance" "zookeeper2" {
  name         = "kafka-zookeeper-2"
  machine_type = "e2-medium"
  zone         = "us-west2-a"

  

  boot_disk {
    initialize_params {
      image = "rhel-7-v20201112"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  } 
  tags = ["http-server"]
  metadata = {
    ssh-keys = "mpicarelli:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDf7tLb//wKDr9QG3j7yv1ci6pBKhiEarHBSXYDK0/Ibb/ZDLH8ZWbeB0L4m+I4aPSwzhBl47CexOC/jGb8MtdmLm/S6wKqyVhll0OG4PUBlRkDsqAnq3h/1rmxLdw0Uc6tzYcv0Nzvmingj65gvkU7JrR2QshZqQysrbsl7bnrRoERL/l6ybuSY5COAgCdMWx5JniHknQvWVsoPuBM6EKbnHSbusMsrQaIgdKyhH9V3VCE3VRo9WZx7dZF4/K29tp+WG3zyGK89Bisvk/YU6xfggrMXzCFGXP7ePGfrLOhyjSUhRziDfwXnUKLuXaBgSpjyPXiU5XlxvnIh5TI6BeB"
  }
}

resource "google_compute_instance" "zookeeper3" {
  name         = "kafka-zookeeper-3"
  machine_type = "e2-medium"
  zone         = "us-west2-a"

  

  boot_disk {
    initialize_params {
      image = "rhel-7-v20201112"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  } 
  tags = ["http-server"]
  metadata = {
    ssh-keys = "mpicarelli:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDf7tLb//wKDr9QG3j7yv1ci6pBKhiEarHBSXYDK0/Ibb/ZDLH8ZWbeB0L4m+I4aPSwzhBl47CexOC/jGb8MtdmLm/S6wKqyVhll0OG4PUBlRkDsqAnq3h/1rmxLdw0Uc6tzYcv0Nzvmingj65gvkU7JrR2QshZqQysrbsl7bnrRoERL/l6ybuSY5COAgCdMWx5JniHknQvWVsoPuBM6EKbnHSbusMsrQaIgdKyhH9V3VCE3VRo9WZx7dZF4/K29tp+WG3zyGK89Bisvk/YU6xfggrMXzCFGXP7ePGfrLOhyjSUhRziDfwXnUKLuXaBgSpjyPXiU5XlxvnIh5TI6BeB"
  }
}