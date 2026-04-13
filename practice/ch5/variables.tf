variable "location" {
    description = "Deploy in US West"
    type        = string
    default     = "westus2"
}

variable "namespace" {
    description = "Unique Azure namespace for resources"
    default     = "default"
}

variable "subscription_id" {
    description = "The Azure Subscription ID to deploy resources into"
    type        = string
}

variable "sku_name" {
    description = "The sku for the plan"
    type        = string
    default     = "Y1"
}