
resource "aws_servicecatalog_product" "this" {
  name        = var.name
  owner       = var.owner
  type        = "CLOUD_FORMATION_TEMPLATE"
  description = var.description

  provisioning_artifact_parameters {
    name         = "v1"
    type         = "CLOUD_FORMATION_TEMPLATE"
    template_url = var.template_s3_url
  }
}
