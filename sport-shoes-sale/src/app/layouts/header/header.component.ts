import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { CommonService } from 'src/app/shared/services/common.service';
import { LoginService } from 'src/app/shared/services/login.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent extends BaseComponentService implements OnInit, OnDestroy {

  // xử lí thanh toán ở đây
  public isLogin = false;
  public selectedUser;
  public observerMessageSubcription: Subscription;
  public favoriteProducts = [];
  public cart = [];
  public localDomain = environment.localDomain;

  public total = 0;
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
      this.isLogin = true;
      this.favoriteProducts = (this.ConvertStringToObject(localStorage.getItem('currentFavorite')) ? this.ConvertStringToObject(localStorage.getItem('currentFavorite')) : []);
      this.cart = this.ConvertStringToObject(localStorage.getItem('currentCart')) ? this.ConvertStringToObject(localStorage.getItem('currentCart')) : [];

      this.cart.forEach(item => {
        this.total += (item.quantity * item.price);
      });
    } else {
      this.isLogin = false;
      this.GoTo('login');
    }

  }

  ngOnDestroy(): void {
    this.observerMessageSubcription?.unsubscribe();
  }

  ngOnInit() {
    this.onMessageListener();
    if (this.isLogin) {
      const user = localStorage.getItem('tokenPayload');
      this.selectedUser = this.ConvertStringToObject(user);
    }

  }

  public goHome() {
    this.GoTo('full');
  }

  public goToLogin() {
    this.isLogin = false;
    this.GoTo('login');
  }

  public logout() {
    localStorage.clear();
    this.goToLogin();
  }

  public onMessageListener() {
    this.observerMessageSubcription = this.commonService.messageSource.asObservable().subscribe((data: any) => {
      if (data?.label == 'favorite') {
        const isExist = this.favoriteProducts.find(x => x.id == data.data.id);

        if (!isExist)
          this.favoriteProducts.push(data.data);
        console.log(this.favoriteProducts);
        localStorage.setItem('currentFavorite', this.ConvertObjectToString(this.favoriteProducts));
      }

      if (data?.label == 'cart') {
        let currentProduct = this.cart.find(x => x.id == data.data.id);

        if (!currentProduct) {
          let newProduct = data.data;
          newProduct.quantity = 1;
          this.cart.push(newProduct);

        } else {
          currentProduct.quantity++;
        }
        console.log(this.cart);
        localStorage.setItem('currentCart', this.ConvertObjectToString(this.cart));
      }

      this.isLogin = true;
      const user = localStorage.getItem('tokenPayload');
      this.selectedUser = this.ConvertStringToObject(user);
    });
  }

}
