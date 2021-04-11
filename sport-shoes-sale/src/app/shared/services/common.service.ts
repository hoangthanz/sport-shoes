import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CommonService {
  constructor() { }

  /* Tranfer */

  public messageSource = new BehaviorSubject(null);

  public sendMessage(message) {
    this.messageSource.next(message);
  }

}
