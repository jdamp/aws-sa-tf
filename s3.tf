resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "jdamp-prod-tf-state-bucket"
}

resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}