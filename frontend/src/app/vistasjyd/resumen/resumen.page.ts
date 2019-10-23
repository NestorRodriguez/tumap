import { Component, OnInit } from '@angular/core';
import { JydService } from '../../Services/api_jyd/jyd.service';
import {NavController, AlertController, ModalController} from '@ionic/angular';
import {ToastController} from '@ionic/angular';

@Component({
  selector: 'app-resumen',
  templateUrl: './resumen.page.html',
  styleUrls: ['./resumen.page.scss'],
})
export class ResumenPage implements OnInit {

  registro: any = [];
  items: any = [];
  errorMessage = '';

  constructor(private service: JydService,
              private toastCtrl: ToastController,
              private navCtrl: NavController) { }

  ngOnInit() {
    this.registro.push(JSON.parse(localStorage.getItem('infoItem')));
    console.log('fucking item:'+this.registro[0].codItem)
    this.service.getDatosItem(this.registro[0].codItem).subscribe( item => {
      console.log(item)
      this.items.push(JSON.parse(JSON.stringify(item)))
    }, error => this.errorMessage = error);
    console.log(this.registro);
    console.log('items devueltos:'+this.items.nombre);
  }

  save() {
    console.log("IDUSUARIO : " + this.registro.idUsuario);
    console.log("ITEM : " + this.registro[0].codItem);
    console.log("ESTADOITEM : " + this.registro[0].estadoItem);
    // console.log("UBICACIÓN : " + JSON.stringify(this.registro[0].ubicacion));
    console.log("LATITUD : " + JSON.stringify(this.registro[0].lat));
    console.log("LONGITUD : " + JSON.stringify(this.registro[0].lng));
    console.log("IMAGEN : " + this.registro[0].imagen);
    console.log("DESCRIPCIÓN : " + this.registro[0].descripcion);
    localStorage.setItem('infoItem', JSON.stringify(this.registro[0]));

    // this.service.setRegistro(this.registro[0]).subscribe(async (response) => {
    //   const toast = await this.toastCtrl.create({
    //     message: 'Encuesta guardada con éxito',
    //     color: 'light',
    //     duration: 1800
    //   });
    //   await toast.present();
    //   await this.navCtrl.navigateBack('/');
    // });

    this.service.setRegistro(this.registro[0]).subscribe(async (response) => {
      this.service.setHistorico(this.registro[0]).subscribe(async (response) => {
        const toast = await this.toastCtrl.create({
          message: 'Registro guardado con éxito',
          color: 'light',
          duration: 1800
        });
        await toast.present();
        await this.navCtrl.navigateBack('/');
      });
    });
  }

}
