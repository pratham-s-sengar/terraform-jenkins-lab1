variable "subscription_id" {
  description = "Azure Subscription ID"
}

variable "client_id" {
  description = "Azure Service Principal Client ID"
}

variable "client_secret" {
  description = "Azure Service Principal Client Secret"
  sensitive = true
}

variable "tenant_id" {
  description = "Azure Tenant ID"
}
