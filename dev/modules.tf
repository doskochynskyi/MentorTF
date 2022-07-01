module "network" {
  source = "github.com/doskochynskyi/MentorTFModules.git//modules/network"

  region = var.region
  resource_group = "RG${var.prefix}"

}

/*
  module "firewall" {
  source = "github.com/doskochynskyi/MentorTFModules.git//modules/firewall"

  region = var.region
  resource_group = "RG${var.prefix}"
  fwnet_id = module.network.fwnet_id
}
*/
