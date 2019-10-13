import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { EncuestasocialPage } from './encuestasocial.page';

const routes: Routes = [
  {
    path: '',
    component: EncuestasocialPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [EncuestasocialPage]
})
export class EncuestasocialPageModule {}
