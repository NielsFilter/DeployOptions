import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { HomeComponent } from './home/home.component';
import { WeatherForecastComponent } from './weather-forecast/weather-forecast.component';
import { LuckyNumberComponent } from './lucky-number/lucky-number.component';
import { ApplicationInsightsService } from './logging/app-insights.service'

@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    LuckyNumberComponent,
    WeatherForecastComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot([
      { path: '', component: HomeComponent, pathMatch: 'full' },
      { path: 'lucky-number', component: LuckyNumberComponent },
      { path: 'weather-forecast', component: WeatherForecastComponent },
    ])
  ],
  providers: [
    ApplicationInsightsService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
