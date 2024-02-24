resource "aws_s3_bucket" "rfm2-product-ui" {
  bucket = "rfm2-product-ui-${var.env}"
  tags   = merge(
    var.mcd_tags,
    local.s3_tags
  )
}
resource "aws_s3_bucket_website_configuration" "rfm2-product-ui-website-config" {
  bucket = aws_s3_bucket.rfm2-product-ui.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "rfm2-product-ui" {
  bucket = aws_s3_bucket.rfm2-product-ui.bucket
  rule {
    bucket_key_enabled = false
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "rfm2-product-ui-block-public-access" {
  bucket                  = aws_s3_bucket.rfm2-product-ui.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "bucket_policy_allow_s3_from_cloudfront" {
  bucket = aws_s3_bucket.rfm2-product-ui.id
  policy = data.aws_iam_policy_document.allow_s3_access_from_cloudfront.json
}
