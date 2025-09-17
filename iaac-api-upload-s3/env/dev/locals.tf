# general settings
locals {
  environment        = "dev"
  vpc_name           = "dev_us"
  vpc_id             = "vpc-123456789abcr"
  availability_zones = ["us-east-1a", "us-east-1c"]
  subnets_ids        = [for p_app in data.aws_subnet.private_app : p_app.id]
  name               = "api-upload-s3"
  region             = "us-east-1"

  workload = {
    name        = local.name
    workload    = "infra_pipelines"
    owner       = "lab"    
    iaac        = "yes"
  }
}

locals {
  s3 = {
    s3_api_upload = {
      bucket_name = "dev-api-upload-s3"
      environment = local.environment
      workload    = local.workload.name
      plataforma  = "dev"
    }
  }
}

locals {
  sg_vpce = {
    name        = "${local.environment}-${local.name}-sg"
    description = "${local.name} security group"
    vpc_id      = local.vpc_id

    ingress = toset([
      {
        description      = "Allow Request From Target Group"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        prefix_list_ids  = []
        security_groups  = []
        self             = null
      },
      {
        description      = "Allow Request From Target Group"
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = []
        prefix_list_ids  = []
        security_groups  = []
        self             = null
      }
    ])

    egress = toset([{
      description      = "Allow all"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = null
    }])

    tags = {
      Name = "${local.name}-sg"
    }
  }
}