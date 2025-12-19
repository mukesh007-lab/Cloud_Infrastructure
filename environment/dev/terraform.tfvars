rgs = {
  rg1 = {
    name       = "infra-rg-001"
    location   = "centralindia"
    managed_by = "Terraform"
    tags = {
      env        = "dev"
      managed_by = "Terraform"
      owner      = "mukesh_kumar"
    }
  }
  rg2 = {
    name       = "infra-rg-002"
    location   = "centralindia"
    managed_by = "Terraform"
    tags = {
      env        = "dev"
      managed_by = "Terraform"
      owner      = "mukesh_kumar"
    }
  }
}



# stg = {
#   stg1 = {

#     name                     = "infrastorageacct001"
#     resource_group_name      = "infra-rg-001"
#     location                 = "centralindia"
#     account_tier             = "Standard"
#     account_replication_type = "LRS"
#     tags = {
#       env        = "dev"
#       managed_by = "Terraform"
#       owner      = "mukesh_kumar"
#     }
#   }
# }

# infra_containers = {
#   container1 = {
#     name                  = "infracontainer001"
#     storage_account_name  = "infrastorageacct001"
#     container_access_type = "private"
#     tags = {
#       env        = "dev"
#       managed_by = "Terraform"
#       owner      = "mukesh_kumar"
#     }
#   }
# }


vnets = {
  "vnet1" = {
    name                = "infravnet001"
    location            = "centralindia"
    resource_group_name = "infra-rg-001"
    address_space       = ["10.0.0.0/16"]
    subnets = {
      "subnet1" = {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      "subnet2" = {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
      "bastion" = {
        name             = "bastion-subnet"
        address_prefixes = ["10.0.3.0/24"]
      }
    }
    tags = {
      env        = "dev"
      managed_by = "Terraform"
      owner      = "mukesh_kumar"
    }
  }
}

infra_pips = {
  "pip1" = {
    name                = "Infra-pip-001"
    location            = "centralindia"
    resource_group_name = "infra-rg-001"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      env        = "dev"
      managed_by = "Terraform"
      owner      = "mukesh_kumar"
    }
  }
  "pip2" = {
    name                = "Infra-pip-002"
    location            = "centralindia"
    resource_group_name = "infra-rg-001"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      env        = "dev"
      managed_by = "Terraform"
      owner      = "mukesh_kumar"
    }
  }
}

nics = {
  vm001 = {
    nic_name = "frontend-nic-0001"
    location = "centralindia"
    rg_name  = "infra-rg-001"
    ip_configuration = {
      subnet_name = "frontend-subnet"
      vnet_name   = "infravnet001"
      pip_name    = "Infra-pip-001"
    }
    tags = {
      env        = "dev"
      managed_by = "Terraform"
      owner      = "mukesh_kumar"
    }
  }

  vm002 = {
    nic_name = "backend-nic-0001"
    location = "centralindia"
    rg_name  = "infra-rg-001"
    ip_configuration = {
      subnet_name = "backend-subnet"
      vnet_name   = "infravnet001"
      pip_name    = "Infra-pip-002"
    }
    tags = {
      env        = "dev"
      managed_by = "Terraform"
      owner      = "mukesh_kumar"
    }
  }
}


vms = {}


key_vaults = {
  k1 = {
    name                        = "devinfra-kv-001"
    location                    = "centralindia"
    resource_group_name         = "infra-rg-001"
    enabled_for_disk_encryption = true
    tenant_id                   = "cffcc9a9-94fe-4afc-9989-213fb9f99086"
    soft_delete_retention_days  = 7
    purge_protection_enabled    = true
    sku_name                    = "standard"
    access_policies = {
      a1 = {
        tenant_id = "cffcc9a9-94fe-4afc-9989-213fb9f99086"
        object_id = "752d426a-c3e1-478e-bfaa-6fc8b5d611f2"

        key_permissions     = ["Get"]
        secret_permissions  = ["Get"]
        storage_permissions = ["Get"]
      }
    }
  }
}

# secrets = {
#   secret1 = {
#     name                = "admin1234"
#     value               = "P@ssword1234"
#     key_vault_name      = "devinfra-kv-001"
#     resource_group_name = "infra-rg-001"
#   }
#   secret2 = {
#     name                = "admin1234"
#     value               = "P@ssword1234"
#     key_vault_name      = "devinfra-kv-001"
#     resource_group_name = "infra-rg-001"
#   }
# }

bastions = {
  bastion1 = {
    name                = "dev-bastion-001"
    location            = "centralindia"
    resource_group_name = "infra-rg-001"
    ip_configuration = {
      subnet_name = "bastion-subnet"
      vnet_name   = "infravnet001"
      pip_name    = "Infra-pip-001"
    }
    tags = {
      env        = "dev"
      managed_by = "Terraform"
      owner      = "mukesh_kumar"
    }
  }
}
