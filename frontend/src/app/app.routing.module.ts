import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";


//import { AuthComponent } from "./auth/auth.component";
import { MerchantsComponent } from "./merchants/merchants.component";
import { MerchantComponent } from "./merchant/merchant.component";
import { PaymentComponent } from "./payment/payment.component";
import { TransationListComponent } from "./transation-list/transation-list.component";

// import { PageNotFoundComponent } from "./page-not-found/page-not-found.component";

const appRoutes: Routes = [
  { path: "merchants", component: MerchantsComponent },
  { path: "merchants/:id", component: MerchantComponent },
  { path: "merchants/:merchant_id/transactions", component: PaymentComponent },
  { path: "merchants/:merchant_id/transactions-list", component: TransationListComponent },
  { path: "", redirectTo: "merchants", pathMatch: "full" }
];

@NgModule({
  imports: [
    RouterModule.forRoot(
      appRoutes
    )
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}
