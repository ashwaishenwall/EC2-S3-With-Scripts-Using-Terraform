############################################## Bucket details ###################################
resource "random_string" "bucket_name" {
  length           = 12
  special          = false
  upper            = false
  number           = false
  override_special = "_-"
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "my-tf-test-${random_string.bucket_name.result}"
  acl    = "private" # Set the ACL to private
  tags   = {
    Name = "MyTerraformBucket"
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.mybucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_accelerate_configuration" "accelerateconfig" {
  bucket = aws_s3_bucket.mybucket.id
  status = "Enabled"
}

resource "aws_s3_bucket_ownership_controls" "ownershipcontrol" {
  bucket = aws_s3_bucket.mybucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

