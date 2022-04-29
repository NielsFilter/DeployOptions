import { Component } from '@angular/core';
import { environment } from './../environments/environment';
import { ApplicationInsights } from '@microsoft/applicationinsights-web';
import { AngularPlugin } from '@microsoft/applicationinsights-angularplugin-js';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent {
  title = 'app';

  constructor(private router: Router) {
      var angularPlugin = new AngularPlugin();
      const appInsights = new ApplicationInsights({ config: {
      instrumentationKey: environment.instrumentationKey,
      extensions: [angularPlugin],
      extensionConfig: {
          [angularPlugin.identifier]: { router: this.router }
      }
      } });
      appInsights.loadAppInsights();
  }
}