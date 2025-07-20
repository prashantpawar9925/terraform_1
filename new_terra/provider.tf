provider "aws" {
  region     = "ap-southeast-1"
  access_key = ""
  secret_key = ""
}


terraform {

backend "s3" {

  bucket = "remote-backend-bkt"
  key = "terraform.tfstate"
  region = "ap-southeast-1"
  dynamodb_table = "remote-dynamodb-table"
}

}