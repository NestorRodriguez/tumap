import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { ModalSuelosOkPage } from './modal-suelos-ok.page';

const routes: Routes = [
  {
    path: '',
    component: ModalSuelosOkPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [ModalSuelosOkPage]
})
export class ModalSuelosOkPageModule {}
