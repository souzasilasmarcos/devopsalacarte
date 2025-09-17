################################
# Creating a role for api   #
################################

resource "aws_iam_role" "api_gateway_role" {
  name = var.aws_role_name

  #Terraform's "jsonencode" function converts a expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = ["s3.amazonaws.com", "apigateway.amazonaws.com"]
        }
      },
    ]
  })
  tags = {
    ManagedBy = var.aws_tags_terraform
  }
}

#Creating a custom policy for Lambda
resource "aws_iam_policy" "policy" {
  name   = var.aws_ApiUploadS3_policy
  policy = file("./policy.json")
  tags = {
    ManagedBy = var.aws_tags_terraform
  }
}

#Attach custom policy to Role 
resource "aws_iam_policy_attachment" "custom_policy_role" {
  name       = var.custom_ApiUploadS3_attachment
  roles      = [aws_iam_role.api_gateway_role.name]
  policy_arn = aws_iam_policy.policy.arn
}

#Attach CloudWatch policy to Role 
resource "aws_iam_policy_attachment" "cw_policy_role" {
  name       = var.cw_attachment
  roles      = [aws_iam_role.api_gateway_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}