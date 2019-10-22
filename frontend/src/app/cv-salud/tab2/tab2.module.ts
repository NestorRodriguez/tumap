import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes } from '@angular/router';
import { RouterModule } from '@angular/router';
import { AgmCoreModule } from '@agm/core';
import { IonicModule } from '@ionic/angular';

import { Tab2Page } from './tab2.page';

const routes: Routes = [
  {
    path: '',
    component: Tab2Page
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes),
    RouterModule.forChild([{ path: '', component: Tab2Page }]),
    AgmCoreModule.forRoot({
      apiKey: 'AIzaSyB2g5cFRZ6Cr6ozLb9hv6kow_Id066HQmo'
    })
  ],
  declarations: [Tab2Page]
})
export class Tab2PageModule {}
