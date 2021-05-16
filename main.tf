data "ibm_resource_group" "rhpds" {
  name = var.resource_group
}

locals {
  ZONE = "${var.ibmcloud_region}-${var.ibmcloud_zone}"
}

resource "ibm_is_vpc" "rhpds" {
  name = var.vpc_name
  resource_group = data.ibm_resource_group.rhpds.id
}

resource "ibm_is_public_gateway" "rhpds" {
  name = var.pg_name
  resource_group = data.ibm_resource_group.rhpds.id
  vpc  = ibm_is_vpc.rhpds.id
  zone = local.ZONE
}

resource "ibm_is_subnet" "rhpds" {
  name = var.subnet_name
  vpc             = ibm_is_vpc.rhpds.id
  resource_group = data.ibm_resource_group.rhpds.id
  zone            = local.ZONE
  public_gateway  = ibm_is_public_gateway.rhpds.id
  total_ipv4_address_count = 256
}

resource "ibm_resource_instance" "cos_instance" {
  name     = var.cos_name
  service  = "cloud-object-storage"
  plan     = "standard"
  location = "global"
}

resource "ibm_container_vpc_cluster" "rhpds" {
  name              = var.cluster_name
  vpc_id            = ibm_is_vpc.rhpds.id
  kube_version      = var.cluster_version
  flavor            = var.cluster_flavor
  worker_count      = var.cluster_worker_count
  resource_group_id = data.ibm_resource_group.rhpds.id
  cos_instance_crn  = ibm_resource_instance.cos_instance.id
  wait_till         = "IngressReady"
  zones {
    subnet_id = ibm_is_subnet.rhpds.id
    name      = local.ZONE
  }
}

data "ibm_container_cluster_config" "cluster_config" {
  cluster_name_id = ibm_container_vpc_cluster.rhpds.id
}
