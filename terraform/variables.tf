# Global
variable "prefix" {
  type        = string
  description = "The prefix which should be used for all resources"
  default     = "uwu"
}

variable "location" {
  type        = string
  description = "The location to use for the VM"
  default     = "francecentral"
}

variable "ssh_key" {
  type        = string
  description = "The location of your SSH public key"
}

variable "domain" {
  type        = string
  description = "The custom domain to use for the VM"
  default     = "tf.yam-yam.dev"
}

# OS
variable "os_publisher" {
  type        = string
  description = "The publisher of the image to use for the VM"
  default     = "Canonical"
}

variable "os_offer" {
  type        = string
  description = "The offer of the image to use for the VM"
  default     = "0001-com-ubuntu-server-jammy"
}

variable "os_sku" {
  type        = string
  description = "The SKU of the image to use for the VM"
  default     = "22_04-lts"
}

variable "os_version" {
  type        = string
  description = "The version of Ubuntu to use for the VM"
  default     = "latest"
}

# Credentials
variable "admin_username" {
  type        = string
  description = "The username for the VM"
}

variable "admin_password" {
  type        = string
  description = "The password for the VM"
}
