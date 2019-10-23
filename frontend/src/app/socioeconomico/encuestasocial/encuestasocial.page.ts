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
      header: 'Tu encuesta social fue diligenciada y enviada exitosamente.',
      message: 'Ahora puedes continuar con el proceso de localizar los comercios formales e informales en tu ubicación.',
      buttons:[
        {
          text: 'Cancel',
          role: 'cancel',
          cssClass: 'secondary',
          handler: () => {
            console.log('Confirm Cancel');
          }
        }, 
           {
            text: 'Ok',
            handler: () => {
            console.log('Confirm Ok');
            this.router.navigate(['/tipocomercio']);
            }
          }
      ]
    });

    await alert.present();
  }
}
