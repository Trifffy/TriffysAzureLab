@description('Name of the key vault where the admin password will be stored')
@allowed([
  'TriffyMainVault'
])
param keyVaultName string = 'TriffyMainVault'

@description('Key vault secret name')
param keyVaultSecretName string

@description('Password for the Virtual Machine.')
@minLength(12)
@secure()
param adminPassword string

resource keyVault 'Microsoft.KeyVault/vaults@2023-07-01' existing = {
  name: keyVaultName
}

resource keyVaultSecret 'Microsoft.KeyVault/vaults/secrets@2023-07-01' = {
  name: keyVaultSecretName
  parent: keyVault
  properties: {
    value: adminPassword
  }
}
