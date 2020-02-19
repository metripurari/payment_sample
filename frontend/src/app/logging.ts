import {
  HttpInterceptor,
  HttpRequest,
  HttpHandler,
  HttpEventType
} from "@angular/common/http";

import { tap } from "rxjs/operators";
import { MerchantsService } from "./merchants.service";
import { Injector, Injectable } from "@angular/core";

@Injectable()
export class LoggingInterceptorService implements HttpInterceptor {
  constructor(public merchantService: MerchantsService) {}
  intercept(req: HttpRequest<any>, next: HttpHandler) {
    console.log(
      `(${req.method})<${new Date()}>: Request Intiated for ${req.url}`
    );
    let modifiedRequest = req.clone();

    if (this.merchantService.current_merchant) {
      console.log("=====1111=========")
      modifiedRequest = req.clone({
        headers: req.headers.append(
          "Authorization",
          `Bearer ${this.merchantService.current_merchant.token.code}`
        )
      });
      console.log("=====2222=========")
    }

    return next.handle(modifiedRequest).pipe(
      tap(event => {
        console.log("333333");
        if (event.type === HttpEventType.UploadProgress) {
          console.log("Request Sending In progress");
        }
        if (event.type === HttpEventType.Sent) {
          console.log("Request Sent.");
        }
        if (event.type === HttpEventType.Response) {
          console.log("Response Arrived");
        }
        if (event.type === HttpEventType.DownloadProgress) {
          console.log("Waiting For response");
        }
      })
    );
  }
}
