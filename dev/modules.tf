module "network" {
  source = "github.com/doskochynskyi/MentorTFModules.git//modules/network"

  region = var.region
  prefix = "${var.prefix}"
  resource_group = "RG${var.prefix}"
  vnet_address_space = ["192.168.151.0/24"]
  subnet_firewall_address_space = ["192.168.151.0/26"]
  subnet_aci_address_space = ["192.168.151.64/26"]
}

/*
  module "firewall" {
  source = "github.com/doskochynskyi/MentorTFModules.git//modules/firewall"

  region = var.region
  resource_group = "RG${var.prefix}"
  fwnet_id = module.network.fwnet_id
}
*/
