import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes } from '@angular/router';
import { RouterModule } from '@angular/router';
import { AgmCoreModule } from '@agm/core';
import { IonicModule } from '@ionic/angular';

import { Tab6Page } from './tab6.page';

const routes: Routes = [
  {
    path: '',
    component: Tab6Page
  }
];
@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes),
    RouterModule.forChild([{ path: '', component: Tab6Page }]),
    AgmCoreModule.forRoot({
      apiKey: 'AIzaSyB2g5cFRZ6Cr6ozLb9hv6kow_Id066HQmo'
    })
  ],
  declarations: [Tab6Page]
})
export class Tab6PageModule {}