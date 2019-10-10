import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';

import { IonicModule } from '@ionic/angular';

import { InscripcionPage } from './inscripcion.page';

const routes: Routes = [
  {
    path: '',
    component: InscripcionPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [InscripcionPage]
})
export class InscripcionPageModule {

  public getInscripcion() {
    return fetch('http://localhost:3000/dbo_inscripcion/11').then(response => response.json );
  }
}
