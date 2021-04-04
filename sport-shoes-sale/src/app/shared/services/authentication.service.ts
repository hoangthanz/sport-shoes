import { Injectable } from '@angular/core';
import { JwtHelperService } from '@auth0/angular-jwt';

@Injectable({
  providedIn: 'root'
})
export class AuthenticationService {
  constructor(public jwtHelper: JwtHelperService) {}

  public getToken(): string {
    return <string>localStorage.getItem('token');
  }

  public isAuthenticated(): boolean {
    const token = <string>localStorage.getItem('token');
    return !this.jwtHelper.isTokenExpired(token);
  }
}
