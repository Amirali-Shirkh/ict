provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}

// setting up a gcs storage for backend
# module "backend-storage" {
#   source = "./gcs-backend"
# }

resource "google_compute_disk" "disk" {
  name  = "my-disk"
  type  = "pd-ssd"
  zone  = "us-central1-a"
  image = "centos-7-v20191014"
  labels = {
    environment = "dev"
  }
  physical_block_size_bytes = 4096

  size = 40
}


// setting up google instance
resource "google_compute_instance" "mongoo" {
  name         = "mongo-vm-test"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  hostname = "mongo.vm.test"

  boot_disk {
    initialize_params {
      image = "centos-7-v20191014"
    }
  }

  metadata = {
   ssh-keys = "amirali:${file("~/.ssh/id_rsa.pub")}"
 }

  
  attached_disk{
    source = google_compute_disk.disk.self_link
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = "echo hi > /test.txt"

}