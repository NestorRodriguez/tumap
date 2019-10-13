import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { MinatipomaterialdetailsPage } from './minatipomaterialdetails.page';

const routes: Routes = [
  {
    path: '',
    component: MinatipomaterialdetailsPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [MinatipomaterialdetailsPage]
})
export class MinatipomaterialdetailsPageModule {}
