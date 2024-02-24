#Creat OAI for cloudfront to access s3 bucket
resource "aws_cloudfront_origin_access_identity" "cfoai" {
  comment = "${aws_s3_bucket.rfm2-product-ui.id} OAI"
}
