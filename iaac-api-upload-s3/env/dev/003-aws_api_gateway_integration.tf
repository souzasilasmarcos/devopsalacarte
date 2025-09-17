resource "aws_api_gateway_integration" "s3_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.objetct_resource.id
  http_method             = aws_api_gateway_method.object_method.http_method
  integration_http_method = "PUT"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:s3:path/{bucket}/load/{object}"

  credentials = aws_iam_role.api_gateway_role.arn

  request_parameters = {
    "integration.request.path.bucket" = "'dev-api-upload-s3'"
    "integration.request.path.object" = "method.request.path.object"
  }

  request_templates = {
    "application/json" = ""
  }

  passthrough_behavior = "WHEN_NO_MATCH"
}

resource "aws_api_gateway_integration" "s3_get_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.objetct_resource.id
  http_method             = aws_api_gateway_method.get_object_method.http_method
  integration_http_method = "GET"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:s3:path/{bucket}/load/{object}"

  credentials = aws_iam_role.api_gateway_role.arn

  request_parameters = {
    "integration.request.path.bucket" = "'dev-api-upload-s3'"
    "integration.request.path.object" = "method.request.path.object"
  }

  request_templates = {
    "application/json" = ""
  }

  passthrough_behavior = "WHEN_NO_MATCH"
}

resource "aws_api_gateway_integration" "s3_delete_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.objetct_resource.id
  http_method             = aws_api_gateway_method.delete_object_method.http_method
  integration_http_method = "DELETE"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:s3:path/{bucket}/load/{object}"

  credentials = aws_iam_role.api_gateway_role.arn

  request_parameters = {
    "integration.request.path.bucket" = "'dev-api-upload-s3'"
    "integration.request.path.object" = "method.request.path.object"
  }

  request_templates = {
    "application/json" = ""
  }

  passthrough_behavior = "WHEN_NO_MATCH"
}

resource "aws_api_gateway_integration" "s3_post_integration" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.objetct_resource.id
  http_method             = aws_api_gateway_method.post_object_method.http_method
  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:s3:path/{bucket}/load/{object}"

  credentials = aws_iam_role.api_gateway_role.arn

  request_parameters = {
    "integration.request.path.bucket" = "'dev-api-upload-s3'"
    "integration.request.path.object" = "method.request.path.object"
  }

  request_templates = {
    "application/json" = ""
  }

  passthrough_behavior = "WHEN_NO_MATCH"
}

#############33

resource "aws_api_gateway_integration" "s3_integration_002" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.objetct_resource_002.id
  http_method             = aws_api_gateway_method.object_method_002.http_method
  integration_http_method = "PUT"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:s3:path/{bucket}/files/{object}"

  credentials = aws_iam_role.api_gateway_role.arn

  request_parameters = {
    "integration.request.path.bucket" = "'dev-lambda-send-messages-sqs'"
    "integration.request.path.object" = "method.request.path.object"
  }

  request_templates = {
    "application/json" = ""
  }

  passthrough_behavior = "WHEN_NO_MATCH"
}

resource "aws_api_gateway_integration" "get_s3_integration_002" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.objetct_resource_002.id
  http_method             = aws_api_gateway_method.get_object_method_002.http_method
  integration_http_method = "GET"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:s3:path/{bucket}/files/{object}"

  credentials = aws_iam_role.api_gateway_role.arn

  request_parameters = {
    "integration.request.path.bucket" = "'dev-lambda-send-messages-sqs'"
    "integration.request.path.object" = "method.request.path.object"
  }

  request_templates = {
    "application/json" = ""
  }

  passthrough_behavior = "WHEN_NO_MATCH"
}

resource "aws_api_gateway_integration" "delete_s3_integration_002" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.objetct_resource_002.id
  http_method             = aws_api_gateway_method.delete_object_method_002.http_method
  integration_http_method = "DELETE"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:s3:path/{bucket}/files/{object}"

  credentials = aws_iam_role.api_gateway_role.arn

  request_parameters = {
    "integration.request.path.bucket" = "'dev-lambda-send-messages-sqs'"
    "integration.request.path.object" = "method.request.path.object"
  }

  request_templates = {
    "application/json" = ""
  }

  passthrough_behavior = "WHEN_NO_MATCH"
}


