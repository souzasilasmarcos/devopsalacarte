provider "aws" {
  region              = "us-east-1"
  allowed_account_ids = ["account-id"]  
  #
  default_tags {
    tags = {
      workload    = local.workload.workload      
      owner       = local.workload.owner
      iaac        = local.workload.iaac
    }
  }
}
