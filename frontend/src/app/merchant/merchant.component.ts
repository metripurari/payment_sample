import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute, Params } from "@angular/router";

import {MerchantsService} from '../merchants.service'

@Component({
  selector: 'app-merchant',
  templateUrl: './merchant.component.html',
  styleUrls: ['./merchant.component.css']
})
export class MerchantComponent implements OnInit {
  public loading: Boolean = true
  constructor(private merchantService: MerchantsService, public router: Router, public route: ActivatedRoute) { }

  ngOnInit() {

    this.route.params.subscribe((params: Params) => {
      this.merchantService.get(params['id']).subscribe(
        data => {

          this.merchantService.current_merchant = data;
          this.loading = false
          console.log("Page loaded")
          console.log(this.merchantService.current_merchant)
        },
        error => {

        }
      );

    });
  }

  show_transactions(){
    this.merchantService.show_transaction = true
  }

}
