import { Component, OnInit } from '@angular/core';
import {JfService} from '../../Services/estadoVias/jf.service';
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
  detalleVia = null;

  constructor(private service: JfService,
              private toastCtrl: ToastController,
              private navCtrl: NavController) { }

  ngOnInit() {
    this.registro.push(JSON.parse(localStorage.getItem('infoVia')));
    console.log('fucking item:'+this.registro[0]);
    console.log(this.registro);
    this.service.getDetalleVias(this.registro[0].detalle).subscribe( item => {      
      let json = JSON.parse(JSON.stringify(item));
      console.log(json);
      this.detalleVia = json.detalle;
    }, error => this.errorMessage = error);
  }

  save(){
    console.log(this.registro[0].direccion);
    console.log(this.registro[0].detalle);
    console.log(this.registro[0].lat);
    console.log(this.registro[0].lng);
    console.log(this.registro[0].imagen);
    console.log(this.registro[0].idUsuario);


    this.service.setRegistro(this.registro[0]).subscribe(async (response) => {
      const toast = await this.toastCtrl.create({
        message: 'Registro guardado con éxito',
        color: 'light',
        duration: 1800
      });
      await toast.present();
      await this.navCtrl.navigateBack('/home');
    });
  }

}
