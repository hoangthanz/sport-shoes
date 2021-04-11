import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { ConfirmComponent } from 'src/app/shared/components/confirm/confirm.component';
import { SportManagerApiService } from 'src/app/shared/services/sport-manager-api.service';
import { CreateProductCategoryComponent } from './dialogs/create-product-category/create-product-category.component';
import { UpdateProductCategoryComponent } from './dialogs/update-product-category/update-product-category.component';

@Component({
  selector: 'app-product-category',
  templateUrl: './product-category.component.html',
  styleUrls: ['./product-category.component.scss']
})

export class ProductCategoryComponent extends BaseComponentService implements OnInit {

  public displayedColumns: string[] = ['index', 'name', 'controls'];
  public productCategorySource = new MatTableDataSource([]);
  public productCategories: any[] = [];

  constructor(
    public toastr: ToastrService,
    public router: Router,
    public currencyPipe: CurrencyPipe,
    public datePipe: DatePipe,
    private _sportManagerApiService: SportManagerApiService,
    public matDialog: MatDialog,
  ) {
    super(toastr, router, currencyPipe, datePipe);
  }

  ngOnInit() {
    this.initialize();
  }

  public initialize() {
    this.getProductCategories();
  }

  public getProductCategories(): void {
    this._sportManagerApiService.getProductCategories().subscribe((productCategories: any[]) => {
      this.productCategories = productCategories;
      this.setProductCategorySource(this.productCategories);
    }, error => {

    });
  }

  public setProductCategorySource(productCategories: any): void {
    this.productCategorySource = new MatTableDataSource(productCategories);
  }

  public openCreateProductCategory() {
    const dialogRef = this.matDialog.open(CreateProductCategoryComponent, {
      data: {
      },
      width: '30vw'
    });
    dialogRef.afterClosed().subscribe(result => {
      this.getProductCategories();
    });
  }

  public openUpdateProductCategory(productCategory: any) {
    const dialogRef = this.matDialog.open(UpdateProductCategoryComponent, {
      data: productCategory,
      width: '30vw'
    });
    dialogRef.afterClosed().subscribe(result => {
      this.getProductCategories();
    });
  }

  public openDeleteProductCategory(productCategory: any) {
    const dialogRef = this.matDialog.open(ConfirmComponent, {
      data: {
        message: 'danh mục'
      },
      width: '30vw'
    });
    dialogRef.afterClosed().subscribe(isDeleted => {
      if (isDeleted) {
        this._sportManagerApiService.deleteProductCategory(productCategory.id).subscribe(response => {
          this.ShowErrorMessage('Xóa danh mục thành công');
          this.getProductCategories();
        }, error => {
          this.ShowErrorMessage('Xóa danh mục thất bại');
        });
      }
    });
  }

}
