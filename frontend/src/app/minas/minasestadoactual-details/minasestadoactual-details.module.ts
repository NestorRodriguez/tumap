import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { MinasestadoactualDetailsPage } from './minasestadoactual-details.page';

const routes: Routes = [
  {
    path: '',
    component: MinasestadoactualDetailsPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [MinasestadoactualDetailsPage]
})
export class MinasestadoactualDetailsPageModule {}
