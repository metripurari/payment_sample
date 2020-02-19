import { Component, OnInit } from '@angular/core';

import {MerchantsService} from '../merchants.service'
import {Merchant} from '../merchant'

@Component({
  selector: 'app-merchants',
  templateUrl: './merchants.component.html',
  styleUrls: ['./merchants.component.css']
})
export class MerchantsComponent implements OnInit {

  constructor(private merchantService: MerchantsService) { }

  ngOnInit() {
    this.merchantService.fetchMerchants()

  }

  renewToken(merchant: Merchant){
     this.merchantService.renew(merchant)
  }

  postMethod(files: FileList) {
    this.merchantService.create(files).subscribe(
    data => {
          this.merchantService.merchants = [].concat(this.merchantService.merchants, data);
        },
        error => {

        });
    return false;
  }
}
