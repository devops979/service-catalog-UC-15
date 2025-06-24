module "portfolio" {
  source        = "./modules/portfolio"
  name          = "WebAppPortfolio"
  description   = "Portfolio for Web Application"
  provider_name = "DevOps Team"
}

module "template_upload" {
  source        = "./modules/s3_template_uploader"
  bucket_name   = "my-servicecatalog-template-bucket"
  object_key    = "ec2-template.yaml"
  template_path = "${path.module}/ec2-template.yaml"
}

module "product" {
  source          = "./modules/product"
  name            = "EC2 WebApp"
  owner           = "DevOps"
  description     = "Launch EC2-based web app"
  template_s3_url = module.template_upload.template_url
}


module "association" {
  source       = "./modules/association"
  portfolio_id = module.portfolio.id
  product_id   = module.product.id
}

module "iam" {
  source             = "./modules/iam"
  launch_role_name   = "SC-EC2-Launch-Role"
  portfolio_id       = module.portfolio.id
}

module "constraints" {
  source          = "./modules/constraints"
  portfolio_id    = module.portfolio.id
  product_id      = module.product.id
  launch_role_arn = module.iam.launch_role.arn
}
