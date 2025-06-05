


output "vcn_id" {
  description = "OCID of the created VCN"
  value       = oci_core_vcn.vcn.id
}

output "subnet_id" {
  description = "OCID of the created subnet"
  value       = oci_core_subnet.subnet.id
}

/*
output "instance_public_ip" {
  description = "Public IP address of the instance"
  value       = oci_core_instance.ubuntu_vm.public_ip
}
*/