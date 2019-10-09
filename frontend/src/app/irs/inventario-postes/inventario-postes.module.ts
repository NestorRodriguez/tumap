import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { InventarioPostesPage } from './inventario-postes.page';
import {ModalMapaPage} from '../modal-mapa/modal-mapa.page';
import {ModalMapaPageModule} from '../modal-mapa/modal-mapa.module';

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
  declarations: [InventarioPostesPage]
})
export class InventarioPostesPageModule {}
