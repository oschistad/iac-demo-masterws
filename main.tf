variable "tfe_orgname" {
  default = "aztekdemo"
}


locals {
  tfe_vars = {
    "subscription_id" = { "value" = var.subscription_id, "sensitive" = true }
    "client_id" = { "value" = var.client_id, "sensitive" = true  }
    "client_secret" = { "value" = var.client_secret, "sensitive" = true  }
    "tenant_id" = { "value" = var.tenant_id, "sensitive" = true  }
    "github_oauth_token_id" = { "value" = var.github_oauth_token_id, "sensitive" = false  }
  }
  infra_vars = {}
  service_vars = {}
}
variable "repo_identifier_infra" {
  default = "oschistad/iac-demo-infrastructure"
}
variable "repo_identifier_service" {
  default = "oschistad/iac-demo-service"
}
resource "tfe_workspace" "infrastructure" {
  name = "infrastructure"
  organization = var.tfe_orgname
  vcs_repo {
    identifier = var.repo_identifier_infra
    oauth_token_id = var.github_oauth_token_id
  }
}

resource "tfe_workspace" "service" {
  name = "service"
  organization = var.tfe_orgname
}

resource "tfe_variable" "infra_tfe_vars" {
  for_each =local.tfe_vars
  category = "terraform"
  key = each.key
  value = each.value
  workspace_id = tfe_workspace.infrastructure.id
}

resource "tfe_variable" "service_tfe_vars" {
  for_each = local.tfe_vars
  category = "terraform"
  key = each.key
  value = each.value
  workspace_id = tfe_workspace.service.id
}
