import { Component, OnInit } from '@angular/core';
import { SportManagerApiService } from 'src/app/shared/services/sport-manager-api.service';

@Component({
  selector: 'app-full-page',
  templateUrl: './full-page.component.html',
  styleUrls: ['./full-page.component.scss']
})
export class FullPageComponent implements OnInit {

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
