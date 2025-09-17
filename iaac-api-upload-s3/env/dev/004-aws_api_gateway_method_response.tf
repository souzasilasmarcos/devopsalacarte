resource "aws_api_gateway_method_response" "method_response" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource.id
  http_method = aws_api_gateway_method.object_method.http_method
  status_code = "200"
}

resource "aws_api_gateway_method_response" "get_method_response" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource.id
  http_method = aws_api_gateway_method.get_object_method.http_method
  status_code = "200"
}

resource "aws_api_gateway_method_response" "delete_method_response" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource.id
  http_method = aws_api_gateway_method.delete_object_method.http_method
  status_code = "200"
}

resource "aws_api_gateway_method_response" "post_method_response" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource.id
  http_method = aws_api_gateway_method.post_object_method.http_method
  status_code = "200"
}

###########

resource "aws_api_gateway_method_response" "method_response_002" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource_002.id
  http_method = aws_api_gateway_method.object_method_002.http_method
  status_code = "200"
}

resource "aws_api_gateway_method_response" "get_method_response_002" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource_002.id
  http_method = aws_api_gateway_method.get_object_method_002.http_method
  status_code = "200"
}

resource "aws_api_gateway_method_response" "delete_method_response_002" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource_002.id
  http_method = aws_api_gateway_method.delete_object_method_002.http_method
  status_code = "200"
}

########

resource "aws_api_gateway_method_response" "method_response_003" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource_003.id
  http_method = aws_api_gateway_method.object_method_003.http_method
  status_code = "200"
}

resource "aws_api_gateway_method_response" "get_method_response_003" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource_003.id
  http_method = aws_api_gateway_method.get_object_method_003.http_method
  status_code = "200"
}

resource "aws_api_gateway_method_response" "delete_method_response_003" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource_003.id
  http_method = aws_api_gateway_method.delete_object_method_003.http_method
  status_code = "200"
}

resource "aws_api_gateway_method_response" "post_method_response_003" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource_003.id
  http_method = aws_api_gateway_method.post_object_method_003.http_method
  status_code = "200"
}

##########

locals {
  # Referência ao recurso {object} da nova API pública — corrigido para o índice desejado
  object_resource_devops = aws_api_gateway_resource.object_paths[0].id

  # Lista de métodos HTTP que precisam de resposta
  http_methods_devops = ["PUT", "GET", "DELETE", "POST"]

  # Mapeamento para gerar os blocos dinamicamente
  method_response_map_devops = {
    for method in local.http_methods_devops : method => {
      http_method = method
      resource_id = local.object_resource_devops
      status_code = "200"
    }
  }
}

resource "aws_api_gateway_method_response" "devops_method_responses" {
  for_each    = local.method_response_map_devops
  rest_api_id = aws_api_gateway_rest_api.api_publica.id
  resource_id = each.value.resource_id
  http_method = each.value.http_method
  status_code = each.value.status_code
}
