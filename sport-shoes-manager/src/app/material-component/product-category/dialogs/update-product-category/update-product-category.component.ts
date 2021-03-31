import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { SportManagerApiService } from 'src/app/shared/services/sport-manager-api.service';

@Component({
  selector: 'app-update-product-category',
  templateUrl: './update-product-category.component.html',
  styleUrls: ['./update-product-category.component.scss']
})
export class UpdateProductCategoryComponent extends BaseComponentService implements OnInit {

  public productCategoryform: FormGroup | undefined;

  public productCategory: any;
  constructor(
    @Inject(MAT_DIALOG_DATA) private data: any,
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
    this.productCategory = this.data;
    this.productCategoryform = new FormGroup({
      name: new FormControl(this.productCategory.name, [Validators.required]),
    });
  }


  public submit() {
    this.productCategory.name = this.productCategoryform?.value.name;
    this._sportManagerApiService.putProductCategory(this.productCategory).subscribe(response => {
      this.ShowSuccessMessage('Cập nhật danh mục thành công!');
    }, error => {
      this.ShowErrorMessage('Cập nhật danh mục thất bại!');
    });
  }

}
