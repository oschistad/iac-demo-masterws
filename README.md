# iac-demo-masterws
## manage workspace creation and organization config in Terraform Cloud

This repository will create one or more daughter workspaces in Terraform Cloud, and copy the values of some key secrets and facts into workspace variables in these daughter workspaces.


The purpose of this repo is to maintain tne Organization config and implement a secure process by which the tokens necessary to integrate with GitHub and Azure are propagated without the need to handle them manually.

This workspace is expected to be managed by the [iac-demo](github.com/oschistad/iac-demo-setup) repository
