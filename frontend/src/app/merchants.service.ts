import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Response } from '@angular/http';
import { Router } from "@angular/router";
import { Observable } from 'rxjs/Observable';
import {Merchant} from  './merchant'
import 'rxjs/Rx';


@Injectable()
export class MerchantsService {
  public fileToUpload: any;
  public show_transaction = false;
  public current_merchant: Merchant;
  public merchants: Array<Merchant>;
  constructor(private http: HttpClient, , public router: Router) { }
  fetchMerchants(){
    let merchantsUrl = `http://localhost:3000/merchants`
      let promise = new Promise((resolve, reject) => {
        this.http.get(merchantsUrl)
          .toPromise()
          .then(
            res => { // Success
              this.merchants = res;
              console.log(this.merchants)
              resolve();
            },
            msg => { // Error
              reject(msg);
            }
          )
      }
    )
    return promise;
  }

  renew(merchant){
    let merchantsUrl = `http://localhost:3000/merchants/${merchant.id}`
      let promise = new Promise((resolve, reject) => {
        this.http.put(merchantsUrl)
          .toPromise()
          .then(
            res => { // Success
              for (let i = 0; i < this.merchants.length; i++) {

                if(this.merchants[i].id==res.id){
                  console.log(res)
                  this.merchants[i] = res
                  this.current_merchant = this.merchants[i]
                }

              }
              resolve();
            },
            msg => { // Error

              reject(msg);
            }
          )
      }
    )
    return promise;
  }

  create(files): Observable<Merchants[]> {
    this.fileToUpload = files.item(0);
    let formData = new FormData();
    formData.append('file', this.fileToUpload, this.fileToUpload.name);
    let merchantsUrl = `http://localhost:3000/merchants/`
    return this.http.post<Merchant>(merchantsUrl, formData);
  }

  create_transaction(transaction): Observable<any> {
    console.log(transaction)
    let transactionUrl = `http://localhost:3000/merchants/${this.current_merchant.id}/transactions`
    return this.http.post<Merchant>(transactionUrl, {"transaction": transaction);
  }

  get_transaction(transaction): Observable<any> {
    let transactionUrl = `http://localhost:3000/merchants/${this.current_merchant.id}/transactions`
    return this.http.get<Merchant>(transactionUrl);
  }

  FetchAll(transaction): Observable<Merchants[]> {
    let merchantsUrl = `http://localhost:3000/merchants/`
    return this.http.get<Merchant>(merchantsUrl);
  }

  get(id): Observable<Merchant> {
    let merchantsUrl = `http://localhost:3000/merchants/${id}`
    return this.http.get<Merchant>(merchantsUrl);
  }

}
