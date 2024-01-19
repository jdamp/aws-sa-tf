resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "jdamp-prod-tf-state-bucket"
}

resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

/*
resource "aws_s3_bucket" "koalastuff" {
  bucket = "koalastuff-jdamp-prod" 
}

resource "aws_s3_bucket_public_access_block" "koalastuff" {
  bucket = aws_s3_bucket.koalastuff.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

locals {
  files = ["koalanom1.jpg", "koalanom2.jpg", "koalazzz.jpg"]
}

resource "aws_s3_object" "file_upload" {
  for_each = toset(local.files)
  bucket = aws_s3_bucket.koalastuff.bucket  
  key = each.value
  source = "../aws-sa-associate-saac03/0500-AWS_FUNDAMENTALS/02_my_first_s3_bucket/${each.value}"
  etag = filemd5("../aws-sa-associate-saac03/0500-AWS_FUNDAMENTALS/02_my_first_s3_bucket/${each.value}")
}
*/