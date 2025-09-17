resource "aws_security_group" "vpce_sg" {
  name        = local.sg_vpce.name
  description = local.sg_vpce.description
  vpc_id      = local.sg_vpce.vpc_id
  ingress     = local.sg_vpce.ingress
  egress      = local.sg_vpce.egress
  tags        = local.sg_vpce.tags
}