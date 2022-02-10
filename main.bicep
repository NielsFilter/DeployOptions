param app_environment_name string = 'deploy-app-environment'
param log_analytics_workspace_name string = 'deploy-workspace'

resource log_analytics_workspace 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: log_analytics_workspace_name
  location: 'eastus'
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
    workspaceCapping: {}
  }
}

resource app_environment 'Microsoft.Web/kubeenvironments@2021-02-01' = {
  name: app_environment_name
  location: 'northeurope'
  kind: 'containerenvironment'
  properties: {
    type: 'managed'
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: log_analytics_workspace.properties.customerId
        sharedKey: log_analytics_workspace.listKeys().primarySharedKey
      }
    }
  }
}

// resource luckynum_app 'Microsoft.Web/containerapps@2021-03-01' = {
//   name: luckynum_name
//   kind: 'containerapps'
//   location: 'northeurope'
//   properties: {
//     kubeEnvironmentId: app_environment.id
//     configuration: {
//       ingress: {
//         'external': false
//         'targetPort': luckynum_port
//       }
//     }
//     template: {
//       containers: [
//         {
//           image: luckynum_image
//           name: luckynum_name
//           resources: {
//             cpu: '0.5'
//             memory: '1Gi'
//           }
//         }
//       ]
//       scale: {
//         minReplicas: 0
//         maxReplicas: 2
//       }
//     }
//   }
// }

// resource webapi_app 'Microsoft.Web/containerapps@2021-03-01' = {
//   name: webapi_name
//   kind: 'containerapps'
//   location: 'northeurope'
//   properties: {
//     kubeEnvironmentId: app_environment.id
//     configuration: {
//       ingress: {
//         'external': true
//         'targetPort': webapi_port
//       }
//     }
//     template: {
//       containers: [
//         {
//           image: webapi_image
//           name: webapi_name
//           resources: {
//             cpu: '0.5'
//             memory: '1Gi'
//           }
//         }
//       ]
//       scale: {
//         minReplicas: 0
//         maxReplicas: 2
//       }
//       env: [
//         {
//           name: 'LuckyNumberService:ApiUrl'
//           value: 'https://${luckynum_app.properties.configuration.ingress.fqdn}/' 
//         }
//       ]
//     }
//   }
// }

// resource angular_app 'Microsoft.Web/containerapps@2021-03-01' = {
//   name: angular_name
//   kind: 'containerapps'
//   location: 'northeurope'
//   properties: {
//     kubeEnvironmentId: app_environment.id
//     configuration: {
//       ingress: {
//         'external': true
//         'targetPort': angular_port
//       }
//     }
//     template: {
//       containers: [
//         {
//           image: angular_image
//           name: angular_name
//           resources: {
//             cpu: '0.5'
//             memory: '1Gi'
//           }
//         }
//       ]
//       scale: {
//         minReplicas: 0
//         maxReplicas: 2
//       }
//       env: [
//         {
//           name: 'API_URL'
//           value: 'https://${webapi_app.properties.configuration.ingress.fqdn}/' 
//         }
//       ]
//     }
//   }
// }
