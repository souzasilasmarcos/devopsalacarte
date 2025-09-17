resource "aws_api_gateway_method" "object_method" {
  rest_api_id      = aws_api_gateway_rest_api.api.id
  resource_id      = aws_api_gateway_resource.objetct_resource.id
  http_method      = "PUT"
  authorization    = "NONE"
  api_key_required = true

  request_parameters = {
    "method.request.path.object"      = true
    "method.request.header.x-api-key" = true
  }
}

resource "aws_api_gateway_method" "get_object_method" {
  rest_api_id      = aws_api_gateway_rest_api.api.id
  resource_id      = aws_api_gateway_resource.objetct_resource.id
  http_method      = "GET"
  authorization    = "NONE"
  api_key_required = true

  request_parameters = {
    "method.request.path.object"      = true
    "method.request.header.x-api-key" = true
  }
}

resource "aws_api_gateway_method" "delete_object_method" {
  rest_api_id      = aws_api_gateway_rest_api.api.id
  resource_id      = aws_api_gateway_resource.objetct_resource.id
  http_method      = "DELETE"
  authorization    = "NONE"
  api_key_required = true

  request_parameters = {
    "method.request.path.object"      = true
    "method.request.header.x-api-key" = true
  }
}

resource "aws_api_gateway_method" "post_object_method" {
  rest_api_id      = aws_api_gateway_rest_api.api.id
  resource_id      = aws_api_gateway_resource.objetct_resource.id
  http_method      = "POST"
  authorization    = "NONE"
  api_key_required = true

  request_parameters = {
    "method.request.path.object"      = true
    "method.request.header.x-api-key" = true
  }
}


#######

resource "aws_api_gateway_method" "object_method_002" {
  rest_api_id      = aws_api_gateway_rest_api.api.id
  resource_id      = aws_api_gateway_resource.objetct_resource_002.id
  http_method      = "PUT"
  authorization    = "NONE"
  api_key_required = true

  request_parameters = {
    "method.request.path.object"      = true
    "method.request.header.x-api-key" = true
  }
}

resource "aws_api_gateway_method" "get_object_method_002" {
  rest_api_id      = aws_api_gateway_rest_api.api.id
  resource_id      = aws_api_gateway_resource.objetct_resource_002.id
  http_method      = "GET"
  authorization    = "NONE"
  api_key_required = true

  request_parameters = {
    "method.request.path.object"      = true
    "method.request.header.x-api-key" = true
  }
}

resource "aws_api_gateway_method" "delete_object_method_002" {
  rest_api_id      = aws_api_gateway_rest_api.api.id
  resource_id      = aws_api_gateway_resource.objetct_resource_002.id
  http_method      = "DELETE"
  authorization    = "NONE"
  api_key_required = true

  request_parameters = {
    "method.request.path.object"      = true
    "method.request.header.x-api-key" = true
  }
}


##########

resource "aws_api_gateway_method" "object_method_003" {
  rest_api_id      = aws_api_gateway_rest_api.api.id
  resource_id      = aws_api_gateway_resource.objetct_resource_003.id
  http_method      = "PUT"
  authorization    = "NONE"
  api_key_required = true

  request_parameters = {
    "method.request.path.object"      = true
    "method.request.header.x-api-key" = true
  }
}

resource "aws_api_gateway_method" "get_object_method_003" {
  rest_api_id      = aws_api_gateway_rest_api.api.id
  resource_id      = aws_api_gateway_resource.objetct_resource_003.id
  http_method      = "GET"
  authorization    = "NONE"
  api_key_required = true

  request_parameters = {
    "method.request.path.object"      = true
    "method.request.header.x-api-key" = true
  }
}

resource "aws_api_gateway_method" "delete_object_method_003" {
  rest_api_id      = aws_api_gateway_rest_api.api.id
  resource_id      = aws_api_gateway_resource.objetct_resource_003.id
  http_method      = "DELETE"
  authorization    = "NONE"
  api_key_required = true

  request_parameters = {
    "method.request.path.object"      = true
    "method.request.header.x-api-key" = true
  }
}

resource "aws_api_gateway_method" "post_object_method_003" {
  rest_api_id      = aws_api_gateway_rest_api.api.id
  resource_id      = aws_api_gateway_resource.objetct_resource_003.id
  http_method      = "POST"
  authorization    = "NONE"
  api_key_required = true

  request_parameters = {
    "method.request.path.object"      = true
    "method.request.header.x-api-key" = true
  }
}

##########

locals {
  object_resources = {
    upload       = aws_api_gateway_resource.object_paths[0].id
    send_message = aws_api_gateway_resource.object_paths[1].id
    input        = aws_api_gateway_resource.object_paths[2].id
  }

  http_methods = ["PUT", "GET", "DELETE", "POST"]

  method_map = {
    for combo in flatten([
      for path, resource_id in local.object_resources : [
        for method in local.http_methods : {
          key         = "${path}_${method}"
          method      = method
          resource_id = resource_id
        }
      ]
      ]) : combo.key => {
      method      = combo.method
      resource_id = combo.resource_id
    }
  }
}

resource "aws_api_gateway_method" "object_methods" {
  for_each = local.method_map

  rest_api_id      = aws_api_gateway_rest_api.api_publica.id
  resource_id      = each.value.resource_id
  http_method      = each.value.method
  authorization    = "NONE"
  api_key_required = true

  request_parameters = {
    "method.request.path.object"      = true
    "method.request.header.x-api-key" = true
  }
}
