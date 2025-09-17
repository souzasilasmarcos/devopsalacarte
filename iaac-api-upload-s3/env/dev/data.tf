# VPC
data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [local.vpc_name]
  }
}

# Subnets Privatedatabase (prd_private_bd_east1_*, UAT_Subnet_Private_Database_1*, dev_private_database_east_1*)
data "aws_subnets" "private_database" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  filter {
    name   = "tag:Name"
    values = ["dev_private_database_east_1a", "dev_private_database_east_1c"]
  }
}

data "aws_subnet" "private_database" {
  for_each = toset(data.aws_subnets.private_database.ids)
  id       = each.value
}

# Subnets PrivateAPP (prd_priv_app_east1*, UAT_Subnet_Private_App_1*, dev_private_app_east_1*)
data "aws_subnets" "private_app" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  filter {
    name   = "tag:Name"
    values = ["dev_private_database_east_1a", "dev_private_database_east_1c"]
  }
}

data "aws_subnet" "private_app" {
  for_each = toset(data.aws_subnets.private_app.ids)
  id       = each.value
}