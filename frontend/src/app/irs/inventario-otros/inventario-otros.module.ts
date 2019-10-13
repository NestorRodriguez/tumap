import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { InventarioOtrosPage } from './inventario-otros.page';

const routes: Routes = [
  {
    path: '',
    component: InventarioOtrosPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [InventarioOtrosPage]
})
export class InventarioOtrosPageModule {}
