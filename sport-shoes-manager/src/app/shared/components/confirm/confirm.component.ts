import { Component, Inject, OnInit } from '@angular/core';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-confirm',
  templateUrl: './confirm.component.html',
  styleUrls: ['./confirm.component.scss']
})
export class ConfirmComponent implements OnInit {

  message = '';
  subMessage = null;
  matTooltip = '';
  matTooltipPosition = 'below';
  colorOK = 'primary';
  colorCancel = 'warn';
  constructor(
    @Inject(MAT_DIALOG_DATA) private messageBlock: any,
    private dialogRef: MatDialogRef<ConfirmComponent>,
    public dialog: MatDialog,
  ) {
    this.intialize();
  }

  ngOnInit() {
  }

  public intialize() {
    this.message = this.messageBlock.message;
    this.matTooltip = this.messageBlock.matTooltip;
    this.matTooltipPosition = this.messageBlock.matTooltipPosition;
    this.colorOK = this.messageBlock.colorOK;
    this.colorCancel = this.messageBlock.colorCancel;
    this.subMessage = this.messageBlock?.subMessage;
  }
}
