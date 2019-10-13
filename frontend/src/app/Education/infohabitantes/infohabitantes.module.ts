import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { InfohabitantesPage } from './infohabitantes.page';

const routes: Routes = [
  {
    path: '',
    component: InfohabitantesPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [InfohabitantesPage]
})
export class InfohabitantesPageModule {}
