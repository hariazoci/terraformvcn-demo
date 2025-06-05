variable "tenancy_ocid" {
  description = "OCID of the tenancy"
  type        = string
  default = "value"
  #sensitive   = true
}

variable "user_ocid" {
  description = "OCID of the user"
  type        = string
  #sensitive   = true
}

variable "private_key_path" {
  description = "Path to the private key"
  type        = string
  #sensitive   = true
}

variable "fingerprint" {
  description = "API key fingerprint"
  type        = string
  #sensitive   = true
}

variable "region" {
  description = "OCI region"
  type        = string
  default     = "us-ashburn-1"
}

variable "compartment_ocid" {
  description = "Compartment OCID"
  type        = string
  #sensitive   = true
}

variable "label_prefix" {
  description = "Label prefix for resources"
  type        = string
  default     = "devad"
}

variable "vcn_cidr" {
  description = "VCN CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

/*
variable "subnet2_cidr" {
  description = "Subnet CIDR block"
  type        = string
  default     = "10.0.2.0/24"
  sensitive   = true
}
*/


















/*

variable "instance_shape" {
  description = "Instance shape"
  type        = string
  default     = "VM.Standard.A1.Flex"
}

variable "ubuntu_image_ocid" {
  description = "Ubuntu image OCID"
  type        = string
  default     = "ocid1.image.oc1.iad.aaaaaaaaawlhooqpzzix3htnpahbffolayjeywizidlaa2jidklbdpb5rouq" # Ubuntu-24.04
}


variable "instance_name" {
  description = "Instance name"
  type        = string
  default     = "ubuntu-terraform"
}
*/

