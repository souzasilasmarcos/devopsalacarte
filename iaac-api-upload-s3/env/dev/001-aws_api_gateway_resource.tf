resource "aws_api_gateway_resource" "upload_resource" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "upload"
}

resource "aws_api_gateway_resource" "bucket_resource" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_resource.upload_resource.id
  path_part   = "{bucket}"
}

resource "aws_api_gateway_resource" "objetct_resource" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_resource.bucket_resource.id
  path_part   = "{object}"
}

###########3

resource "aws_api_gateway_resource" "upload_resource_002" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "send_message"
}

resource "aws_api_gateway_resource" "bucket_resource_002" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_resource.upload_resource_002.id
  path_part   = "{bucket}"
}


resource "aws_api_gateway_resource" "objetct_resource_002" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_resource.bucket_resource_002.id
  path_part   = "{object}"
}


#########


resource "aws_api_gateway_resource" "input_resource_003" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "input"
}

resource "aws_api_gateway_resource" "bucket_resource_003" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_resource.input_resource_003.id
  path_part   = "{bucket}"
}

resource "aws_api_gateway_resource" "objetct_resource_003" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_resource.bucket_resource_003.id
  path_part   = "{object}"
}

###########

# Função para criar um caminho genérico
locals {
  paths = [
    { base = "upload", bucket = true, object = true },
    { base = "send_message", bucket = true, object = true },
    { base = "input", bucket = true, object = true }
  ]
}

# Recurso base (upload, send_message, input)
resource "aws_api_gateway_resource" "base_paths" {
  count       = length(local.paths)
  rest_api_id = aws_api_gateway_rest_api.api_publica.id
  parent_id   = aws_api_gateway_rest_api.api_publica.root_resource_id
  path_part   = local.paths[count.index].base
}

# Recurso bucket
resource "aws_api_gateway_resource" "bucket_paths" {
  count       = length(local.paths)
  rest_api_id = aws_api_gateway_rest_api.api_publica.id
  parent_id   = aws_api_gateway_resource.base_paths[count.index].id
  path_part   = "{bucket}"
}

# Recurso object
resource "aws_api_gateway_resource" "object_paths" {
  count       = length(local.paths)
  rest_api_id = aws_api_gateway_rest_api.api_publica.id
  parent_id   = aws_api_gateway_resource.bucket_paths[count.index].id
  path_part   = "{object}"
}
