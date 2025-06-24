variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "object_key" {
  description = "Name of the object (key)"
  type        = string
}

variable "template_path" {
  description = "Path to the CloudFormation template file"
  type        = string
}
