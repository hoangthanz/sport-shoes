import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  constructor(private httpClient: HttpClient) {}

  changePassword(id: string, changePassword) {
    return this.httpClient.post(
      `${environment.lotteryDomain}/api/AppUsers/change-password/${id}`,
      changePassword
    );
  }

  changePaymentPassword(id: string, changePaymentPassword) {
    return this.httpClient.post(
      `${environment.lotteryDomain}/api/AppUsers/change-payment-password/${id}`,
      changePaymentPassword
    );
  }
}
