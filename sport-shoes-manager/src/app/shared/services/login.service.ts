import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class LoginService {
  constructor(private httpClient: HttpClient) {}

  public login(user: any) {
    return this.httpClient.post(
      `${environment.localDomain}/api/Users/authenticate-for-client`,
      user
    );
  }

  public register(user: any) {
    return this.httpClient.post(
      `${environment.localDomain}/api/Users/register`,
      user
    );
  }
}
