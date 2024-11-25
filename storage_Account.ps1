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
