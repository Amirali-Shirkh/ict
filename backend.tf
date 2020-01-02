// terraform block can contain a number of settings related  to Terraform's behavior. 
terraform{
  backend "gcs" {
    bucket  = "backend-store-bucket"
  }
}