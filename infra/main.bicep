@description('Project short name used for resource names')
param projectName string = 'azureproject'

@description('Deployment environment tag (dev/stg/prod)')
param env string = 'dev'

@description('Azure location for deployment')
param location string = resourceGroup().location

// Use prefix for naming consistency
var namePrefix = '${projectName}-${env}'

// ----------------------
// Cosmos DB (Serverless)
// ----------------------
resource cosmos 'Microsoft.DocumentDB/databaseAccounts@2024-05-15' = {
  name: '${namePrefix}-cosmos'
  location: location
  kind: 'GlobalDocumentDB'
  properties: {
    databaseAccountOfferType: 'Standard'
    enableFreeTier: true
    capabilities: [
      { name: 'EnableServerless' }
    ]
    locations: [
      {
        locationName: location
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
  }
}

// ----------------------
// Static Web App
// ----------------------
resource swa 'Microsoft.Web/staticSites@2023-12-01' = {
  name: '${namePrefix}-swa'
  location: 'Central India'
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    repositoryUrl: 'https://github.com/Muktaholkar/azure-cloud-project'
    branch: 'main'
    buildProperties: {
      appLocation: 'app'
      apiLocation: 'api'
      outputLocation: 'dist'
    }
  }
}

// ----------------------
// Application Insights
// ----------------------
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: '${namePrefix}-appi'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

// ----------------------
// Outputs
// ----------------------
@description('Static Web App hostname')
output staticWebAppHostname string = swa.properties.defaultHostname

@description('Cosmos DB Account Name')
output cosmosDbAccountName string = cosmos.name

@description('Application Insights Name')
output appInsightsName string = appInsights.name
