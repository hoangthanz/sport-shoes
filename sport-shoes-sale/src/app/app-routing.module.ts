import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CheckoutComponent } from './features/checkout/checkout.component';
import { FullPageComponent } from './features/full-page/full-page.component';
import { GridProductComponent } from './features/grid-product/grid-product.component';
import { LoginComponent } from './features/login/login.component';
import { MainComponent } from './features/main/main.component';
import { RegisterComponent } from './features/register/register.component';
import { SingleProductComponent } from './features/single-product/single-product.component';

const routes: Routes = [
  {
    path: '',
    component: MainComponent,
    children: [
      {
        path: 'pages',
        children: [
          {
            path: '',
            component: FullPageComponent,
          },
          {
            path: 'checkout',
            component: CheckoutComponent,
          },
          {
            path: 'single-product',
            component: SingleProductComponent,
          },
          {
            path: 'grid-product',
            component: GridProductComponent,
          },
        ]
      }
    ]
  },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
