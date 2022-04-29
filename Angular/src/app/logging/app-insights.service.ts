import { Injectable } from '@angular/core';
import { ApplicationInsights } from '@microsoft/applicationinsights-web';
import { environment } from './../../environments/environment';

@Injectable()
export class ApplicationInsightsService {
    appInsights: ApplicationInsights | undefined;

    constructor() {
        const appInsightsKey = environment.instrumentationKey;
        if (!appInsightsKey) {
            // add custom behavior to handle this scenario
            console.error('Application Insights key not found.');
            return;
        }

        this.appInsights = new ApplicationInsights({
            config: {
                instrumentationKey: appInsightsKey,
                enableAutoRouteTracking: true, // optional: auto-log all route changes
            },
        });

        this.appInsights.loadAppInsights();
    }

    // helper methods to track a variety of events and metric
    logPageView(name?: string, url?: string) {
        this.appInsights.trackPageView({
            name: name,
            uri: url,
        });
    }

    logEvent(name: string, properties?: { [key: string]: any }) {
        this.appInsights.trackEvent({ name: name }, properties);
    }

    logMetric(name: string, average: number, properties?: { [key: string]: any }) {
        this.appInsights.trackMetric({ name: name, average: average }, properties);
    }

    logException(exception: Error, severityLevel?: number) {
        this.appInsights.trackException({ exception: exception, severityLevel: severityLevel });
    }

    logTrace(message: string, properties?: { [key: string]: any }) {
        this.appInsights.trackTrace({ message: message }, properties);
    }
}
view rawApplicationInsightsService.js hosted with ❤ by GitHub

//todo: remove
console.log("logging: ");
console.log(environment.instrumentationKey);