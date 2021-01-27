terraform {
  required_providers {
    tfe = {
      version = "~> 0.24.0"
    }
  }
}
provider "tfe" {
  token    = var.tfe_token
  version  = "~> 0.15.0"
}