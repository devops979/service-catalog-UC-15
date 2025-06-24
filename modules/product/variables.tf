
variable "name" {
  description = "The name of the product"
  type        = string
}
variable "owner" {
  description = "The owner of the product"
  type        = string
}
variable "description" {
  description = "A description of the product"
  type        = string
}
variable "template_s3_url" {
  description = "The S3 URL of the product template"
  type        = string
}
