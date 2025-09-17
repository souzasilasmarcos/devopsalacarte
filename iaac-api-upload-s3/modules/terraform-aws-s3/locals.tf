locals {
  bucket = {
    name = var.bucket_name
    acl  = "private"
  }

  log_bucket = {
    name          = "log-${var.bucket_name}"
    acl       = "log-delivery-write"
    target_prefix = "s3-${var.workload}-${var.environment}/"
  }

  tags = {
    ambiente    = var.environment
    plataforma  = var.plataforma
    funcao      = "s3"
    so          = "nao_aplica"
    last_backup = "nao_aplica"
    tipo_backup = var.environment
  }

  versioning_configuration_status = "Enabled"
}