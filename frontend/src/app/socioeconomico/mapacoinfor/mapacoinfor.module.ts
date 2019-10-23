import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';
import { AgmCoreModule } from '@agm/core';
import { IonicModule } from '@ionic/angular';

import { MapacoinforPage } from './mapacoinfor.page';

const routes: Routes = [
  {
    path: '',
    component: MapacoinforPage
  }
];

@NgModule({
  imports: [
    AgmCoreModule,
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [MapacoinforPage]
})
export class MapacoinforPageModule {}
