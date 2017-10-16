Follow this [Microsoft Guide](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure) to install and configure Terraform

This demo is to see how Terraform Modules work. The original sample script from [Miscrosoft official guide](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-create-complete-vm) is splited into four modules here.

### .gitignore explained

*.tfvar, .terraform/, terrafrom.state can contain secrets therefore not uploaded. A better secret management could be via [backend](https://www.terraform.io/docs/backends/types/azurerm.html).


### Structure explained

```
.
├── README.md
├── dev.tfvar
├── dev.tfvar.template
├── main.tf
├── modules
│   ├── resource_group
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── vars.tf
│   ├── storage_account
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── vars.tf
│   ├── virtual_machine
│   │   ├── main.tf
│   │   └── vars.tf
│   └── virtual_network
│       ├── main.tf
│       ├── outputs.tf
│       └── vars.tf
├── terraform.tfstate
├── terraform.tfstate.backup
└── variables.tf
```

- `main.tf` modules instantiation.
- `variables.tf` variables declaration.
- `dev.tfvar.template` template for `dev.tfvar` with empty values.
- `dev.tfvar` values for vars in `variables.tf`. Donot share this file as it can contain sensitive information.
- `modules/` each repo inside modules/ can be instantiated as a Terraform module. 
  - `main.tf` module resources
  - `vars.tf` variables declaration
  - `outputs.tf` define outputs. Module outputs can be used in other resources.





### To do
- Add load balancers and virtual machine scale sets
- Parameterize Terraform configuration files
- Backend terraform.state should better be saved on backend (s3/azurerm, etc)



### To run

Five environment variables are used here: ARM_SUBSCRIPTION_ID, ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID and ARM_TEST_LOCATION. Follow steps from [here](https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html) to create these credentials.

`terraform init . \`
`terraform get` \
`terraform plan -var-file=xxx.tfvar` \
`terraform apply -var-file=xxx.tfvar`
