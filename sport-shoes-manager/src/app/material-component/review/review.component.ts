import { CurrencyPipe, DatePipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { Activity } from 'src/app/dashboard/dashboard-components/activity/activity-data';
import { BaseComponentService } from 'src/app/shared/components/base-component/base-component.service';
import { SportManagerApiService } from 'src/app/shared/services/sport-manager-api.service';
import { environment } from 'src/environments/environment';
import { activities } from './activity-data';

@Component({
  selector: 'app-review',
  templateUrl: './review.component.html',
  styleUrls: ['./review.component.scss']
})
export class ReviewComponent extends BaseComponentService implements OnInit {


  public localDomain = environment.localDomain;
  public reviews: any;

  activityData: Activity[];

  constructor(
    public toastr: ToastrService,
    public router: Router,
    public currencyPipe: CurrencyPipe,
    public datePipe: DatePipe,
    private _sportManagerApiService: SportManagerApiService,
    public matDialog: MatDialog,
  ) {
    super(toastr, router, currencyPipe, datePipe);
    this.activityData = activities;

  }

  ngOnInit() {
    this.initialize();
  }

  public initialize() {
    this.getReviews();
  }

  public getReviews(): void {
    this._sportManagerApiService.getReviews().subscribe((reviews: any[]) => {
      this.reviews = reviews;
    }, error => {

    });
  }



}
