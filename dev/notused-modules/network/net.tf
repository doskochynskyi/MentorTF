module "network" {
  source = "github.com/doskochynskyi/MentorTFModules.git//modules/network/"

  region = var.region
  resource_group = "RGdev"
}
