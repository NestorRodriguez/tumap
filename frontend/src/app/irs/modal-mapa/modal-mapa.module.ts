import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { ModalMapaPage } from './modal-mapa.page';
import { AgmCoreModule } from '@agm/core';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        IonicModule,
        AgmCoreModule.forRoot({
            apiKey: 'AIzaSyB2g5cFRZ6Cr6ozLb9hv6kow_Id066HQmo'
        })
    ],
  declarations: [ModalMapaPage]
})
export class ModalMapaPageModule {}
