import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import {ComercioinformalPage} from '../comercioinformal/comercioinformal.page';

const routes: Routes = [
  {
    path: '',
    component: ComercioinformalPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [ComercioinformalPage]
})
export class ComercioinformalPageModule {}
