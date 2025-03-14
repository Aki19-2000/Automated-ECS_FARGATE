terraform {
  backend "s3" {
    bucket         = "aki1920"
    key            = "env:/dev/uc3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
