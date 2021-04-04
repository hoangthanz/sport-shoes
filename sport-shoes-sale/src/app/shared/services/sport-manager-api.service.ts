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


  // brands


  public getBrands() {
    return this.httpClient.get<any>(`${environment.localDomain}/api/Brands`);
  }

  public postBrand(brand: any) {
    return this.httpClient.post(`${environment.localDomain}/api/Brands`, brand);
  }

  public putBrand(brand: any) {
    return this.httpClient.put(`${environment.localDomain}/api/Brands/${brand.id}`, brand);
  }

  public deleteBrand(id: string) {
    return this.httpClient.delete(`${environment.localDomain}/api/Brands/${id}`);
  }


  // upload image
  public upload(formData: FormData) {
    return this.httpClient.post(`${environment.localDomain}/api/Upload`, formData);
  }


  // review

  public getReviews() {
    return this.httpClient.get<any>(`${environment.localDomain}/api/getReviews`);
  }

  public postReview(review: any) {
    return this.httpClient.post(`${environment.localDomain}/api/getReviews`, review);
  }

  public putReview(review: any) {
    return this.httpClient.put(`${environment.localDomain}/api/getReviews/${review.id}`, review);
  }

  public deleteReview(id: string) {
    return this.httpClient.delete(`${environment.localDomain}/api/getReviews/${id}`);
  }


}
