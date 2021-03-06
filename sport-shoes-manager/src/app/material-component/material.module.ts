import 'hammerjs';
import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';

import { DemoMaterialModule } from '../demo-material-module';
import { CdkTableModule } from '@angular/cdk/table';

import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FlexLayoutModule } from '@angular/flex-layout';

import { MaterialRoutes } from './material.routing';
import { ButtonsComponent } from './buttons/buttons.component';

import { GridComponent } from './grid/grid.component';
import { ListsComponent } from './lists/lists.component';
import { MenuComponent } from './menu/menu.component';
import { TabsComponent } from './tabs/tabs.component';
import { StepperComponent } from './stepper/stepper.component';
import { ExpansionComponent } from './expansion/expansion.component';
import { ChipsComponent } from './chips/chips.component';
import { ToolbarComponent } from './toolbar/toolbar.component';
import { ProgressSnipperComponent } from './progress-snipper/progress-snipper.component';
import { ProgressComponent } from './progress/progress.component';
import {
  DialogComponent,
  DialogOverviewExampleDialogComponent
} from './dialog/dialog.component';
import { TooltipComponent } from './tooltip/tooltip.component';
import { SnackbarComponent } from './snackbar/snackbar.component';
import { SliderComponent } from './slider/slider.component';
import { SlideToggleComponent } from './slide-toggle/slide-toggle.component';
import { ProductCategoryComponent } from './product-category/product-category.component';
import { CreateProductCategoryComponent } from './product-category/dialogs/create-product-category/create-product-category.component';
import { UpdateProductCategoryComponent } from './product-category/dialogs/update-product-category/update-product-category.component';
import { ProductComponent } from './product/product.component';
import { CreateProductComponent } from './product/dialogs/create-product/create-product.component';
import { UpdateProductComponent } from './product/dialogs/update-product/update-product.component';
import { ReviewComponent } from './review/review.component';
import { CKEditorModule } from 'ckeditor4-angular';
import { MatTableModule } from '@angular/material/table';
import { OrderHistoriesComponent } from './order-histories/order-histories.component';
import { OrderDetailComponent } from './order-histories/components/order-detail/order-detail.component';



@NgModule({
  imports: [
    CommonModule,
    RouterModule.forChild(MaterialRoutes),
    DemoMaterialModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    FlexLayoutModule,
    CdkTableModule,
    CKEditorModule,
    MatTableModule

  ],
  providers: [],
  entryComponents: [
    DialogOverviewExampleDialogComponent,
    CreateProductComponent,
    CreateProductCategoryComponent,
    UpdateProductCategoryComponent,
    CreateProductComponent,
    UpdateProductComponent,
    OrderDetailComponent
  ],
  declarations: [
    ButtonsComponent,
    GridComponent,
    ListsComponent,
    MenuComponent,
    TabsComponent,
    StepperComponent,
    ExpansionComponent,
    ChipsComponent,
    ToolbarComponent,
    ProgressSnipperComponent,
    ProgressComponent,
    DialogComponent,
    DialogOverviewExampleDialogComponent,
    TooltipComponent,
    SnackbarComponent,
    SliderComponent,
    SlideToggleComponent,
    ProductCategoryComponent,
    CreateProductCategoryComponent,
    UpdateProductCategoryComponent,
    ProductComponent,
    CreateProductComponent,
    UpdateProductComponent,
    ReviewComponent,
    OrderHistoriesComponent,
    OrderDetailComponent
  ],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class MaterialComponentsModule { }
