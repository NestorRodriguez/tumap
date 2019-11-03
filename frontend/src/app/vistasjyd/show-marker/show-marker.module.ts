import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { ShowMarkerPage } from './show-marker.page';

import { AgmCoreModule } from '@agm/core'; //dependencia para importar angular google maps

const routes: Routes = [
  {
    path: '',
    component: ShowMarkerPage
  }
];

@NgModule({
  imports: [
    IonicModule,
    CommonModule,
    FormsModule,
    RouterModule.forChild([{ path: '', component: ShowMarkerPage }]),
    AgmCoreModule.forRoot({
      apiKey: 'AIzaSyB2g5cFRZ6Cr6ozLb9hv6kow_Id066HQmo'
    })
  ],
  declarations: [ShowMarkerPage]
})
export class ShowMarkerPageModule {}
