param location string = 'eastus'
param clusterName string = 'deploy-aks-cluster'

//param nodeCount int = 1
param vmSize string = 'standard_d2s_v3'


resource log_analytics_workspace 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: 'abasawtttw'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
    workspaceCapping: {}
  }
}





// resource aks 'Microsoft.ContainerService/managedClusters@2021-10-01' = {
//   name: clusterName
//   location: location
//   identity: {
//     type: 'SystemAssigned'
//   }
//   properties: {
//     dnsPrefix: clusterName
//     enableRBAC: true
//     agentPoolProfiles: [
//       {
//         name: 'agentpool'
//         count: 1
//         vmSize: vmSize
//         mode: 'System'
//         maxCount: 2
//         minCount: 1
//         enableAutoScaling: true
//       }
//     ]
//   }
// }
