output "id" {
  value = "${azurerm_virtual_network.myterraformnetwork.id}"
}

output "name" {
  value = "${azurerm_virtual_network.myterraformnetwork.name}"
}

output "nic" {
  value = "${azurerm_network_interface.myterraformnic.id}"
}