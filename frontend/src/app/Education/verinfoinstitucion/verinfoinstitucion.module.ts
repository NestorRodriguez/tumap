import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { VerinfoinstitucionPage } from './verinfoinstitucion.page';

const routes: Routes = [
  {
    path: '',
    component: VerinfoinstitucionPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [VerinfoinstitucionPage]
})
export class VerinfoinstitucionPageModule {}
