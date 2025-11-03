 terraform {
  backend "s3" {
    bucket         = "03-11-2025-new-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "Akash" 
    encrypt        = true
  }
} 