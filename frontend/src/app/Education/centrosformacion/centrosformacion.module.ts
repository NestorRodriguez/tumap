import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { CentrosformacionPage } from './centrosformacion.page';

const routes: Routes = [
  {
    path: '',
    component: CentrosformacionPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [CentrosformacionPage]
})
export class CentrosformacionPageModule {}
