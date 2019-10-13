import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { InventarioPostesPage } from './inventario-postes.page';
import {ModalMapaPage} from '../modal-mapa/modal-mapa.page';
import {ModalMapaPageModule} from '../modal-mapa/modal-mapa.module';

import { NetworkInterface } from '@ionic-native/network-interface/ngx';
import { Camera } from '@ionic-native/camera/ngx';

const routes: Routes = [
  {
    path: '',
    component: InventarioPostesPage
  }
];

@NgModule({
  entryComponents: [
    ModalMapaPage,
  ],
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes),
    ModalMapaPageModule,
  ],
  providers: [
    NetworkInterface,
    Camera,
  ],
  declarations: [InventarioPostesPage]
})
export class InventarioPostesPageModule {}
