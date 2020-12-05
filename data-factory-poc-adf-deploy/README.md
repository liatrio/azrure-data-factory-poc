# Introduction 

This repository is a supporting character in Azure Data Factory Automation. It contains Azure Pipelines Automation and PowerShell that facilitate
automation in a couple different ways. This README also contains a breakdown on two approaches: Azure Pipelines Deploy Jobs and Release Jobs. 

## The Options

The full process is based on [MSFT Docs - Data Factory CICD](https://docs.microsoft.com/en-us/azure/data-factory/continuous-integration-deployment).
Both options would occur after the ADF pipeline is published.  

### Azure Pipelines Deployment Jobs and GitOps

This method allows for everything to be _as-code_ and for a similar GitOps style process to that of the Terraform deployment process. This repository does
not have GitOps enabled. There are some implementation details will vary depending on specifics but this repo has an `azure-pipelines.yml` with a job
that would act as a starting point. 

This pipeline uses an [Azure Pipelines Deployment Job](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/deployment-jobs) 
and the [Azure Resource Group Deployment Task](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/deploy/azure-resource-group-deployment). 
This does require a newer version of Azure DevOps but is a option. 

Parameters in this process are stored alongside the automation. There is an `environments` repository that contains an `ARMTemplateParametersForFactory.nonprod.json`.
You can build one per environment for environment-specific parameters. The goal is to have as few as possible but if it is necessary this provides a
mechanism to do this. You can break the deployment job into a template and pass in the environment based on the branch name. 

### Release Pipelines

This is the method that is spelled out in the MSFT docs. You can see it 
[here on MSFT docs](https://docs.microsoft.com/en-us/azure/data-factory/continuous-integration-deployment#automate-continuous-integration-by-using-azure-pipelines-releases). 
This is the method we used during our presentation since it most matches what is available today. 

## ARM Pre/Post PowerShell 

There is a supporting PowerShell script that is used during the pipeline and would be required for either option. More documentation is available on
the MSFT Docs found at the [bottom of the ADF CICD page](https://docs.microsoft.com/en-us/azure/data-factory/continuous-integration-deployment#script).

Two important features of this script for the sample workflow:

* stopping and starting triggers for deployment since can't make any changes to active triggers in ADF
* Manages deleting any resources that are no longer in an ARM template. 
  * Rogue resources and resources that were once in an ARM template but have been removed. 
  * This is attempting to be a sort of "state management" approach.
