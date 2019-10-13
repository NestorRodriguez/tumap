import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {FormsModule} from '@angular/forms';
import {Routes, RouterModule} from '@angular/router';

import {IonicModule} from '@ionic/angular';

import {InventarioPostesPage} from './inventario-postes.page';
import {ModalMapaPage} from '../modal-mapa/modal-mapa.page';
import {ModalMapaPageModule} from '../modal-mapa/modal-mapa.module';


import {NetworkInterface} from '@ionic-native/network-interface/ngx';
import {Camera} from '@ionic-native/camera/ngx';
import {ModalEncuestaPage} from '../modal-encuesta/modal-encuesta.page';
import {ModalEncuestaPageModule} from '../modal-encuesta/modal-encuesta.module';

const routes: Routes = [
  {
    path: '',
    component: InventarioPostesPage
  }
];

@NgModule({
  entryComponents: [
    ModalMapaPage,
    ModalEncuestaPage,
  ],
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes),
    ModalMapaPageModule,
    ModalEncuestaPageModule,
  ],
  providers: [
    NetworkInterface,
    Camera,
  ],
  declarations: [InventarioPostesPage]
})
export class InventarioPostesPageModule {
}
