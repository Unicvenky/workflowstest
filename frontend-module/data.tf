#-----------------------------------------------------------------------------------------------------------------#
# Policy for Cloud Front Access
data "aws_iam_policy_document" "allow_s3_access_from_cloudfront" {
  statement {
    sid       = "CloudFrontGetObject"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.rfm2-product-ui.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.cfoai.iam_arn]
    }
  }
  statement {
    sid       = "S3AccessForGitHubWorkFlow"
    effect    = "Allow"
    actions   = ["s3:GetObject"]

    principals {
      type        = "AWS"
      identifiers = [var.account_id]
    }
    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values = [var.tf_workflow_role]
    }
    resources = ["${aws_s3_bucket.rfm2-product-ui.arn}/*"]
  }
}

