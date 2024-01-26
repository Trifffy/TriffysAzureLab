# Manage template specs with PowerShell

New-AzTemplateSpec -Name 'CreateVM' -Version 0.1 -ResourceGroupName 'RG-TemplateSpecs' -Location 'northeurope' `
-TemplateFile 'C:\Users\jtrifonov\OneDrive - KPMG\Documents\Learning\Biceps\VM\VM.bicep'

Set-AzTemplateSpec -Name 'CreateVM' -Version 1.2 -ResourceGroupName 'RG-TemplateSpecs' -Location 'northeurope' `
-TemplateFile 'C:\Users\Triffy\Documents\PowerShellShit\TriffysAzureLab\Biceps\VM\main.bicep' `
-UIFormDefinitionFile 'C:\Users\Triffy\Documents\PowerShellShit\TriffysAzureLab\Biceps\VM\uiFormDefinition.json'