import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { ConfirmComponent } from 'src/app/shared/components/confirm/confirm.component';
import { SportManagerApiService } from 'src/app/shared/services/sport-manager-api.service';
import { environment } from 'src/environments/environment';
import { CreateProductComponent } from './dialogs/create-product/create-product.component';
import { UpdateProductComponent } from './dialogs/update-product/update-product.component';

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.scss']
})
export class ProductComponent extends BaseComponentService implements OnInit {

  public displayedColumns: string[] = ['index', 'name', 'description', 'productCategoryName', 'imageFile', 'unitPrice', 'controls'];
  public dataSource = new MatTableDataSource([]);
  public products: any[] = [];

  public localDomain = environment.localDomain;
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
    this.getProducts();
  }

  public getProducts(): void {
    this._sportManagerApiService.getProducts().subscribe((products: any[]) => {
      this.products = products;
      this.setProductSource(this.products);
    }, error => {

    });
  }

  public setProductSource(products: any): void {
    this.dataSource = new MatTableDataSource(products);
  }

  public openCreateProductCategory() {
    const dialogRef = this.matDialog.open(CreateProductComponent, {
      data: {
      },
      width: '50vw'
    });
    dialogRef.afterClosed().subscribe(result => {
      this.getProducts();
    });
  }

  public openUpdateProduct(product: any) {
    const dialogRef = this.matDialog.open(UpdateProductComponent, {
      data: product,
      width: '50vw'
    });
    dialogRef.afterClosed().subscribe(result => {
      this.getProducts();
    });
  }

  public openDeleteProduct(product: any) {
    const dialogRef = this.matDialog.open(ConfirmComponent, {
      data: {
        message: 'danh mục'
      },
      width: '30vw'
    });
    dialogRef.afterClosed().subscribe(isDeleted => {
      if (isDeleted) {
        this._sportManagerApiService.deleteProductCategory(product.id).subscribe(response => {
          this.ShowErrorMessage('Xóa danh mục thành công');
          this.getProducts();
        }, error => {
          this.ShowErrorMessage('Xóa danh mục thất bại');
        });
      }
    });
  }

}
