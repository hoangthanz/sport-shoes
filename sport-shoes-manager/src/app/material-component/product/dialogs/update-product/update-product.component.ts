import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { SportManagerApiService } from 'src/app/shared/services/sport-manager-api.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-update-product',
  templateUrl: './update-product.component.html',
  styleUrls: ['./update-product.component.scss']
})
export class UpdateProductComponent extends BaseComponentService implements OnInit {

  public productForm: FormGroup | undefined;

  public productCategories: any;
  public brands: any;


  public response!: { dbPath: ''; };

  public imageUrl: string = `assets/images/undraw_product_teardown_elol.svg`;
  public localDomain = environment.localDomain;
  public saveUrl = '';
  public colors = [
    "coral",
    "corn",
    "cornflower",
    "cream",
    "crimson",
    "cyan",
    "dandelion",
    "denim",
    "ecru",
    "emerald",
    "eggplant",
    "falu-red",
    "fern-green",
    "firebrick",
    "flax",
    "forest-green",
    "french-rose",
    "fuchsia",
    "gamboge",
    "gold",
    "goldenrod",
    "green",
    "grey",
    "han-purple",
    "harlequin",
    "heliotrope",
    "hollywood-cerise",
    "indigo",
    "ivory",
    "jade",
    "kelly-green",
    "khaki",
    "lavender",
    "lawn-green",
    "lemon",
    "lemon-chiffon",
    "lilac",
  ];

  public sizes = [
    { name: 'S', value: 0 },
    { name: 'M', value: 1 },
    { name: 'L', value: 2 },
  ];

  public countries = [
    "Afghanistan",
    "Ấn Độ",
    "Armenia",
    "Azerbaijan",
    "Bahrain",
    "Bangladesh",
    "Bhutan",
    "Brunei",
    "Campuchia",
    "Georgia",
    "Hàn Quốc",
    "Indonesia",
    "Iran",
    "I rắc",
    "Israel",
    "Jordan",
    "Kazakhstan",
    "Kuwait",
    "Kyrgyzstan",
    "Lào",
    "Lebanon",
    "Malaysia",
    "Maldives",
    "Mông Cổ",
    "Myanmar (Miến Điện)",
    "Nepal",
    "Nga",
    "Nhật Bản",
    "Oman",
    "Pakistan",
    "Palestine",
    "Philippines",
    "Qatar",
    "Ả Rập Saudi",
    "Singapore",
    "Síp",
    "Sri Lanka",
    "Syria",
    "Đài Loan",
    "Tajikistan",
    "Thái Lan",
    "Thỗ Nhĩ Kỳ",
    "Timor-Leste",
    "Triều Tiên",
    "Trung Quốc",
    "Turkmenistan",
    "Uzbekistan",
    "Việt Nam",
    "Yemen",
  ];

  public types = [
    { name: 'Mới', value: 0 },
    { name: 'Hot', value: 1 },
    { name: 'Mua nhiều', value: 2 },
    { name: 'Tất cả', value: 3 },
  ];

  public htmlData = '';

  public selectedProduct: any;
  constructor(
    @Inject(MAT_DIALOG_DATA) private data: any,
    public toastr: ToastrService,
    public router: Router,
    public currencyPipe: CurrencyPipe,
    public datePipe: DatePipe,
    private _sportManagerApiService: SportManagerApiService,
    public matDialogRef: MatDialogRef<UpdateProductComponent>

  ) {
    super(toastr, router, currencyPipe, datePipe);
  }

  ngOnInit() {
    this.initialize();
  }

  public async initialize() {

    this.selectedProduct = this.data.selectedProduct;
    this.htmlData = this.selectedProduct.summary;
    this.productForm = new FormGroup({
      productCategoryId: new FormControl(this.selectedProduct.productCategoryId, [Validators.required]),
      brandId: new FormControl(this.selectedProduct.brandId, [Validators.required]),
      name: new FormControl(this.selectedProduct.name, [Validators.required]),
      price: new FormControl(this.selectedProduct.price, [Validators.required]),
      country: new FormControl(this.selectedProduct.country, [Validators.required]),
      size: new FormControl(this.selectedProduct.size, [Validators.required]),
      type: new FormControl(this.selectedProduct.type, [Validators.required]),
      color: new FormControl(this.selectedProduct.color, [Validators.required]),
      material: new FormControl(this.selectedProduct.material),
      description: new FormControl(this.selectedProduct.description),
    });

    this.productCategories = await this.getProductCategories();
    this.brands = await this.getBrands();

    this.productForm.controls['productCategoryId'].setValue(this.productCategories[0].id);
    this.productForm.controls['brandId'].setValue(this.brands[0].id);
  }

  public uploadFile = (files: string | any[]) => {
    if (files.length === 0) {
      return;
    }
    let fileToUpload = <File>files[0];
    const formData = new FormData();
    formData.append('file', fileToUpload);

    this._sportManagerApiService.upload(formData).subscribe((response: any) => {
      let url = response.imagePath.toString().replace('wwwroot\\', '');
      url = url.replace('\\', '/');
      this.saveUrl = url;
      this.imageUrl = `${this.localDomain}/${url}`;
    }, (error: any) => {
      let url = error.error.text.toString().replace('wwwroot\\', '');
      url = url.replace('\\', '/');
      this.saveUrl = url;
      this.imageUrl = `${this.localDomain}/${url}`;
    });
  }

  public submit() {

    let product = this.productForm?.value;
    product.id = this.selectedProduct.id;
    product.imageFile = this.saveUrl;
    product.status = 1;
    product.price = this.ConvertToNumber(product.price.toString());
    product.summary = this.htmlData;
    this._sportManagerApiService.putProduct(product).subscribe(response => {
      this.ShowSuccessMessage('Cập nhật sản phẩm thành công!');
    }, error => {
      this.ShowErrorMessage('Cập nhật sản phẩm thất bại!');
    });
  }

  public getProductCategories() {
    return new Promise<any>((resolve) => {
      this._sportManagerApiService.getProductCategories().subscribe((productCategories: any[]) => {
        resolve(productCategories);
      }, error => {
        resolve([]);
      });
    });

  }

  public getBrands() {
    return new Promise<any>((resolve) => {
      this._sportManagerApiService.getBrands().subscribe((brands: any[]) => {
        resolve(brands);
      }, error => {
        resolve([]);
      });
    });
  }

  public onChange({ editor }: any) {
    const data = editor.getData();
    this.htmlData = data;
  }

}
