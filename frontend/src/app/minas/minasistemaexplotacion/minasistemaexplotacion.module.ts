import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { MinasistemaexplotacionPage } from './minasistemaexplotacion.page';

const routes: Routes = [
  {
    path: '',
    component: MinasistemaexplotacionPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [MinasistemaexplotacionPage]
})
export class MinasistemaexplotacionPageModule {}
