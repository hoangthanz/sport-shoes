import jwt_decode, { JwtPayload } from 'jwt-decode'
import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { LoginService } from 'src/app/shared/services/login.service';
import { CommonService } from 'src/app/shared/services/common.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent extends BaseComponentService implements OnInit {

  public userName: string = '';
  public password: string = '';
  public rememberMe: boolean = false;

  constructor(
    private loginService: LoginService,
    public toastr: ToastrService,
    public router: Router,
    public currencyPipe: CurrencyPipe,
    public datePipe: DatePipe,
    private commonService: CommonService
  ) {
    super(toastr, router, currencyPipe, datePipe);
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
        const tokenPayload = jwt_decode<JwtPayload>(response.token);
        console.log(tokenPayload);
        localStorage.setItem('tokenPayload', this.ConvertObjectToString(tokenPayload));
        this.sendLogin({ isLogin: true });
        this.GoTo('full');
      },
      (error) => {
        this.ShowWarningMessage('Tài khoản hoăc mật khẩu không đúng!');
      }
    );
  }

  public sendLogin(message: any) {
    this.commonService.sendMessage(message);
  }

}
