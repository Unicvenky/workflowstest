# Local variables
locals {
  #-----------------------------------------------------------------------------------------------------------------#
  # General
  environment_lower = lower(var.env)
  environment_upper = upper(var.env)

  # Map environment to standardized environment tag prefix values
  environment_map = {
    "US-DEV"  = "DEV"
    "US-PERF" = "QA"
    "US-QA"   = "QA"
    "EU-DEV"  = "DEV"
    "EU-PERF" = "QA"
    "EU-QA"   = "QA"
  }
  environment_tag_prefix = local.environment_map[local.environment_upper]

  #-----------------------------------------------------------------------------------------------------------------#
  s3_tags = {
    "Environment"      = "US-EAST-${local.environment_tag_prefix}-CORP-RFM-${local.environment_upper}-S3"
    "GithubRepoModule" = "terraform-aws-s3-bucket"
    "GithubOrgModule"  = "terraform-aws-modules"
  }

}
