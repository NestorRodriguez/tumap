import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Routes, RouterModule } from '@angular/router';
import { Component, OnInit } from '@angular/core';

import { IonicModule } from '@ionic/angular';

import { EtnobotanicaPage } from './etnobotanica.page';

const routes: Routes = [
  {
    path: '',
    component: EtnobotanicaPage
  }
];

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    RouterModule.forChild(routes)
  ],
  declarations: [EtnobotanicaPage]
})
export class EtnobotanicaPageModule {}
