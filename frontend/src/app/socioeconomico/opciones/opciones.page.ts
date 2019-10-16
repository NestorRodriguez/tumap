import { Component } from '@angular/core';
import { AlertController } from '@ionic/angular';
import {ActionSheetController} from '@ionic/angular';

@Component({
  selector: 'app-opciones',
  templateUrl: './opciones.page.html',
  styleUrls: ['./opciones.page.scss'],
})
export class OpcionesPage  {

  constructor(private alertController: AlertController, private actionSheet: ActionSheetController) {
  }

  async presentAlert() {
        const alert = await  this.alertController.create({
        header: 'La informacion ha sido enviada.',
        message: 'Puede continuar con el proceso de localizar otros comercios formales e informales.',
        buttons: [{
          text: 'Otro Comercio',
          role: 'cancel',
          handler: () => {
            console.log('You clicked me');

          }},
{
  text: 'Inicio',
  cssClass: 'secondary',
  handler: () => {
    console.log('Second Hanlder');
  }
        }
      ]
      });

      await alert.present();

      }
}
