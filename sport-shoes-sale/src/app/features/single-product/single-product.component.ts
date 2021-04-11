import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { DomSanitizer } from '@angular/platform-browser';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { CommonService } from 'src/app/shared/services/common.service';
import { LoginService } from 'src/app/shared/services/login.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-single-product',
  templateUrl: './single-product.component.html',
  styleUrls: ['./single-product.component.scss']
})
export class SingleProductComponent extends BaseComponentService implements OnInit {


  public observerMessageSubcription: Subscription;

  public selectedProduct;
  public starNumber: number = 0;

  public localDomain = environment.localDomain;

  public html;

  public colors = [
    "coral",
    "corn",
    "cornflower",
    "cream",
    "crimson",
    "cyan",
    "dandelion",
    "denim",
    "ecru",
    "emerald",
    "eggplant",
    "falu-red",
    "fern-green",
    "firebrick",
    "flax",
    "forest-green",
    "french-rose",
    "fuchsia",
    "gamboge",
    "gold",
    "goldenrod",
    "green",
    "grey",
    "han-purple",
    "harlequin",
    "heliotrope",
    "hollywood-cerise",
    "indigo",
    "ivory",
    "jade",
    "kelly-green",
    "khaki",
    "lavender",
    "lawn-green",
    "lemon",
    "lemon-chiffon",
    "lilac",
  ];

  public sizes = [
    { name: 'S', value: 0, colorClass: 'js-check btn btn-check active mr-1' },
    { name: 'M', value: 1, colorClass: 'js-check btn btn-check mr-1' },
    { name: 'L', value: 2, colorClass: 'js-check btn btn-check mr-1' },
  ];

  public selectedSize = 0;

  public colorDef = 'js-check btn btn-check mr-1';
  public colorAc = 'js-check btn btn-check active mr-1'
  constructor(
    private sanitizer: DomSanitizer,
    private loginService: LoginService,
    public toastr: ToastrService,
    public router: Router,
    public currencyPipe: CurrencyPipe,
    public datePipe: DatePipe,
    private commonService: CommonService
  ) {
    super(toastr, router, currencyPipe, datePipe);
    const product = this.ConvertStringToObject(localStorage.getItem('selectedProduct'));
    if (product) {
      this.selectedProduct = product;
      this.html = this.sanitizer.bypassSecurityTrustHtml(this.selectedProduct.summary);
      this.starNumber = this.selectedProduct.star;
    }
  }

  ngOnDestroy(): void {
    this.observerMessageSubcription?.unsubscribe();
  }

  ngOnInit(): void {
    this.initialize();
  }

  public initialize(): void {
    this.onProductListener();
  }


  public onProductListener() {
    this.observerMessageSubcription = this.commonService.messageSource.asObservable().subscribe((data: any) => {
      // do something
      console.log(data);
      if (data?.label == 'single-product') {
        this.selectedProduct = data.data;
        this.html = this.sanitizer.bypassSecurityTrustHtml(this.selectedProduct.summary);

        this.starNumber = this.selectedProduct.star;
        localStorage.setItem('selectedProduct', this.ConvertObjectToString(this.selectedProduct));
      }
    });
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

  public sendProduct(message: any) {
    this.commonService.sendMessage(message);
  }

  public changeSize(size) {
    this.sizes.forEach(element => {
      if (element.value == size) {
        element.colorClass = this.colorAc;
      } else {
        element.colorClass = this.colorDef;
      }
    });
    this.selectedSize = size;
  }
}
