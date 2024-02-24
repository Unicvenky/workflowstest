# Variables of the assume_role block for the provider
#####################################################################################################################################################
variable "account_id" {
  description = "AWS account ID"
  type        = number
}

variable "region" {
  description = "AWS Region of the S3 Bucket and DynamoDB Table (if used). This can also be sourced from the AWS_DEFAULT_REGION and AWS_REGION environment variables."
  type        = string
  default     = ""
}

variable "terraform_role_arn" {
  description = "AWS IAM Role Arn"
  type        = string
  default     = ""
}

variable "session_name" {
  description = "Session name to use when assuming the role."
  type        = string
  default     = ""
}

#####################################################################################################################################################
# General Variables
#####################################################################################################################################################
variable "env" {
  description = "Environment"
  type        = string
  default     = ""
}
variable "tf_workflow_role" {
  description = "Role used by TF to apply changes"
  type        = string
  default     = ""
}

#####################################################################################################################################################
# Variables of default tags for the provider
#####################################################################################################################################################
variable "mcd_tags" {
  type    = map(string)
  default = {
    "ApplicationID"      = "APP0000552",
    "cpm backup"         = "mcds_us_none_1_non_prod",
    "DataClassification" = "business-use",
    "GBL"                = "195500855387",
    "Owner"              = "mcsharks@us.mcd.com",
    "Patch Group"        = "USA-RFM-Non-Prod",
    "RFM_Env"            = "Non-Prod",
    "Terraform Managed"  = "True"
  }

}

variable "create_conditional_restaurant_api_cognito_app_client" {
  description = "Whether or not to create restaurant_api_cognito_app_client resource for product UI"
  type        = bool
  default     = false
}
