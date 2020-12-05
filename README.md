# Data Factory Automation Example - Liatrio POC2

This repository contains all of the code that was used for POC2. There are for repositories and each repository has been stored in this repository as
a directory. 

## Repositories

The repositories have been sanitized a bit. We tried to make it easy for you to find what needs to be done in code. Search for

```
<<TODO: 
```

and you'll find all of the places that need to be updated. Here's an example:

```
subscription?="<<TODO: enter subscription here>>"
```

### data-factory-poc-modules

This directory contains the Terraform modules that create the resources for Data factory. Not many changes in this repo. You would want to add some
testing/validation in the pipeline and potentially break each module out into it's own repo. This repo follows a standard branching strategy (main/master, etc)

### data-factory-poc-live

This directory contains the Terragrunt and supporting files that will deploy the Terraform from `data-factory-poc-modules`. This repo's branches 
should be one per environment

### data-factory-poc-adf

This directory contains our example data factory pipeline. To get this working, set up ADF and connect with this repo. You'll want to use the ADF
publish feature to get the remainder of the arm templates needed for this to work. 

### data-factory-poc-adf-deploy

This directory contains the automation and scripts that support the promotion of Data Factory Arm Templates. This repository can be set up with
environment based branches. Both Deployment jobs in yaml and classic Release Pipelines will benefit from this information.

## Contributors

Eric Chapman, Principal DevOps Engineer 
Ryan Vance, Sr. DevOps Engineer 
[Justin Bankes](https://github.com/jbankes), Sr. DevOps Engineer 
Michael Parker, Sr. DevOps Engineer 

[Liatrio](https://www.liatrio.com)
