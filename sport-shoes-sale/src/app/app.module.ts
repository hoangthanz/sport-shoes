import { CommonService } from './shared/services/common.service';
import { FlexLayoutModule } from '@angular/flex-layout';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { JwtModule } from '@auth0/angular-jwt';
import { ToastrModule, ToastNoAnimationModule } from 'ngx-toastr';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './layouts/header/header.component';
import { FooterComponent } from './layouts/footer/footer.component';
import { BodyComponent } from './layouts/body/body.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DatePipe, CurrencyPipe, DecimalPipe, CommonModule } from '@angular/common';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { BaseComponentService } from './shared/components/base-component/base-component.service';
import { AuthGuardService } from './shared/services/auth-guard.service';
import { TokenInterceptor } from './shared/services/interceptor.service';
import { LoginService } from './shared/services/login.service';
import { SportManagerApiService } from './shared/services/sport-manager-api.service';
import { LoginComponent } from './features/login/login.component';
import { MainComponent } from './features/main/main.component';
import { NewsMagazineCarouselComponent } from './features/news-magazine-carousel/news-magazine-carousel.component';
import { CheckoutComponent } from './features/checkout/checkout.component';
import { SingleProductComponent } from './features/single-product/single-product.component';
import { RouterModule } from '@angular/router';
import { GridProductComponent } from './features/grid-product/grid-product.component';
import { RegisterComponent } from './features/register/register.component';
import { FullPageComponent } from './features/full-page/full-page.component';


export function tokenGetter() {
  return localStorage.getItem('token');
}


@NgModule({
  declarations: [

    AppComponent,
    HeaderComponent,
    FooterComponent,
    BodyComponent,
    LoginComponent,
    MainComponent,
    NewsMagazineCarouselComponent,
    CheckoutComponent,
    SingleProductComponent,
    GridProductComponent,
    RegisterComponent,
    FullPageComponent

  ],
  imports: [
    CommonModule,
    BrowserModule,
    BrowserAnimationsModule,
    FlexLayoutModule,
    HttpClientModule,
    AppRoutingModule,
    ToastrModule.forRoot({
      timeOut: 10000,
      positionClass: 'toast-bottom-right',
      preventDuplicates: true,
    }),
    ToastNoAnimationModule.forRoot(),
    JwtModule.forRoot({
      config: {
        tokenGetter: tokenGetter,
        skipWhenExpired: true,
      },
    }),
    ReactiveFormsModule,
    FormsModule,
    RouterModule
  ],
  providers: [
    DatePipe,
    CurrencyPipe,
    DecimalPipe,
    BaseComponentService,
    LoginService,
    AuthGuardService,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: TokenInterceptor,
      multi: true,
    },
    SportManagerApiService,
    CommonService

  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
