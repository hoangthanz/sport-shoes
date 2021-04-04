import { Component, OnInit } from '@angular/core';
import { SportManagerApiService } from 'src/app/shared/services/sport-manager-api.service';

@Component({
  selector: 'app-body',
  templateUrl: './body.component.html',
  styleUrls: ['./body.component.scss']
})
export class BodyComponent implements OnInit {

  public products;

  constructor(public _sportManagerApiService: SportManagerApiService) { }

  ngOnInit() {
    this.initialize();
  }

  public initialize() {
    this.getProducts();
  }

  public getProducts(): void {
    this._sportManagerApiService.getProducts().subscribe((products: any[]) => {
      this.products = products;
    }, error => {

    });
  }


}
