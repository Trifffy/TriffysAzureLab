targetScope = 'subscription'

@description('Name of the resource group')
@minLength(4)
param rgName string

@description('Location for the resource group')
@allowed([
  'northeurope'
  'westeurope'
])
param rgLocation string

@description('Username for the Virtual Machine.')
param adminUsername string

@description('Name of key vault where VM password is stored')
param keyVaultName string

@description('Allocation method for the Public IP used to access the Virtual Machine.')
@allowed([
  'Dynamic'
  'Static'
])
param publicIPAllocationMethod string = 'Dynamic'

@description('SKU for the Public IP used to access the Virtual Machine.')
@allowed([
  'Basic'
  'Standard'
])
param publicIpSku string = 'Basic'

@description('The Windows version for the VM. This will pick a fully patched image of this given Windows version.')
@allowed([
  '2022-datacenter-azure-edition'
  '2022-datacenter-azure-edition-core'
  '2022-datacenter-azure-edition-core-smalldisk'
  '2022-datacenter-azure-edition-smalldisk'
  '2022-datacenter-core-g2'
  '2022-datacenter-core-smalldisk-g2'
  '2022-datacenter-g2'
  '2022-datacenter-smalldisk-g2'
  'win11-22h2-pro'
])
param OSVersion string

@description('Size of the virtual machine.')
@allowed([
  'Standard_D2s_v3'
  'Standard_D4s_v3'
  'Standard_D8s_v3'
])
param vmSize string = 'Standard_D4s_v3'

@description('Location for all resources.')
param vmLocation string = rgLocation

@description('Name of the virtual machine.')
param vmName string

@description('Name of the resource group where the VNET and subnet are located')
param networkRG string

@description('Name of the VNET which is the parent of the subnet to which the VM will connect to')
param virtualNetworkName string

@description('Name of the subnet to which the VM will be connected')
param subnetName string

resource deploymentRG 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: rgName
  location: rgLocation
}

resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' existing = {
  name: keyVaultName
  scope: resourceGroup('RG-Management')
}

module VM './VM.bicep' = {
  name: vmName
  scope: deploymentRG
  params: {
    vmName: vmName
    vmSize: vmSize
    location: vmLocation
    adminPassword: keyVault.getSecret('DefaultVMAdminPassword')
    adminUsername: adminUsername
    networkRG: networkRG
    OSVersion: OSVersion
    subnetName: subnetName
    virtualNetworkName: virtualNetworkName
    publicIpSku: publicIpSku
    publicIPAllocationMethod: publicIPAllocationMethod
  }
  dependsOn: [
#disable-next-line no-unnecessary-dependson
    deploymentRG
  ]
}
