import {Token} from "./token"
export class Merchant {
  id: number;
  description: string;
  email: string;
  name: string;
  expired: boolean;
  token: string;
  expiry: Date;
  code: string;
  status: string;
  token: Token;
  active: () => {
    return this.status && !this.status.expired
  };
  transactions: any;

}