[![Build Status](https://sdxcloud.visualstudio.com/IST.GLB.GLB.GCCC_IMCSL/_apis/build/status%2FCSL.Storage_Account.AZ?repoName=CSL.Storage_Account.AZ&branchName=develop)](https://sdxcloud.visualstudio.com/IST.GLB.GLB.GCCC_IMCSL/_build/latest?definitionId=3931&repoName=CSL.Storage_Account.AZ&branchName=develop)
[![Build Status](https://sdxcloud.visualstudio.com/IST.GLB.GLB.GCCC_IMCSL/_apis/build/status%2FCSL.Storage_Account.AZ?repoName=CSL.Storage_Account.AZ&branchName=main)](https://sdxcloud.visualstudio.com/IST.GLB.GLB.GCCC_IMCSL/_build/latest?definitionId=3931&repoName=CSL.Storage_Account.AZ&branchName=main)

# Table of Contents

<!-- toc -->

- [Introduction](#introduction)
- [Requirements](#requirements)
- [Documentation notice ](#documentation-notice)
- [How to use IMCSL Storage](#how-to-use-imcsl)
- [Contributions are welcome](#contributions-are-welcome)

<!-- tocstop -->


# Introduction

The CSL Storage Account library aims to achieve the following objectives:
* Standardization: By providing a centralized repository, we ensure that all Storage Accounts deployed within the organization follow predefined standards and configurations.
* Rapid Deployment: Leveraging the CSL Storage Account project, users can quickly deploy new Storage Accounts, eliminating the need to start from scratch for each deployment...
* Compliance and Security: The CSL Storage Account aligns with Sodexo's security regulations (AZ-RQ)...


Cloud Shared Library deploys a Storage Account with :
- [X] Encryption with Customer Managed Key (CMK)
- [X] Private Endpoint (optional)
- [X] Service Endpoint (optional)
- [X] File share  (optional)



#### Repository : [CSL.Storage_Account.AZ](https://dev.azure.com/sdxcloud/IST.GLB.GLB.GCCC_IMCSL/_git/CSL.Storage_Account.AZ)
#### Last artifact :  [![CSL.Storage_Account.AZ package in IMCSL feed in Azure Artifacts](https://feeds.dev.azure.com/sdxcloud/_apis/public/Packaging/Feeds/IMCSL/Packages/8d44407e-c420-4202-9dfb-bb2201ffc6a3/Badge)](https://dev.azure.com/sdxcloud/IST.GLB.GLB.GCCC_IMCSL/_artifacts/feed/IMCSL/NuGet/CSL.Storage_Account.AZ?preferRelease=true)
> Notice: Don't hesitate to fork the repository to start to collaborate with us improving the CSL VM via Pull Requests

[Back to ToC](#table-of-contents)




# Requirements
In order to use the CSL Storage Account, you need to have the following prerequisites:
 * Azure Keyvault Premium with Purge Protection enabled
 * The following packages installed in your environment:

| Name                                                                               | Version
|------------------------------------------------------------------------------------|-----|
| <a name="requirement_bicep"></a> [bicep](#requirement\_bicep)	                     | latest|
| <a name="requirement_powershell"></a> [powershell core](#requirement\_powershell)	 | =7.3.4|
| <a name="requirement_azcli"></a> [azcli](#requirement\_azcli)	                     | =2.38|
| <a name="requirement_Az Module"></a> [azmodule](#requirement\_azmodule)	            | =5.9.0|

[Back to ToC](#table-of-contents)


## Features & Parameters

| Parameter                                | Description                                                                                                                                                                   | **Type**      | **Mandatory** | Accepted values                                                                                                                    | Example                                                                                                                                                                                                          |
|------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------|---------------|------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `projectName`                            | Display Name of the project for logs                                                                                                                                          | **String**    | **Yes**       | Any valid string                                                                                                                   | "CSL-Project"                                                                                                                                                                                                    |
| `subscriptionName`                       | Name of the Azure subscription                                                                                                                                                | **String**    | **Yes**       | Any valid subscription Name                                                                                                        | "SDX DEV/TEST"                                                                                                                                                                                                   |
| `resourceGroupName`                      | Name of the resource group                                                                                                                                                    | **String**    | **Yes**       | Any valid resource group Name                                                                                                      | "IST-GLB-IENO-CSL-DEV-RG01"                                                                                                                                                                                      |
| `storageAccountName`                     | Name of the Azure storage account                                                                                                                                             | **String**    | **No**        | Any valid storage account name                                                                                                     | aziest1hje871                                                                                                                                                                                                    |
| `location`                               | Azure location for the KeyVault                                                                                                                                               | **String**    | **Yes**       | Any valid Azure region                                                                                                             | "northeurope"                                                                                                                                                                                                    |
| `encryptionKeyVaultId`                   | KeyVaultId for the storage account encryption                                                                                                                                 | **String**    | **Yes**       | Any valid keyvault resource ID                                                                                                     | /subscriptions/c0978b9d-b809-45f4-aa76-391ceb2cfdba/resourceGroups/IST-GLB-IENO-CSL-DEV-RG01/providers/Microsoft.KeyVault/vaults/azieks1esr168                                                                   |
| `storageAccountSku`                      | Sku of the Storage Account                                                                                                                                                    | **String**    | **Yes**       | "Premium_LRS", "Premium_ZRS", "Standard_GRS", "Standard_GZRS", "Standard_LRS", "Standard_RAGRS", "Standard_RAGZRS", "Standard_ZRS" | "Standard_LRS"                                                                                                                                                                                                   |
| `storageAccountKind `                    | Kind of the Storage Account                                                                                                                                                   | **String**    | **Yes**       | "BlobStorage", "BlockBlobStorage", "FileStorage", "Storage", "StorageV2"                                                           | StorageV2                                                                                                                                                                                                        |
| `accessTier`                             | Tier of the Storage Account. Required for storage accounts where kind = BlobStorage. The access tier is used for billing                                                      | **String**    | **Yes**       | "Cool", "Hot", "Premium"                                                                                                           | "Cool"                                                                                                                                                                                                           |
| `fileShares`                             | Allows you to create storage shares with the StorageV2 or FileStorage kind.                                                                                                   | **Array**     | **No**       | Any valid Array                                                                                                                    |
| `enableLargeFileShare`                   | To enable large file sharing on your storage account, only for kind : StorageV2.                                                                                              | **Bool**      | **No**       | "True", "False"	                                                                                                                   |
| `enableImmutability`                     | To enable object level immutability for all the new containers in the account by default. The property is immutable and can only be set to true at the account creation time. | **Bool**      | **No**       | "True", "False"	                                                                                                                   |	
| `immutabilityPeriodSinceCreationInDays`  | The immutability period for the blobs in the container since the policy creation, in days                                                                                     | **Int**       | **No**       | Any valid int value in days                                                                                                        |		
| `networkConfiguration`                   | Configuration for network-related settings                                                                                                                                    | **Hashtable** | **Yes**       | Object with either `serviceEndpoint` **OR** `privateEndpoint` properties.                                                          | See sub-parameters below                                                                                                                                                                                         |
| └─ `serviceEndpoint.subnetResourceIds`   | Array of subnet resource IDs linked to the service endpoint                                                                                                                   | **Array**     | **Yes**       | Array of valid Subnets resource IDs                                                                                                | @("subnetId1", "subnetId2")                                                                                                                                                                                      |
| └─ `privateEndpoint.privateEndpointName` | Name of the private endpoint                                                                                                                                                  | **String**    | **No**        | Any valid Private Endpoint Name                                                                                                    | "aziepe1hje861"                                                                                                                                                                                                  |
| └─ `privateEndpoint.targetSubResource`   | Target sub-resource of the private Endpoint of associated storage account                                                                                                     | **Type**      | **Yes**       | "blob", "dfs", "file", "queue", "table", "web"                                                                                     | "blob"                                                                                                                                                                                                           |
| └─ `privateEndpoint.subnetResourceId`    | Resource ID of the subnet linked to the private endpoint                                                                                                                      | **String**    | **Yes**       | Any valid private Endpoint subnet resource ID                                                                                      | "/subscriptions/ebc805fb-95d6-402e-b4bb-6d054fda9e79/resourceGroups/GLB-GLB-IENO-CSLBUILD-PRD-RG01/providers/Microsoft.Network/virtualNetworks/GLB.GLB.IENO.CSLTST.PRD.VN01/subnets/GLB.GLB.IENO.CSLVM.PRD.SN01" |
| `enableVDI`                              | Flag to enable for VDI. If set to true, parameter vdiKeyVaultId is required: a kerberos key will be generated from the storage account and set in this keyVault               | **Bool**      | **No**       | "True", "False"	                                                                                                                   | $true                                                                                                                                                                                                            |
| `vdiKeyVaultId`                          | Resource ID of the keyvault where to store the kerberos key generated for VDI                                                                                                 | **String**    | **No** | Any valid keyvault resource ID                                                                                                     | "/subscriptions/c0978b9d-b809-45f4-aa76-391ceb2cfdba/resourceGroups/IST-GLB-IENO-CSL-DEV-RG01/providers/Microsoft.KeyVault/vaults/azieks1esr168"                                                                 |
| `tags`                                   | List of key value pairs that describe the resource                                                                                                                            | **Hashtable** | **No**        | Any valid list of key/value pairs                                                                                                  | "Cool"                                                                                                                                                                                                     |      










# AZRQ

#### AZRQ Policies: https://sdxcloud.visualstudio.com/IST.GLB.GLB.GCCC_IMCSL/_git/CSL.Storage_Account.AZ?path=/Tests%20%26%20Compliance/Compliance/Azure%20Initiative/definitions
#### AZRQ Tests: https://sdxcloud.visualstudio.com/IST.GLB.GLB.GCCC_IMCSL/_git/CSL.Storage_Account.AZ?path=/Tests%20%26%20Compliance/Integration%20Tests/AZRQ

# How to use IMCSL Storage Account

## Using IMCSL Storage Account in Azure DevOps

```
#Yaml Pipeline example

trigger: none

pool: 'Replace_with_Your_Pool_Name'

variables:
- name: storageCslName
  value: "CSL.Storage_Account.AZ"


jobs:
  - job: UseCSLST
    displayName: Use CSL Storage Account
    
    steps:
    - checkout: self
      path: $(Build.Repository.Name)

    # Download STorage account artifact from IMCSL feed
    - task: DownloadPackage@1
      displayName: 'Download CSL Artifact ${{ variables.storageCslName }}'
      inputs:
        packageType: 'nuget'
        feed: '/22c003e2-e5e3-4c47-bb62-11649d82c74b'
        view: 'Release'
        definition: '${{ variables.storageCslName }}'
        version: 'latest'
        downloadPath: '$(System.DefaultWorkingDirectory)/${{ variables.storageCslName }}'

    # Execute powershell script who contains project contexte parameters and call IMCSL function. Don't forget declare $(System.AccessToken) in environment variable because you need it for download library from azure devops feed.
    - task: PowerShell@2
      inputs:
        filePath: '$(System.DefaultWorkingDirectory)/storageAccount.ps1'
        pwsh: true
        workingDirectory: '$(System.DefaultWorkingDirectory)'
      env:
        SYSTEM_ACCESSTOKEN: $(System.AccessToken)
```

## Local Usage
```
# Download the module from IMCSL Azure DevOps Feed : sdxcloud/IMCSL, sodexo-brs/GCCC_IMCSL
# Configure IMCSL Environment variables :
$Env:IMCSL_AZURE_DEVOPS_PAT = "PAT"
#User authentification
$Env:IMCSL_AZURE_IDENTITY = "User"
$Env:IMCSL_AZURE_DEVOPS_USER = "<YOUR USER>"

#SPN authentification
$Env:IMCSL_AZURE_IDENTITY = "SPN"
$Env:IMCSL_SERVICE_PRINCIPAL_ID = "<YOUR SERVICE PRINCIPAL ID>"
$Env:IMCSL_SERVICE_PRINCIPAL_SECRET = "<YOUR SERVICE PRINCIPAL SECRET>"
$Env:IMCSL_TENANT_ID = "<TENANT ID>"

#Create IMCSL Storage configuration    
$Config = @{
 ...
}

#Invoke KeyVault IMCSL using the function Invoke-KVIMCSL :
Invoke-IMCSLST -Configuration $Config

```

[Back to ToC](#table-of-contents)

## Lifecycle management & Idempotence

In order to manage all the lifecycle of Azure Storage Account and to provide an idempotent library, CSL Storage Account is designed to create, update and delete the Azure Storage Account.
- **Creation and Update** :
 'Invoke-IMCSLST' function : For the first execution, the library will create the Azure Storage Account, but after the first successful execution, the library handle the update of the Storage Account resource (If the configuration changed)

- **Delete**: 
'Remove-IMCSLST' function: Will remove the Azure Storage Account

## Configuration Example
Below is an example of a PowerShell script that imports and use the IMCSL Storage Account module :

```
Import-Module "$PSScriptRoot/CSL.Storage_Account.AZ/CSL.Storage_Account.AZ.psm1"

try
    {
        ################################
        #      GLOBAL PWSH CONFIG         #
        ################################
        $ErrorActionPreference = "Stop"
        $ErrorView = "NormalView"
        
        #Storage Account Premium_ZRS configured with service Endpoint
        $StorageAccountConfig1 = @{
            projectName = "CSL-Project"
            subscriptionName = "SDX DEV/TEST"
            resourceGroupName = "IST-GLB-IENO-CSL-DEV-RG01"
            encryptionKeyVaultId = "/subscriptions/c0978b9d-b809-45f4-aa76-391ceb2cfdba/resourceGroups/IST-GLB-IENO-CSL-DEV-RG01/providers/Microsoft.KeyVault/vaults/azieks1esr168"
            location = "northeurope"
            storageAccountSku = "Premium_ZRS" 
            storageAccountKind = "StorageV2" 
            accessTier = "Cool"
            enableImmutability = $true
            immutabilityPeriodSinceCreationInDays = 180 
            share = @(
                @{
                    sharename = "share01"
                    accesstier = "Hot"
                    shareQuota = 5120
                    enabledProtocols = "SMB"
                },
                @{
                sharename = "share02"
                accesstier = "TransactionOptimized"
                shareQuota = 5120
                enabledProtocols = "SMB"
                }
            
                
            )
            networkConfiguration = @{
                serviceEndpoint = @{
                    subnetResourceIds = @(
                    "/subscriptions/ebc805fb-95d6-402e-b4bb-6d054fda9e79/resourceGroups/GLB-GLB-IENO-CSLBUILD-PRD-RG01/providers/Microsoft.Network/virtualNetworks/GLB.GLB.IENO.CSLTST.PRD.VN01/subnets/GLB.GLB.IENO.CSLVM.PRD.SN01",
                    "/subscriptions/ebc805fb-95d6-402e-b4bb-6d054fda9e79/resourceGroups/GLB-GLB-IENO-CSLBUILD-PRD-RG01/providers/Microsoft.Network/virtualNetworks/GLB.GLB.IENO.CSLTST.PRD.VN01/subnets/GLB.GLB.IENO.CSLAGW.PRD.SN01"
                    )
                }
            }
        }
        
        #Storage Account Standard_LRS configured with Private Endpoint
        $StorageAccountConfig2 = @{
            ##################-Mandatory parameters-##################
            projectName = "CSL-Project"
            subscriptionName = "SDX DEV/TEST"
            resourceGroupName = "IST-GLB-IENO-CSL-DEV-RG01"
            encryptionKeyVaultId = "/subscriptions/c0978b9d-b809-45f4-aa76-391ceb2cfdba/resourceGroups/IST-GLB-IENO-CSL-DEV-RG01/providers/Microsoft.KeyVault/vaults/azieks1esr168"
            location = "northeurope"
    
            storageAccountSku = "Standard_LRS" 
            storageAccountKind = "StorageV2" 
            accessTier = "Cool"
            networkConfiguration = @{
                privateEndpoint = @{
                    #privateEndpointName = "aziepe1hje861"
                    subnetResourceId = "/subscriptions/ebc805fb-95d6-402e-b4bb-6d054fda9e79/resourceGroups/GLB-GLB-IENO-CSLBUILD-PRD-RG01/providers/Microsoft.Network/virtualNetworks/GLB.GLB.IENO.CSLTST.PRD.VN01/subnets/GLB.GLB.IENO.CSLPVT.PRD.SN01" 
                }
            }
        }
        
        Invoke-IMCSLST -Configuration $StorageAccountConfig1
        Invoke-IMCSLST -Configuration $StorageAccountConfig2
        
                
    }
    catch
    {
        Write-Error   "$( $_.Exception ) $( $_.ScriptStackTrace )"
    }
          
        
 ```       
> Check the complete working example : ``.example.ps1``

     
# Contributions are welcome

**Do you want to become a CSL Contributor ? Here is the Process you should follow !**

[![image.png](Documentation/images/contribution.png)](https://sdxcloud.visualstudio.com/IST.GLB.GLB.GCCC_IMCSL/_wiki/wikis/IST.GLB.GLB.GCCC_IMCSL.wiki/5598/Contribution-Process)

**Here is the Global process of contributions with the 3 possible use cases :**

![image.png](Documentation/images/Items.png)

[Back to ToC](#table-of-contents)


