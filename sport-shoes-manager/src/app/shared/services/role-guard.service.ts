import { Injectable } from '@angular/core';
import { CanActivate, Router, ActivatedRouteSnapshot } from '@angular/router';
import { AuthenticationService } from './authentication.service';
import decode from 'jwt-decode';

@Injectable({
  providedIn: 'root'
})
export class RoleGuardService implements CanActivate {
  constructor(public auth: AuthenticationService, public router: Router) { }

  canActivate(route: ActivatedRouteSnapshot): boolean {
    const token = <string>localStorage.getItem('token');
    const tokenPayload = decode(token);
    if (!this.auth.isAuthenticated() || tokenPayload == null) {
      this.router.navigate(['login']);
      return false;
    }
    return true;
  }
}
