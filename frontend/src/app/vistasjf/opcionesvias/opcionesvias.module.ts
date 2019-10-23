import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { OpcionesviasPage } from './opcionesvias.page';

const routes: Routes = [
  {
    path: '',
    component: OpcionesviasPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [OpcionesviasPage]
})
export class OpcionesviasPageModule {}
