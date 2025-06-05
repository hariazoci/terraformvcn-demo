
resource "oci_core_vcn" "vcn" {
  compartment_id = var.compartment_ocid
  cidr_block     = var.vcn_cidr
  display_name   = "${var.label_prefix}-vcn"
  dns_label      = "vcn"
}

resource "oci_core_subnet" "subnet" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  cidr_block     = var.subnet_cidr
  display_name   = "${var.label_prefix}-subnet"
  dns_label      = "subnet"
}



resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "${var.label_prefix}-igw"
}

resource "oci_core_route_table" "rt" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "${var.label_prefix}-rt"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}


resource "oci_core_security_list" "sl" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "${var.label_prefix}-sl"

  ingress_security_rules {
    protocol  = "6"
    source    = "10.0.0.0/24" # Replace with the required IP
    stateless = false

    tcp_options {
      min = 22
      max = 22
    }
  }


  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
    stateless   = false
  }
}


/*
resource "oci_core_subnet" "dev-subnet-2" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  cidr_block     = var.subnet2_cidr
  display_name   = "dev-subnet-2"
  dns_label      = "subnet"
}

*/

























/*
resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "${var.label_prefix}-igw"
}

resource "oci_core_route_table" "rt" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "${var.label_prefix}-rt"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.igw.id
  }
}

resource "oci_core_security_list" "sl" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "${var.label_prefix}-sl"

  ingress_security_rules {
    protocol  = "6"
    source    = "106.215.170.39/32" # Replace with your public IP
    stateless = false

    tcp_options {
      min = 22
      max = 22
    }
  }

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
    stateless   = false
  }
}

resource "oci_core_instance" "ubuntu_vm" {
  compartment_id      = var.compartment_ocid
  availability_domain = data.oci_identity_availability_domain.ad.name
  shape               = var.instance_shape
  display_name        = var.instance_name

  shape_config {
    ocpus         = 1 # Specify the number of OCPUs
    memory_in_gbs = 6 # Specify the memory in GBs
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.subnet.id
    assign_public_ip = true
    hostname_label   = var.instance_name
  }

  source_details {
    source_type = "image"
    source_id   = var.ubuntu_image_ocid
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
  }
}

data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}
*/