import { Component, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { CommonService } from 'src/app/shared/services/common.service';

@Component({
  selector: 'app-single-product',
  templateUrl: './single-product.component.html',
  styleUrls: ['./single-product.component.scss']
})
export class SingleProductComponent implements OnInit {

  public observerMessageSubcription: Subscription;

  public selectedProduct;
  public starNumber: number = 0;
  constructor(
    private commonService: CommonService
  ) { }


  ngOnDestroy(): void {
    this.observerMessageSubcription?.unsubscribe();
  }

  ngOnInit(): void {

  }

  public initialize(): void {
    this.onProductListener();
  }


  public onProductListener() {
    this.observerMessageSubcription = this.commonService.messageSource.asObservable().subscribe((data: any) => {
      // do something
      this.selectedProduct = data;
      this.starNumber = this.selectedProduct.star;
    });
  }


}
