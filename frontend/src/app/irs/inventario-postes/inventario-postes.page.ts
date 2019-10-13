import { Component, OnInit, OnDestroy } from '@angular/core';
import {InventarioRedesSecasService} from '../../Services/irs/inventario-redes-secas.service';
import {AlertController, ModalController} from '@ionic/angular';
import {ModalMapaPage} from '../modal-mapa/modal-mapa.page';
import {Router} from '@angular/router';
import { NetworkInterface } from '@ionic-native/network-interface/ngx';
import { Camera, CameraOptions } from '@ionic-native/camera/ngx';
import { Geolocation, Geoposition } from '@ionic-native/geolocation/ngx';

@Component({
  selector: 'app-inventario-postes',
  templateUrl: './inventario-postes.page.html',
  styleUrls: ['./inventario-postes.page.scss'],
})
export class InventarioPostesPage implements OnInit, OnDestroy {

  materiales: any = [];
  estados: any = [];
  model: any = {};

  constructor(private service: InventarioRedesSecasService,
              private modalCtrl: ModalController,
              private alertCtrl: AlertController,
              private router: Router,
              private networkInterface: NetworkInterface,
              private camera: Camera,
              private geolocation: Geolocation) {

    this.networkInterface.getWiFiIPAddress()
        .then(address => {
          console.log(`IP: ${address.ip}, Subnet: ${address.subnet}`);
          this.model.ip = address.ip;
        })
        .catch(error => console.error(`Unable to get IP: ${error}`));

    this.networkInterface.getCarrierIPAddress()
        .then(address => {
          console.log(`IP: ${address.ip}, Subnet: ${address.subnet}`);
          if (!this.model.ip) {
            this.model.ip = address.ip;
          }
        })
        .catch(error => console.error(`Unable to get IP: ${error}`));
  }

  ngOnInit() {
    this.service.getTiposMateriales().subscribe(data => {
      this.materiales = data;
    });

    this.service.getEstadosRedes().subscribe(data => {
      this.estados = data;
    });

    this.model = {
      idIrsMateriales: null,
      numero: null,
      idIrsEstadoRed: null,
      tieneLampara: false,
      tieneTransformador: null,
      ubicacion: null,
      imagen: null,
    };
    console.log('ngOnInit');
  }

  ngOnDestroy(): void {
    console.log('ngOnDestroy');
  }

  async loadModalMap() {
   const modal = await this.modalCtrl.create({
     component: ModalMapaPage,
     componentProps: {}
   });
   await modal.present();
   const { data: { ubicacion } } = await modal.onDidDismiss();
   this.model.ubicacion = ubicacion;
  }

  save() {
    if (this.model.idIrsMateriales && this.model.idIrsEstadoRed && this.model.ubicacion && this.model.imagen) {

    }
  }

  async cancel() {
      const alert = await this.alertCtrl.create({
          header: 'Cancelar registro',
          message: '¿Está seguro de cancelar el registro actual?',
          buttons: [
              {
                  text: 'No',
                  role: 'cancel',
                  cssClass: 'secondary',
                  handler: (blah) => {
                      console.log('Confirm Cancel: blah');
                  }
              }, {
                  text: 'Si',
                  handler: () => {
                      this.router.navigateByUrl('/irs-inicio');
                  }
              }
          ]
      });
      await alert.present();
  }

  loadCamera() {
    const options = {
      destinationType: this.camera.DestinationType.DATA_URL
    };
    this.camera.getPicture(options)
        .then(imageData => {
          this.model.imagen = 'data:image/jpeg;base64,' + imageData;
        })
        .catch(error => {
          console.log(error);
        });
  }

}
