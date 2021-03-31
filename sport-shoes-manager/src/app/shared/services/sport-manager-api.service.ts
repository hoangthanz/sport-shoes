import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class SportManagerApiService {

  constructor(private httpClient: HttpClient) { }

  public getAccounts() {
    return this.httpClient.get(`${environment.localDomain}/api/Accounts`);
  }


  // product-category
  public getProductCategories() {
    return this.httpClient.get<any>(`${environment.localDomain}/api/ProductCategories`);
  }

  public postProductCategory(productCategory: any) {
    return this.httpClient.post(`${environment.localDomain}/api/ProductCategories`, productCategory);
  }

  public putProductCategory(productCategory: any) {
    return this.httpClient.put(`${environment.localDomain}/api/ProductCategories/${productCategory.id}`, productCategory);
  }

  public deleteProductCategory(id: string) {
    return this.httpClient.delete(`${environment.localDomain}/api/ProductCategories/${id}`);
  }

  // product

  public getProducts() {
    return this.httpClient.get<any>(`${environment.localDomain}/api/Products`);
  }

  public postProduct(product: any) {
    return this.httpClient.post(`${environment.localDomain}/api/Products`, product);
  }

  public putProduct(product: any) {
    return this.httpClient.put(`${environment.localDomain}/api/Products/${product.id}`, product);
  }

  public deleteProduct(id: string) {
    return this.httpClient.delete(`${environment.localDomain}/api/Products/${id}`);
  }
}
