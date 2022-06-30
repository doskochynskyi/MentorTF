
resource "azurerm_resource_group" "rgdev" {
  name     = "RG${var.prefix}"
  location = "${var.region}"
}


