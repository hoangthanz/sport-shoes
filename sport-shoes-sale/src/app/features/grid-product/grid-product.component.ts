import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { CommonService } from 'src/app/shared/services/common.service';
import { LoginService } from 'src/app/shared/services/login.service';
import { SportManagerApiService } from 'src/app/shared/services/sport-manager-api.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-grid-product',
  templateUrl: './grid-product.component.html',
  styleUrls: ['./grid-product.component.scss']
})
export class GridProductComponent extends BaseComponentService implements OnInit {

  public isList = false;
  public products = [];
  public productCategories = [];
  public brands = [];

  public productTotal = 0;

  public selectedProducts = [];
  public localDomain = environment.localDomain;

  public cart = [];

  public selectedUser;

  public total = 0;
  constructor(
    public _sportManagerApiService: SportManagerApiService,
    private loginService: LoginService,
    public toastr: ToastrService,
    public router: Router,
    public currencyPipe: CurrencyPipe,
    public datePipe: DatePipe,
    private commonService: CommonService,
    ) {
      super(toastr, router, currencyPipe, datePipe);
      this.cart = this.ConvertStringToObject(localStorage.getItem('currentCart'));
      this.cart.forEach(item => {
        this.total += (item.quantity * item.price);
      });
      this.selectedUser = this.ConvertStringToObject(localStorage.getItem('tokenPayload'));
  }

  ngOnInit() {
    this.initialize();
  }

  public initialize() {
    this.getProducts();
    this.getProductCategories();
    this.getBrands();
  }

  public getProducts(): void {
    this._sportManagerApiService.getProducts().subscribe((products: any[]) => {
      this.products = products;
      this.selectedProducts = products;
    }, error => {

    });
  }

  public getProductCategories(): void {
    this._sportManagerApiService.getProductCategories().subscribe((productCategories: any[]) => {
      this.productCategories = productCategories;
    }, error => {

    });
  }

  public getBrands(): void {
    this._sportManagerApiService.getBrands().subscribe((brands: any[]) => {
      this.brands = brands;
    }, error => {

    });
  }



  public productCategorySelection(productCategory): void {

  }


  //type = 0: list, type = 1: grid
  public changeView(type: number) {
    this.isList = (0 === type) ? true : false;
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
