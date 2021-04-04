import { Component, OnInit } from '@angular/core';
import { SportManagerApiService } from 'src/app/shared/services/sport-manager-api.service';

@Component({
  selector: 'app-grid-product',
  templateUrl: './grid-product.component.html',
  styleUrls: ['./grid-product.component.scss']
})
export class GridProductComponent implements OnInit {

  public isList = false;
  public products;
  public productCategories = [];
  public brands = [];

  public productTotal = 0;

  public selectedProducts = [];
  constructor(public _sportManagerApiService: SportManagerApiService) { }

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

}
