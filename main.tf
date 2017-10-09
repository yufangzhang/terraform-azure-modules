# Configure the Microsoft Azure Provider
provider "azurerm" {
}
module "virtual_network" {
  source = "modules/virtual_network"
  location = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
}
module "storage_account" {
  source = "modules/storage_account"
  location = "${var.location}"
  resource_group_id = "${module.resource_group.id}"
  resource_group_name = "${module.resource_group.name}"
}
module "virtual_machine" {
  source = "modules/virtual_machine"
  location = "${var.location}"
  vnetwork_interface_id = "${module.virtual_network.nic}"
  resource_group_name = "${module.resource_group.name}"
  blob_storage_url = "${module.storage_account.url}"
  sshkey = "${var.sshkey}"

}
module "resource_group" {
  source = "modules/resource_group"
  location = "${var.location}"
}
