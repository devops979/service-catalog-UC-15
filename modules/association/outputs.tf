
output "association_id" {
  description = "The ID of the Service Catalog portfolio-product association"
  value       = aws_servicecatalog_product_portfolio_association.this.id
}
