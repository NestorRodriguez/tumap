import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { MinasistemaexplotacionDetailsPage } from './minasistemaexplotacion-details.page';

const routes: Routes = [
  {
    path: '',
    component: MinasistemaexplotacionDetailsPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [MinasistemaexplotacionDetailsPage]
})
export class MinasistemaexplotacionDetailsPageModule {}
