terraform {
  required_version = ">=1.5.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">=6.0.0"
    }
  }
}


provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  private_key_path = var.private_key_path
  fingerprint      = var.fingerprint
  region           = var.region
  #auth = "ApiKey"  # API Key Authentication - default - Optional
}













#Instance Principal Authentication
/*
provider "oci" {
  region = var.region
  alias  = "instance_principal"
}
*/


#Resource Princial Authentication
/*
provider "oci" {
  auth = "ResourcePrincipal"  
  region = var.region
}
*/

#Session Token Authentication

/*
provider "oci" {
  auth                = "SecurityToken"                                        
  config_file_profile = "haridigitaltoken"
  #security_token = "z0;6JVy<Y71G>7+xikIQ"
  #security_token_file = "/Users/hbeerang/.oci/sessions/haridigitaltoken"
  region              = "us-ashburn-1"
  tenancy_ocid        = var.tenancy_ocid
  user_ocid           = var.user_ocid
}
*/
