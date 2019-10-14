import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { RegistroPage } from './registro.page';
import {MapaPage} from '../mapa/mapa.page';
import {MapaPageModule} from '../mapa/mapa.module';

import {NetworkInterface} from '@ionic-native/network-interface/ngx';
import {Camera} from '@ionic-native/camera/ngx';

const routes: Routes = [
  {
    path: '',
    component: RegistroPage
  }
];

@NgModule({
  entryComponents: [
    MapaPage,
  ],
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes),
    MapaPageModule
  ],
  providers: [
    NetworkInterface,
    Camera,
  ],
  declarations: [RegistroPage]
})
export class RegistroPageModule {}
