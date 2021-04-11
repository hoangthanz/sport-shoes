import { Component, OnInit } from '@angular/core';
import { CommonService } from 'src/app/shared/services/common.service';
import { SportManagerApiService } from 'src/app/shared/services/sport-manager-api.service';

@Component({
  selector: 'app-full-page',
  templateUrl: './full-page.component.html',
  styleUrls: ['./full-page.component.scss']
})
export class FullPageComponent implements OnInit {

  public products = [];

  constructor(public _sportManagerApiService: SportManagerApiService,
    private commonService: CommonService
  ) {
    this.initialize();
  }

  ngOnInit() {
  }

  public initialize() {
    this.getProducts();
  }

  public getProducts(): void {
    this._sportManagerApiService.getProducts().subscribe((products: any[]) => {
      this.products = products;
    }, error => {
      this.products = [];
    });
  }

  public sendProduct(message: any) {
    this.commonService.sendMessage(message);
  }



}
