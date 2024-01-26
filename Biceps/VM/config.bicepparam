using './deployVMasModule.bicep'

@description('Name of the resource group')
param rgName = 'RG-StacksTest'

@description('Location for the resource group')
param rgLocation = 'northeurope'

@description('Name of the virtual machine.')
param vmName = 'testbicepdeployment01'

@description('Username for the Virtual Machine.')
param adminUsername = 'Triffy'

@description('Name of key vault where VM password is stored')
param keyVaultName = 'TriffyMainVault'

@description('The Windows version for the VM. This will pick a fully patched image of this given Windows version.')
param OSVersion = 'win11-22h2-pro'

@description('Name of the resource group where the VNET and subnet are located')
param networkRG = 'RG-Network'

@description('Name of the VNET which is the parent of the subnet to which the VM will connect to')
param virtualNetworkName = 'VNET-Main'

@description('Name of the subnet to which the VM will be connected')
param subnetName = 'VirtualMachines'
