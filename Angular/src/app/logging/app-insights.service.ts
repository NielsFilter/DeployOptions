import { ApplicationInsights } from '@microsoft/applicationinsights-web'
import { environment } from './../../environments/environment';

const appInsights = new ApplicationInsights({ config: {
  instrumentationKey: environment.instrumentationKey
} });
appInsights.loadAppInsights();
appInsights.trackPageView(); // Manually call trackPageView to establish the current user/session/pageview

//todo: remove
console.log("logging: ");
console.log(environment.instrumentationKey);