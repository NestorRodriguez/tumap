import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { MinatipomaterialPage } from './minatipomaterial.page';

const routes: Routes = [
  {
    path: '',
    component: MinatipomaterialPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [MinatipomaterialPage]
})
export class MinatipomaterialPageModule {}
