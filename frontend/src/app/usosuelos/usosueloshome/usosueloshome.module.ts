import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';
import { AgmCoreModule } from '@agm/core';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { LocationAccuracy } from '@ionic-native/location-accuracy/ngx';
import { AndroidPermissions } from '@ionic-native/android-permissions/ngx';

import { IonicModule } from '@ionic/angular';

import { UsosueloshomePage } from './usosueloshome.page';

const routes: Routes = [
  {
    path: '',
    component: UsosueloshomePage
  }
];

@NgModule({
  imports: [
    AgmCoreModule,
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [UsosueloshomePage],
  providers: [AndroidPermissions, Geolocation, LocationAccuracy]
})
export class UsosueloshomePageModule {}
