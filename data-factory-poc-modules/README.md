# data-factory-poc-modules

This repository contains Terraform code to spin up an Azure Data Factory (ADF) instance and its prerequisites. It contains the [Terraform](https://terraform.io)
code that will be consumed in the `data-factory-poc-live` repository.

## Directory Structure

### Modules

There are 5 modules inside of here. The are as follows:

```
├── data-factory
├── key-vault
├── sql
├── storage-account
└── storage-container
```

These 5 modules make of the requirements to create an ADF instance. These modules will be orchestrated and applied using Terragrunt in the
`data-factory-poc-live` repository. There will be common files in each module including:

* `main.tf`       - Terraform code for the resource
* `variables.tf`  - [Variables](https://www.terraform.io/docs/configuration/variables.html) for the Module
* `outputs.tf`    - [Outputs](https://www.terraform.io/docs/configuration/variables.html) are values that will be available after a module has been applied

These are commonplace in Terraform and the [documentation](https://www.terraform.io/docs/index.html) is quite helpful if you're new to Terraform.
Modules can contain extra Terraform files (`*.tf`) if the `main.tf` file was getting too large. Breaking out Terraform code can help to keep the
configuration code easy to understand and maintain.

### Other Files

There are other supporting files in the repository:

```
├── Makefile
├── data
│   └── 1.csv
├── sql
│   └── init.sql
```

* `Makefile` contains scripts to help local development. This isn't required in production/pipeline automation
* `data/` contains data to be used in example
* `sql/init.sql` contains sql code for setting up the database for the example workflow

## Requirements

### Run/Deploy

* [Terraform](https://www.terraform.io/downloads.html)

### Local Development

* [Docker](https://docs.docker.com/get-docker/)
* `make`
* Standard dev tools (Git, Editor/IDE, etc)
