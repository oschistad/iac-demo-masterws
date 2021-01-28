# iac-demo-masterws
## manage workspace creation and organization config in Terraform Cloud

This repository will create one or more daughter workspaces in Terraform Cloud, and copy the values of some key secrets and facts into workspace variables in these daughter workspaces.


The purpose of this repo is to maintain tne Organization config and implement a secure process by which the tokens necessary to integrate with GitHub and Azure are propagated without the need to handle them manually.

This workspace is expected to be managed by the [iac-demo](https://github.com/oschistad/iac-demo-setup) repository

## Why the nesting of workspaces?

Terraform workspaces represent a single atomic provisioning operation. While you can stick whatever you want in them, you should avoid grouping resources that follow different lifecycles as this makes things very hard to manage over time.

The two workspaces contained in this repo are two layers of a stack, where the intrastructure repo sets up the container scheduling environment, and the service workspace manages the containers and related resources. They are expected to live separate lives and have increasing cadence and entropy as we move up the stack.