########3

resource "aws_api_gateway_integration" "s3_integration_003" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.objetct_resource_003.id
  http_method             = aws_api_gateway_method.object_method_003.http_method
  integration_http_method = "PUT"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:s3:path/{bucket}/input/{object}"

  credentials = aws_iam_role.api_gateway_role.arn

  request_parameters = {
    "integration.request.path.bucket" = "'dev-api-upload-s3'"
    "integration.request.path.object" = "method.request.path.object"
  }

  request_templates = {
    "application/json" = ""
  }

  passthrough_behavior = "WHEN_NO_MATCH"
}

resource "aws_api_gateway_integration" "s3_get_integration_003" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.objetct_resource_003.id
  http_method             = aws_api_gateway_method.get_object_method.http_method
  integration_http_method = "GET"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:s3:path/{bucket}/input/{object}"

  credentials = aws_iam_role.api_gateway_role.arn

  request_parameters = {
    "integration.request.path.bucket" = "'dev-api-upload-s3'"
    "integration.request.path.object" = "method.request.path.object"
  }

  request_templates = {
    "application/json" = ""
  }

  passthrough_behavior = "WHEN_NO_MATCH"
}

resource "aws_api_gateway_integration" "s3_delete_integration_003" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.objetct_resource_003.id
  http_method             = aws_api_gateway_method.delete_object_method_003.http_method
  integration_http_method = "DELETE"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:s3:path/{bucket}/input/{object}"

  credentials = aws_iam_role.api_gateway_role.arn

  request_parameters = {
    "integration.request.path.bucket" = "'dev-api-upload-s3'"
    "integration.request.path.object" = "method.request.path.object"
  }

  request_templates = {
    "application/json" = ""
  }

  passthrough_behavior = "WHEN_NO_MATCH"
}

resource "aws_api_gateway_integration" "s3_post_integration_003" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.objetct_resource_003.id
  http_method             = aws_api_gateway_method.post_object_method_003.http_method
  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:s3:path/{bucket}/input/{object}"

  credentials = aws_iam_role.api_gateway_role.arn

  request_parameters = {
    "integration.request.path.bucket" = "'dev-api-upload-s3'"
    "integration.request.path.object" = "method.request.path.object"
  }

  request_templates = {
    "application/json" = ""
  }

  passthrough_behavior = "WHEN_NO_MATCH"
}


##############

locals {
  # Caminhos da API e seus buckets + sufixos de URI
  api_paths_config = {
    upload       = { bucket = "dev-api-upload-s3", uri_suffix = "load", resource_id = aws_api_gateway_resource.object_paths[0].id }
    send_message = { bucket = "dev-lambda-send-messages-sqs", uri_suffix = "files", resource_id = aws_api_gateway_resource.object_paths[1].id }
    input        = { bucket = "dev-api-upload-s3", uri_suffix = "input", resource_id = aws_api_gateway_resource.object_paths[2].id }
  }

  integration_map = {
    for combo in flatten([
      for path, config in local.api_paths_config : [
        for method in local.http_methods : {
          key         = "${path}_${method}"
          method      = method
          bucket      = config.bucket
          uri_suffix  = config.uri_suffix
          resource_id = config.resource_id
        }
      ]
      ]) : combo.key => {
      method      = combo.method
      bucket      = combo.bucket
      uri_suffix  = combo.uri_suffix
      resource_id = combo.resource_id
    }
  }
}

resource "aws_api_gateway_integration" "s3_integrations" {
  for_each = local.integration_map

  rest_api_id             = aws_api_gateway_rest_api.api_publica.id
  resource_id             = each.value.resource_id
  http_method             = each.value.method
  integration_http_method = each.value.method
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:s3:path/{bucket}/${each.value.uri_suffix}/{object}"

  credentials = aws_iam_role.api_gateway_role.arn

  request_parameters = {
    "integration.request.path.bucket" = "'${each.value.bucket}'"
    "integration.request.path.object" = "method.request.path.object"
  }

  request_templates = {
    "application/json" = ""
  }

  passthrough_behavior = "WHEN_NO_MATCH"
}
