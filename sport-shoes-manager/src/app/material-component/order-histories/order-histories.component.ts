import { MatTableDataSource } from '@angular/material/table';
import { Component, OnInit } from '@angular/core';
import { CurrencyPipe, DatePipe } from '@angular/common';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { SportManagerApiService } from 'src/app/shared/services/sport-manager-api.service';
import { OrderDetailComponent } from './components/order-detail/order-detail.component';

@Component({
  selector: 'app-order-histories',
  templateUrl: './order-histories.component.html',
  styleUrls: ['./order-histories.component.scss']
})
export class OrderHistoriesComponent extends BaseComponentService implements OnInit {

  public displayedColumns: string[] = ['index', 'orderDate', 'customerName', 'status', 'total'];
  public dataSource = new MatTableDataSource([]);

  public orderHistories = [];

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
    this.getOrderHistories();
  }

  public getOrderHistories() {
    this._sportManagerApiService.getOrderHistories().subscribe((orderHistories: any) => {
      this.orderHistories = orderHistories;

      this.setOrderHistorySource(this.orderHistories);
    }, error => {

    });
  }

  public setOrderHistorySource(orderHistories: any) {
    this.dataSource = new MatTableDataSource(orderHistories);

  }


  public showOrderDetails(orderDetails: any) {
    const dialogRef = this.matDialog.open(OrderDetailComponent, {
      data: {
        orderDetails: orderDetails
      },
      width: '50vw'
    });
    dialogRef.afterClosed().subscribe(result => {
    });
  }
}
