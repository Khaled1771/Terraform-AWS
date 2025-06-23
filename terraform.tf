terraform {
  backend "s3" {
    bucket         = "terraform-state-lock01"
    key            = "terraform.tfstate"
    region         = "me-south-1"
    dynamodb_table = "terraform-locking"
  }
}
