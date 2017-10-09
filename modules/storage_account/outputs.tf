output "url" {
  value = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
}