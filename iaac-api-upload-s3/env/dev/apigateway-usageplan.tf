resource "aws_api_gateway_stage" "stage" {
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id   = aws_api_gateway_rest_api.api.id
  stage_name    = "dev"
}

resource "aws_api_gateway_usage_plan" "plan" {
  name         = "${local.environment}-${local.name}-api-plan"
  description  = "${local.name}-private-api"
  product_code = "UPL"

  api_stages {
    api_id = aws_api_gateway_rest_api.api.id
    stage  = aws_api_gateway_stage.stage.stage_name
  }

  api_stages {
    api_id = aws_api_gateway_rest_api.api.id
    stage  = aws_api_gateway_stage.stage.stage_name
  }
}

resource "aws_api_gateway_usage_plan_key" "apikey" {
  key_id        = aws_api_gateway_api_key.this.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.plan.id
}

#################

resource "aws_api_gateway_stage" "devops_alacarte_stage" {
  deployment_id = aws_api_gateway_deployment.devops_alacarte_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.api_publica.id
  stage_name    = local.environment
}

resource "aws_api_gateway_usage_plan" "devops_alacarte_plan" {
  name         = "api-devops-alacarte-api-${local.environment}-plan"
  description  = "${local.name}-devops-alacarte-api"
  product_code = "UPL"

  api_stages {
    api_id = aws_api_gateway_rest_api.api_publica.id
    stage  = aws_api_gateway_stage.devops_alacarte_stage.stage_name
  }
}

resource "aws_api_gateway_api_key" "devops_alacarte_key" {
  name        = "api-${local.name}-${local.environment}"
  enabled     = true
  description = "Chave de acesso para ${local.name} no ambiente ${local.environment}"
}

resource "aws_api_gateway_usage_plan_key" "devops_alacarte_key_binding" {
  key_id        = aws_api_gateway_api_key.devops_alacarte_key.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.devops_alacarte_plan.id
}
