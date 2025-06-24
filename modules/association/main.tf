
resource "aws_servicecatalog_product_portfolio_association" "this" {
  portfolio_id = var.portfolio_id
  product_id   = var.product_id
}
