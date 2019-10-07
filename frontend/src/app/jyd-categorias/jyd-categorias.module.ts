import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { JydCategoriasPage } from './jyd-categorias.page';

const routes: Routes = [
  {
    path: '',
    component: JydCategoriasPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [JydCategoriasPage]
})
export class JydCategoriasPageModule {}
