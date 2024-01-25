# Azure bicep deployment
Connect-AzAccount
Import-Module Az.Resources

# Create resource group with subscription deployment
New-AzSubscriptionDeployment -Name "TestRGDployment" -Location "northeurope" `
-TemplateParameterFile 'C:\Users\jtrifonov\OneDrive - KPMG\Documents\Learning\Biceps\VM\config.bicepparam'

# Use resource group deployment
New-AzResourceGroupDeployment -Name 'BicepTest01' -ResourceGroupName 'RG-BicepTest' `
-TemplateParameterFile 'C:\Users\jtrifonov\OneDrive - KPMG\Documents\Learning\Biceps\VM\config.bicepparam'

# Use deployment stack
New-AzSubscriptionDeploymentStack -Name "StacksTest01" -Location 'northeurope' `
-TemplateParameterFile 'C:\Users\jtrifonov\OneDrive - KPMG\Documents\Learning\Biceps\VM\config.bicepparam' `
-DenySettingsMode 'none'

# Update subscription deployment stack
Set-AzSubscriptionDeploymentStack -Name "StacksTest01" -Location  'northeurope' `
-TemplateParameterFile 'C:\Users\jtrifonov\OneDrive - KPMG\Documents\Learning\Biceps\VM\config.bicepparam' `
-DenySettingsMode 'none'

# Delete deployment stack
Remove-AzSubscriptionDeploymentStack -Name "StacksTest01" -DeleteAll
