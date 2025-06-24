
resource "aws_servicecatalog_constraint" "launch_role_constraint" {
  type         = "LAUNCH"
  description  = "Restrict launch role"
  portfolio_id = var.portfolio_id
  product_id   = var.product_id
  parameters = jsonencode({
    "RoleArn" = var.launch_role_arn
  })
}
