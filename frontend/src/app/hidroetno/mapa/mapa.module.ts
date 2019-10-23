import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';
import { IonicModule } from '@ionic/angular';
import { MapaPage } from './mapa.page';
import { AgmCoreModule } from '@agm/core';
import { AndroidPermissions } from '@ionic-native/android-permissions/ngx';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { LocationAccuracy } from '@ionic-native/location-accuracy/ngx';

const routes: Routes = [
  {
    path: '',
    component: MapaPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    AgmCoreModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [MapaPage],
  providers: [AndroidPermissions, Geolocation, LocationAccuracy]
})
export class MapaPageModule {}
