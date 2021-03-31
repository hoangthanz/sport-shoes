import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
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
  public brands : any;
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

  public initialize() {
    this.productForm = new FormGroup({
      productCategoryId: new FormControl('', [Validators.required]),
      brandId: new FormControl('', [Validators.required]),
      name: new FormControl('', [Validators.required]),
      unitPrice:  new FormControl('', [Validators.required]),

    });
  }


  public submit() {
    this._sportManagerApiService.postProduct(this.productForm?.value).subscribe(response => {
      this.ShowSuccessMessage('Thêm mới danh mục thành công!');
    }, error => {
      this.ShowErrorMessage('Thêm mới danh mục thất bại!');
    });
  }

}
