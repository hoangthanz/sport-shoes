import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { SportManagerApiService } from 'src/app/shared/services/sport-manager-api.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-order-detail',
  templateUrl: './order-detail.component.html',
  styleUrls: ['./order-detail.component.scss']
})
export class OrderDetailComponent extends BaseComponentService implements OnInit {
  public displayedColumns: string[] = ['index', 'name', 'imageFile', 'quantity', 'price', 'total'];
  public dataSource = new MatTableDataSource([]);

  public orderDetails: any;
  public localDomain = environment.localDomain;

  constructor(
    @Inject(MAT_DIALOG_DATA) private data: any,
    public toastr: ToastrService,
    public router: Router,
    public currencyPipe: CurrencyPipe,
    public datePipe: DatePipe,
    private _sportManagerApiService: SportManagerApiService,
    public matDialogRef: MatDialogRef<OrderDetailComponent>

  ) {
    super(toastr, router, currencyPipe, datePipe);
  }

  ngOnInit() {
    this.initialize();
  }

  public async initialize() {
    this.orderDetails = this.data.orderDetails;

    this.orderDetails.forEach((element: any) => {
      if (element?.product) {
        let url = element.product?.imageFile.toString().replace('wwwroot\\', '');
        url = url.replace('\\', '/');
        element.product.imageFile = url;
      }
    });


    this.dataSource = new MatTableDataSource(this.orderDetails);
  }

  public getTotalCost() {
    return this.orderDetails.map((t: any) => t.quantity * t.price).reduce((acc: any, value: any) => acc + value, 0);
  }

}
