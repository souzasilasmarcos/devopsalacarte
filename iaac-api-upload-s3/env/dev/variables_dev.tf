variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Name of the AWS region"
}

variable "aws_tags_terraform" {
  type        = string
  default     = "Terraform"
  description = "Managed by indicator"
}

variable "environment" {
  type    = string
  default = "dev"

}

variable "aws_role_name" {
  type        = string
  default     = "dev-ApiUploadS3-role"
  description = "Role api ApiUploadS3"
}

variable "aws_ApiUploadS3_policy" {
  type        = string
  default     = "ApiUploadS3Policy"
  description = "Define the name of the new policy"
}

variable "custom_ApiUploadS3_attachment" {
  type        = string
  default     = "custom_ApiUploadS3_attachment"
  description = "Define the name of Custom policy attachment"
}

variable "cw_attachment" {
  type        = string
  default     = "cw_ApiUploadS3_attachment"
  description = "Define the name of CW policy attachment"
}