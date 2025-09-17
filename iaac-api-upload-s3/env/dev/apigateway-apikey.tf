resource "aws_api_gateway_api_key" "this" {
  name = "${local.name}-${local.environment}"
}


###########

resource "aws_api_gateway_api_key" "devops_alacarte" {
  name        = "api-devops-alacarte-${local.environment}"
  enabled     = true
  description = "Chave de acesso para DevOps àlacarte no ambiente de desenvolvimento"
}
