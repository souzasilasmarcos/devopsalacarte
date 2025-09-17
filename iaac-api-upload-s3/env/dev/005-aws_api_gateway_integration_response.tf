resource "aws_api_gateway_integration_response" "integration_response" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource.id
  http_method = aws_api_gateway_method.object_method.http_method
  status_code = aws_api_gateway_method_response.method_response.status_code
}

resource "aws_api_gateway_integration_response" "get_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource.id
  http_method = aws_api_gateway_method.get_object_method.http_method
  status_code = aws_api_gateway_method_response.method_response.status_code
}

resource "aws_api_gateway_integration_response" "delete_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource.id
  http_method = aws_api_gateway_method.delete_object_method.http_method
  status_code = aws_api_gateway_method_response.method_response.status_code
}

resource "aws_api_gateway_integration_response" "post_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource.id
  http_method = aws_api_gateway_method.post_object_method.http_method
  status_code = aws_api_gateway_method_response.method_response.status_code
}

resource "aws_api_gateway_integration_response" "integration_response_002" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource_002.id
  http_method = aws_api_gateway_method.object_method_002.http_method
  status_code = aws_api_gateway_method_response.method_response_002.status_code
}


resource "aws_api_gateway_integration_response" "get_integration_response_002" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource_002.id
  http_method = aws_api_gateway_method.get_object_method_002.http_method
  status_code = aws_api_gateway_method_response.get_method_response_002.status_code
}

resource "aws_api_gateway_integration_response" "delete_integration_response_002" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource_002.id
  http_method = aws_api_gateway_method.delete_object_method_002.http_method
  status_code = aws_api_gateway_method_response.delete_method_response_002.status_code
}

######

resource "aws_api_gateway_integration_response" "integration_response_003" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource_003.id
  http_method = aws_api_gateway_method.object_method_003.http_method
  status_code = aws_api_gateway_method_response.method_response_003.status_code
}

resource "aws_api_gateway_integration_response" "get_integration_response_003" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource_003.id
  http_method = aws_api_gateway_method.get_object_method_003.http_method
  status_code = aws_api_gateway_method_response.method_response_003.status_code
}

resource "aws_api_gateway_integration_response" "delete_integration_response_003" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource_003.id
  http_method = aws_api_gateway_method.delete_object_method_003.http_method
  status_code = aws_api_gateway_method_response.method_response_003.status_code
}

resource "aws_api_gateway_integration_response" "post_integration_response_003" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.objetct_resource_003.id
  http_method = aws_api_gateway_method.post_object_method_003.http_method
  status_code = aws_api_gateway_method_response.method_response_003.status_code
}

#############

locals {
  # Recursos {object} da nova API pública
  object_resources_api_publica = {
    upload       = aws_api_gateway_resource.object_paths[0].id
    send_message = aws_api_gateway_resource.object_paths[1].id
    input        = aws_api_gateway_resource.object_paths[2].id
  }

  # Métodos HTTP
  http_methods_api_publica = ["PUT", "GET", "DELETE", "POST"]

  # Mapeamento de integração response
  integration_response_map_api_publica = {
    for combo in flatten([
      for path, resource_id in local.object_resources_api_publica : [
        for method in local.http_methods_api_publica : {
          key         = "${path}_${method}"
          method      = method
          resource_id = resource_id
        }
      ]
      ]) : combo.key => {
      method      = combo.method
      resource_id = combo.resource_id
      status_code = "200"
    }
  }
}

resource "aws_api_gateway_integration_response" "integration_responses_api_publica" {
  for_each    = local.integration_response_map_api_publica
  rest_api_id = aws_api_gateway_rest_api.api_publica.id
  resource_id = each.value.resource_id
  http_method = each.value.method
  status_code = each.value.status_code
}
