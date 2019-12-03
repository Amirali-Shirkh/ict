provider "google" {
  credentials = file("My First Project-e860ed33cc5e.json")

  project = "useful-builder-260719"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}