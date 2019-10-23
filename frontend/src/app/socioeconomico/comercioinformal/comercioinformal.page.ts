import { Component } from '@angular/core';
import { AlertController } from '@ionic/angular';
import { Router } from '@angular/router';
import { Camera, CameraOptions } from '@ionic-native/camera/ngx';

@Component({
  selector: 'app-comercioinformal',
  templateUrl: './comercioinformal.page.html',
  styleUrls: ['./comercioinformal.page.scss'],
})
export class ComercioinformalPage {
  foto: string;
  servicios;
  negocio;
  frecuencia;
  horarios;
  constructor(public alertController: AlertController, private router: Router,private camera: Camera) { }

  async presentAlert() {
    const alert = await  this.alertController.create({
      header: 'La informacion ha sido enviada.',
      message: 'Puede continuar con el proceso de localizar otros comercios formales e informales.',
      buttons:[
        {
          text: 'Otro comercio',
          role: 'cancel',
          cssClass: 'secondary',
          handler: () => {
            console.log('Confirm tipocomercio');
            this.router.navigate(['/', 'tipocomercio']);
          }
        }, 
           {
            text: 'Inicio',
            handler: () => {
            console.log('Confirm home');
            this.router.navigate(['/', 'home']);
            }
          }
      ]
    });

    await alert.present();
  }
  hacerFoto() {
    const options: CameraOptions = {
      quality:100,
      destinationType: this.camera.DestinationType.DATA_URL,
      encodingType:this.camera.EncodingType.JPEG,
      mediaType:this.camera.MediaType.PICTURE,
      sourceType:this.camera.PictureSourceType.CAMERA,
      correctOrientation: true,
      
    };
    this.camera.getPicture(options)
    .then((imageData) => {
      this.foto = 'data:image/jpeg;base64,' + imageData;
    }, (err) => {
      console.log(err);
    });
  }

  enviar(){
    const model = {
      imagen: this.foto,
      inforServicios: this.servicios,
      infoNegocio: this.negocio,
      infoFrecuencia: this.frecuencia,
      inforHorarios: this.horarios
    }
    // this.servicios.guardarComercio(model).subscribe()
  }
}
