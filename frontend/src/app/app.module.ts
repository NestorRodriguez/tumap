import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';
import { AgmCoreModule } from '@agm/core';
import { Camera } from '@ionic-native/camera/ngx';
// Imports para los http requests
import { HttpClientModule } from '@angular/common/http';
import { HttpModule } from '@angular/http';

import { IonicModule, IonicRouteStrategy } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';
import { WebView } from '@ionic-native/ionic-webview/ngx';
import { Component, OnInit } from '@angular/core';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { IonicStorageModule } from '@ionic/storage';
import { UbicacionPageModule } from './dbo/ubicacion/ubicacion.module';
import { ModalSuelosPage } from './usosuelos/modal-suelos/modal-suelos.page';
import { ModalSuelosOkPage } from './usosuelos/modal-suelos-ok/modal-suelos-ok.page';


@NgModule({
  declarations: [AppComponent, ModalSuelosPage, ModalSuelosOkPage],
  entryComponents: [ModalSuelosPage, ModalSuelosOkPage],
  imports: [
    BrowserModule,
    IonicModule.forRoot(),
    AppRoutingModule,
    HttpClientModule,
    // tslint:disable-next-line: deprecation
    HttpModule,
    AgmCoreModule.forRoot({
      apiKey: 'AIzaSyB2g5cFRZ6Cr6ozLb9hv6kow_Id066HQmo'
    }),
    IonicStorageModule.forRoot({
      name: 'coordenadas',
      driverOrder: ['indexeddb']
    }),
    // Se agrega modal en dbo
    UbicacionPageModule
  ],
  providers: [
    StatusBar,
    SplashScreen,
    Camera,
    WebView,
    { provide: RouteReuseStrategy, useClass: IonicRouteStrategy },
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}
