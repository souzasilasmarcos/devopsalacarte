module "s3_api_upload" {
  source = "../../modules/terraform-aws-s3"

  environment = local.s3.s3_api_upload.environment
  bucket_name = local.s3.s3_api_upload.bucket_name
  workload    = local.s3.s3_api_upload.workload
  plataforma  = local.s3.s3_api_upload.plataforma
}