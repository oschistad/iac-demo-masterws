variable "tfe_orgname" {
  default = "aztekdemo"
}

variable "subscription_id" {}
variable "client_id" {}
variable "tenant_id" {}
variable "client_secret" {}
variable "tfe_token" {}
variable "github_oauth_token" {}

locals {
  tfe_vars = {
    "subscription_id" = { "value" = var.subscription_id, "sensitive" = true }
    "client_id" = { "value" = var.client_id, "sensitive" = true  }
    "client_secret" = { "value" = var.client_secret, "sensitive" = true  }
    "tenant_id" = { "value" = var.tenant_id, "sensitive" = true  }
    "tfe_token" = { "value" = var.tfe_token, "sensitive" = true  }
    "github_oauth_token" = { "value" = var.github_oauth_token, "sensitive" = true  }
  }
  infra_vars = {}
}
resource "tfe_workspace" "infrastructure" {
  name = "infrastructure"
  organization = var.tfe_orgname
}

resource "tfe_workspace" "service" {
  name = "service"
  organization = var.tfe_orgname
}

resource "tfe_variable" "infra_vars" {
  for_each = join( local.tfe_vars, local.infra_vars)
  category = "terraform"
  key = each.key
  value = each.value
  workspace_id = tfe_workspace.infrastructure.id
}