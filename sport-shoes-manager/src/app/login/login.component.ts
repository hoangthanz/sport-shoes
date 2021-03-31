import { Component, OnInit } from '@angular/core';
import { LoginService } from 'src/app/shared/services/login.service';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { CurrencyPipe, DatePipe } from '@angular/common';
import decode from 'jwt-decode';
import { BaseComponentService } from '../shared/components/base-component/base-component.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent extends BaseComponentService implements OnInit {
  public titleTop = 'Đăng nhập';
  public hide = true;
  public userName: string = '';
  public password: string = '';
  public rememberMe: boolean = false;


  constructor(
    private loginService: LoginService,
    public toastr: ToastrService,
    public router: Router,
    public currencyPipe: CurrencyPipe,
    public datePipe: DatePipe
  ) {
    super(toastr, router, currencyPipe, datePipe);
    if (localStorage.getItem('token') != null) {
      this.GoTo('/dashboard');
    }
  }

  ngOnInit() { }


  public login() {
    const user = {
      userName: this.userName,
      password: this.password,
      rememberMe: this.rememberMe,
    };

    this.loginService.login(user).subscribe(
      (response: any) => {
        localStorage.setItem('token', response.token);
        const tokenPayload = decode(response.token);
        console.log(tokenPayload);
        localStorage.setItem('tokenPayload', this.ConvertObjectToString(tokenPayload));
        this.GoTo('dashboard');
      },
      (error) => {
        this.ShowWarningMessage('Tài khoản hoăc mật khẩu không đúng!');
      }
    );
  }

}
