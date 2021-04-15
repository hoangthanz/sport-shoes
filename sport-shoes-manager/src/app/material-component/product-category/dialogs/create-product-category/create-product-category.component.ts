import { MatDialogRef } from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, OnInit, OnDestroy, Inject } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { SportManagerApiService } from 'src/app/shared/services/sport-manager-api.service';

@Component({
  selector: 'app-create-product-category',
  templateUrl: './create-product-category.component.html',
  styleUrls: ['./create-product-category.component.scss']
})
export class CreateProductCategoryComponent extends BaseComponentService implements OnInit {

  public productCategoryform: FormGroup | undefined;
  constructor(
    public toastr: ToastrService,
    public router: Router,
    public currencyPipe: CurrencyPipe,
    public datePipe: DatePipe,
    private _sportManagerApiService: SportManagerApiService,
    private matDialogRef: MatDialogRef<CreateProductCategoryComponent>
  ) {
    super(toastr, router, currencyPipe, datePipe);
  }

  ngOnInit() {
    this.initialize();
  }

  public initialize() {
    this.productCategoryform = new FormGroup({
      name: new FormControl('', [Validators.required]),
    });
  }


  public submit() {
    this._sportManagerApiService.postProductCategory(this.productCategoryform?.value).subscribe(response => {
      this.ShowSuccessMessage('Thêm mới danh mục thành công!');
      this.matDialogRef.close(true);
    }, error => {
      this.ShowErrorMessage('Thêm mới danh mục thất bại!');
    });
  }


}
