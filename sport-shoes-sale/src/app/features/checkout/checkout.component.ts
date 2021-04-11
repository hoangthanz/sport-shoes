import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { CommonService } from 'src/app/shared/services/common.service';
import { LoginService } from 'src/app/shared/services/login.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.scss']
})
export class CheckoutComponent extends BaseComponentService implements OnInit {

  public localDomain = environment.localDomain;

  public cart = [];

  public selectedUser;

  public selectedOrder = {
    city: '',
    area: '',
    street: '',
    building: '',
    house: '',
    postalCode: '',
    zip: '',
    total: 0,
    userId: '',
    orderDate: this.ConvertToDate(new Date())
  };

  constructor(
    private loginService: LoginService,
    public toastr: ToastrService,
    public router: Router,
    public currencyPipe: CurrencyPipe,
    public datePipe: DatePipe,
    private commonService: CommonService
  ) {
    super(toastr, router, currencyPipe, datePipe);
    this.cart = this.ConvertStringToObject(localStorage.getItem('currentCart'));
    this.selectedUser = this.ConvertStringToObject(localStorage.getItem('tokenPayload'));
  }


  ngOnInit() {
    this.initialize();
  }

  public initialize() {

  }

  public submitPayment() {

  }

}
