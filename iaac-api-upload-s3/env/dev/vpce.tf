resource "aws_vpc_endpoint" "s3_api_upload_private" {
  vpc_id              = "vpc-123456789abcr"
  service_name        = "com.amazonaws.us-east-1.execute-api"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  policy = jsonencode({
    Statement = [
      {
        Action    = "*"
        Effect    = "Allow"
        Principal = "*"
        Resource  = "*"
      }
    ]
  })

  security_group_ids = [
    aws_security_group.vpce_sg.id
  ]

  subnet_ids = [
    "subnet-your-subnet-a",
    "subnet-your-subnet-b"
  ]

  dns_options {
    dns_record_ip_type = "ipv4"
  }

}