module "arurerm_resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

# module "azurerm_storage_account" {
#   source     = "../../modules/azurerm_storage_account"
#   stg        = var.stg
#   depends_on = [module.arurerm_resource_group]
# }


module "azurerm_vnets" {
  source     = "../../modules/azurerm_vnet"
  vnets      = var.vnets
  depends_on = [module.arurerm_resource_group]

}

module "azurerm_pip" {
  source     = "../../modules/azurerm_pip"
  depends_on = [module.arurerm_resource_group]
  infra_pips = var.infra_pips
}

module "sql_server" {
  source          = "../../modules/azurerm_sql_server"
  sql_server_name = "sql-dev-todoapp-9879"
  rg_name         = "infra-rg-001"
  location        = "centralindia"
  admin_username  = "mukeshkumar"
  admin_password  = "Admin@1234"
  tags            = {}
}

module "sql_db" {
  depends_on  = [module.sql_server]
  source      = "../../modules/azurerm_sql_database"
  sql_db_name = "sqldb-dev-todoapp"
  server_id   = module.sql_server.server_id
  max_size_gb = "2"
  tags        = {}
}

module "key_vault" {
  source     = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
}

# module "azurerm_key_vault_secret" {
#   source  = "../../modules/azurerm_key_vault_secret"
#   secrets = var.secrets
#   depends_on = [module.key_vault]
# }

module "azurerm_nic" {
  source     = "../../modules/azurerm_network_interface"
  nics       = var.nics
  depends_on = [module.azurerm_pip]
  
}

module "azurerm_vm" {
  source   = "../../modules/azurerm_virtual_mechine"
  vms      = var.vms
  nic_ids  = module.azurerm_nic.nic_ids   
  depends_on = [module.azurerm_nic]
}

module "bastion" {
  source     = "../../modules/azurerm_bastion"
  bastions   = var.bastions
  depends_on = [module.azurerm_vnets, module.azurerm_pip]
  
}