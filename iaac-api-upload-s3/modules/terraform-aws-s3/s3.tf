resource "aws_s3_bucket" "this" {
  bucket = local.bucket.name
  tags   = local.tags
}

#resource "aws_s3_bucket_acl" "this" {
#  bucket = aws_s3_bucket.this.id
#  acl    = local.bucket.acl
#}

resource "aws_s3_bucket" "log" {
  bucket = local.log_bucket.name
  tags   = local.tags
}

#resource "aws_s3_bucket_acl" "log_acl" {
#  bucket = aws_s3_bucket.log.id
#  acl    = local.log_bucket.acl
#}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = local.versioning_configuration_status
  }
}

resource "aws_s3_bucket_logging" "this" {
  bucket = aws_s3_bucket.this.id

  target_bucket = aws_s3_bucket.log.id
  target_prefix = local.log_bucket.target_prefix
}

