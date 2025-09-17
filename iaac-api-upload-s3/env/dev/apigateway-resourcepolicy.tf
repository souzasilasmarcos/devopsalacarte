resource "aws_api_gateway_rest_api_policy" "this" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  policy      = file("resource_policy_api.json")
}