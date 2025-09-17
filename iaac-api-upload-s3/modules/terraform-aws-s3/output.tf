
output "aws_s3_bucket" {
  value = aws_s3_bucket.this.bucket_regional_domain_name
}

output "aws_s3_bucket_arn" {
  value = aws_s3_bucket.this.arn
}

output "aws_s3_bucket_id" {
  value = aws_s3_bucket.this.id
}
