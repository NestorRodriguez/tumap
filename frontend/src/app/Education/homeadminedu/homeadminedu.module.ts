import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { HomeadmineduPage } from './homeadminedu.page';

const routes: Routes = [
  {
    path: '',
    component: HomeadmineduPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [HomeadmineduPage]
})
export class HomeadmineduPageModule {}
