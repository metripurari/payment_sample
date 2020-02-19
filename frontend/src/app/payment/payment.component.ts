import { Component, OnInit } from '@angular/core';
import {MerchantsService} from '../merchants.service'
import { Router } from "@angular/router";
import { FormControl, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-payment',
  templateUrl: './payment.component.html',
  styleUrls: ['./payment.component.css']
})
export class PaymentComponent implements OnInit {
  public transaction: any;
  public paymentForm = new FormGroup({
    transaction_detail_attributes: new FormGroup({
      card_no: new FormControl(),
      expiry: new FormControl(),
      card_owner: new FormControl()
     }),
     amount: new FormControl()
  });

  constructor(private merchantService: MerchantsService, public router: Router) { }

  ngOnInit() {
    if(!this.merchantService.current_merchant){
       this.router.navigate(["/merchants"])
    }

  }

  makePayment(){
      this.merchantService.create_transaction(this.paymentForm.value).subscribe(
        data => {
          this.router.navigate(["merchants", this.merchantService.current_merchant.id])
        },
        error => {
          this.router.navigate(["/"])
        }
      );



  }

}
