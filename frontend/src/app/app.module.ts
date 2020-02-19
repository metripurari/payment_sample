import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { HttpClientModule, HTTP_INTERCEPTORS } from "@angular/common/http";
import { ReactiveFormsModule } from '@angular/forms';


import { AppRoutingModule } from "./app.routing.module";

import { LoggingInterceptorService } from "./logging";

import { AppComponent } from './app.component';
import { MerchantsComponent } from './merchants/merchants.component';

import { MerchantsService } from './merchants.service';
import { MerchantComponent } from './merchant/merchant.component';
import { PaymentComponent } from './payment/payment.component';
import { TransationListComponent } from './transation-list/transation-list.component';


@NgModule({
  declarations: [
    AppComponent,
    MerchantsComponent,
    MerchantComponent,
    PaymentComponent,
    TransationListComponent
  ],
  imports: [
    ReactiveFormsModule,
    AppRoutingModule,
    BrowserModule,
    HttpModule,
    HttpClientModule,
  ],
  providers: [
    MerchantsService,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: LoggingInterceptorService,
      multi: true
    }

  ],
  bootstrap: [AppComponent]
})
export class AppModule { }



