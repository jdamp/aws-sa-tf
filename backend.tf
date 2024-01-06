terraform {
  backend "s3" {
    bucket                  = "jdamp-prod-tf-state-bucket"
    key                     = "./terraform.tfstate"
    region                  = "us-east-1"
    encrypt                 = true
    shared_credentials_file = "$HOME/.aws/credentials"
    profile                 = "iamadmin-prod"
  }
}