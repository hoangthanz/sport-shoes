import { environment } from 'src/environments/environment';
import { Component, OnInit } from '@angular/core';
import { CommonService } from 'src/app/shared/services/common.service';
import { SportManagerApiService } from 'src/app/shared/services/sport-manager-api.service';
import { CurrencyPipe, DatePipe } from '@angular/common';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { LoginService } from 'src/app/shared/services/login.service';

@Component({
  selector: 'app-full-page',
  templateUrl: './full-page.component.html',
  styleUrls: ['./full-page.component.scss']
})
export class FullPageComponent extends BaseComponentService implements OnInit {

  public products = [];

  public localDomain = environment.localDomain;
  constructor(
    public _sportManagerApiService: SportManagerApiService,
    private loginService: LoginService,
    public toastr: ToastrService,
    public router: Router,
    public currencyPipe: CurrencyPipe,
    public datePipe: DatePipe,
    private commonService: CommonService
  ) {
    super(toastr, router, currencyPipe, datePipe);
    this.initialize();
  }


  ngOnInit() {
  }

  public initialize() {
    this.getProducts();
  }

  public getProducts(): void {
    this._sportManagerApiService.getProducts().subscribe((products: any[]) => {
      this.products = products;
    }, error => {
      this.products = [];
    });
  }

  public sendProduct(message: any) {
    this.commonService.sendMessage(message);
  }

  public addFavorite(product) {
    const sendObject = {
      label: 'favorite',
      data: product
    }

    this.sendProduct(sendObject);
  }

  public addProductToCart(product) {
    const sendObject = {
      label: 'cart',
      data: product
    }

    this.sendProduct(sendObject);
  }

  public showProductDetail(selectedProduct) {
    const sendObject = {
      label: 'single-product',
      data: selectedProduct

    };
    this.sendProduct(sendObject);
    this.GoTo('single-product');
  }
}
