import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { MinasestadoactualPage } from './minasestadoactual.page';

const routes: Routes = [
  {
    path: '',
    component: MinasestadoactualPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [MinasestadoactualPage]
})
export class MinasestadoactualPageModule {}
