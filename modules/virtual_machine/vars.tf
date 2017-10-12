variable location {}

variable resource_group_name {
  default = ""
  description = "Resource group name"
}

variable vnetwork_interface_id {
  default = ""
  description = "Virtual network interface ID"
}

variable blob_storage_url {
  default = ""
  description = "Blob storage URL"
}

variable sshkey {
  description = "Public SSH key's path for vm login"
}