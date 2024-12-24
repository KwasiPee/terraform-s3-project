provider "aws" {
  region = "eu-central-1" # Update this to the Region closest to you
}

resource "aws_s3_bucket" "my_bucket" { 
  bucket = "my-custom-bucket-sarps-07" # Replace placeholders with your name and a random number

  tags = {
    Environment = "Create an S3 Bucket with Terraform"
  }
}

resource "aws_s3_bucket_public_access_block" "my_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.my_bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "image" {
  bucket = aws_s3_bucket.my_bucket.id  # Reference the bucket ID
  key    = "ccfraud.png"              # Path in the bucket
  source = "ccfraud.png"              # Local file path
}

