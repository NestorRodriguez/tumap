import { Component} from '@angular/core';
import { AlertController } from '@ionic/angular';
import { Router } from '@angular/router';


@Component({
  selector: 'app-encuestasocial',
  templateUrl: './encuestasocial.page.html',
  styleUrls: ['./encuestasocial.page.scss'],
})
export class EncuestasocialPage  {

  constructor(private alertController: AlertController, private router: Router) { }

  async presentAlert() {
    const alert = await  this.alertController.create({
    header: 'La informacion ha sido enviada.',
    message: 'Puede continuar con el proceso de localizar otros comercios formales e informales.',
    buttons:[
        {
          text: 'Cancel',
          role: 'cancel',
          cssClass: 'secondary',
          handler: () => {
            console.log('Confirm Cancel');
          }
        }, {
          text: 'Ok',
          handler: () => {
            console.log('Confirm Ok');
            this.router.navigate(['/', 'tipocomercio']);
          }
        }
      ]
    });

    await alert.present();
  }
}
