variable "name" {
  type        = string
  default     = ""
  description = "Generic name of the resource group"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Common name for the region to deploy, allowed location are France Central or France South"
}

variable "address_space" {
  type        = string
  default     = "10.2.0.0/16"
  description = "Full CIDR notation for the resource group, this must match the convention x.x.x.x/x"
}