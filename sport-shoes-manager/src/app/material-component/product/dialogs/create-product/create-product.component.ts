import { environment } from './../../../../../environments/environment';
import { CurrencyPipe, DatePipe } from '@angular/common';
import { HttpEventType } from '@angular/common/http';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { SportManagerApiService } from 'src/app/shared/services/sport-manager-api.service';

@Component({
  selector: 'app-create-product',
  templateUrl: './create-product.component.html',
  styleUrls: ['./create-product.component.scss']
})
export class CreateProductComponent extends BaseComponentService implements OnInit {

  public productForm: FormGroup | undefined;

  public productCategories: any;
  public brands: any;


  public response!: { dbPath: ''; };

  public imageUrl: string = `assets/images/undraw_product_teardown_elol.svg`;
  public localDomain = environment.localDomain;
  public saveUrl = '';
  constructor(
    public toastr: ToastrService,
    public router: Router,
    public currencyPipe: CurrencyPipe,
    public datePipe: DatePipe,
    private _sportManagerApiService: SportManagerApiService,
  ) {
    super(toastr, router, currencyPipe, datePipe);
  }

  ngOnInit() {
    this.initialize();
  }

  public async initialize() {

    this.productForm = new FormGroup({
      productCategoryId: new FormControl('', [Validators.required]),
      brandId: new FormControl('', [Validators.required]),
      name: new FormControl('', [Validators.required]),
      unitPrice: new FormControl(0, [Validators.required]),
    });

    this.productCategories = await this.getProductCategories();
    this.brands = await this.getBrands();

    this.productForm.controls['productCategoryId'].setValue(this.productCategories[0].id);
    this.productForm.controls['brandId'].setValue(this.brands[0].id);
  }

  public uploadFile = (files: string | any[]) => {
    if (files.length === 0) {
      return;
    }
    let fileToUpload = <File>files[0];
    const formData = new FormData();
    formData.append('file', fileToUpload);

    this._sportManagerApiService.upload(formData).subscribe((response) => {
      let url = response.toString().replace('wwwroot\\', '');
      url = url.replace('\\', '/');
      this.saveUrl = url;
      this.imageUrl = `${this.localDomain}/${url}`;
    }, (error: any) => {
      let url = error.error.text.toString().replace('wwwroot\\', '');
      url = url.replace('\\', '/');
      this.saveUrl = url;
      this.imageUrl = `${this.localDomain}/${url}`;
    });
  }

  public submit() {

    let product = this.productForm?.value;
    product.imageFile = this.saveUrl;
    product.status = 1;
    product.unitPrice = this.ConvertToNumber(product.unitPrice);
    this._sportManagerApiService.postProduct(product).subscribe(response => {
      this.ShowSuccessMessage('Thêm mới danh mục thành công!');
    }, error => {
      this.ShowErrorMessage('Thêm mới danh mục thất bại!');
    });
  }

  public getProductCategories() {
    return new Promise<any>((resolve) => {
      this._sportManagerApiService.getProductCategories().subscribe((productCategories: any[]) => {
        resolve(productCategories);
      }, error => {
        resolve([]);
      });
    });

  }

  public getBrands() {
    return new Promise<any>((resolve) => {
      this._sportManagerApiService.getBrands().subscribe((brands: any[]) => {
        resolve(brands);
      }, error => {
        resolve([]);
      });
    });
  }

}
