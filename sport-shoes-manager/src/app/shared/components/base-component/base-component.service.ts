import { Injectable } from "@angular/core";
import { Router } from "@angular/router";
import { DatePipe, CurrencyPipe } from "@angular/common";
import { ToastrService } from "ngx-toastr";

@Injectable({
  providedIn: "root",
})
export class BaseComponentService {
  constructor(
    public toastr: ToastrService,
    public router: Router,
    public currencyPipe: CurrencyPipe,
    public datePipe: DatePipe
  ) { }

  public ShowSuccessMessage(message: string) {
    this.toastr.success(message);
  }

  public ShowWarningMessage(message: string) {
    this.toastr.warning(message);
  }

  public ShowErrorMessage(message: string) {
    this.toastr.error(message);
  }

  /* Clone để tránh trùng ô nhớ  */
  public Clone(object: any) {
    const ObjStr = JSON.stringify(object);
    return JSON.parse(ObjStr);
  }

  /* Kiểm tra 2 đối tượng có giống nhau không  */
  public Equals(object1: any, object2: any) {
    const ObjStr1 = JSON.stringify(object1);
    const ObjStr2 = JSON.stringify(object2);
    if (ObjStr1 === ObjStr2) {
      return true;
    }
    return false;
  }

  /* Chuyển đổi từ số sang định dang tiền tệ VNĐ  */
  // public ConvertToMoney(money: string) {
  //   if (money) {
  //     const convertMoney = `${money}`.replace(/\,/g, "");
  //     if (convertMoney != null)

  //       return this.currencyPipe
  //         .transform(convertMoney, "", "", "1.0-0")
  //         .replace("$", "");
  //     else
  //       return 0;
  //   }
  // }

  public ConvertToNumber(moneyAsString: string) {
    if (moneyAsString) {
      return Number(moneyAsString.replace(/\,/g, ""));
    }
  }

  public ConvertToDate(date: Date) {
    return this.datePipe.transform(date, "yyyy-MM-dd");
  }

  public GoTo(path: string) {
    this.router.navigateByUrl(path);
  }

  public ConvertObjectToString(object: any) {
    return JSON.stringify(object);
  }

  public ConvertStringToObject(str: string) {
    return JSON.parse(str);
  }

  public ShowResponseMessage(error: { error: { message: string | undefined; }; }) {
    this.toastr.error(error.error.message);
  }
}
