resource "aws_s3_bucket" "template_bucket" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = {
    Name = "ServiceCatalogTemplateBucket"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.template_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "cloudformation_template" {
  bucket = aws_s3_bucket.template_bucket.id
  key    = var.object_key
  source = var.template_path
  etag   = filemd5(var.template_path)

}