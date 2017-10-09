# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "myrg" {
    name     = "myResourceGroup"
    location = "${var.location}"

    tags {
        environment = "Terraform Demo"
    }
}
