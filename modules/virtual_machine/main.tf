# Create virtual machine
resource "azurerm_virtual_machine" "myterraformvm" {
    name                  = "myVM"
    location              = "${var.location}"
    resource_group_name   = "${var.resource_group_name}"
    network_interface_ids = ["${var.vnetwork_interface_id}"]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "myvm"
        admin_username = "azureuser"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "${file(var.sshkey)}"
        }
    }

    boot_diagnostics {
        enabled = "true"
        storage_uri = "${var.blob_storage_url}"
    }

    tags {
        environment = "Terraform Demo"
    }
}
