import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { CommonService } from 'src/app/shared/services/common.service';
import { LoginService } from 'src/app/shared/services/login.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent extends BaseComponentService implements OnInit, OnDestroy {

  // xử lí thanh toán ở đây
  public observerMessageSubcription: Subscription;
  constructor(
    private loginService: LoginService,
    public toastr: ToastrService,
    public router: Router,
    public currencyPipe: CurrencyPipe,
    public datePipe: DatePipe,
    private commonService: CommonService
  ) {
    super(toastr, router, currencyPipe, datePipe);
    if (localStorage.getItem('token') != null) {
      this.GoTo('');
    }
  }

  ngOnDestroy(): void {
    this.observerMessageSubcription?.unsubscribe();
  }

  ngOnInit() {
  }

  public goToLogin() {
    this.GoTo('login');
  }

  public onMessageListener() {
    this.observerMessageSubcription = this.commonService.messageSource.asObservable().subscribe((data: any) => {
      // do something
    });
  }

}
