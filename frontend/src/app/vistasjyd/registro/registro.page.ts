import {Component, OnInit, OnDestroy} from '@angular/core';
import {IrsService} from '../../Services/irs/irs.service';
import {NavController, AlertController, ModalController} from '@ionic/angular';
import {MapaPage} from '../mapa/mapa.page';
import {Router, ActivatedRoute} from '@angular/router';
import {NetworkInterface} from '@ionic-native/network-interface/ngx';
import {Camera, CameraOptions} from '@ionic-native/camera/ngx';
import {ToastController} from '@ionic/angular';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.page.html',
  styleUrls: ['./registro.page.scss'],
})
export class RegistroPage implements OnInit {
  idItem = null
  idCategoriaItem = null
  materiales: any = [];
  operadores: any = [];
  estados: any = [];
  model: any = {};
  complete = false;
  loading = false;

  constructor(private service: IrsService,
              private activatedRoute: ActivatedRoute,
              private navCtrl: NavController,
              private modalCtrl: ModalController,
              private alertCtrl: AlertController,
              private toastCtrl: ToastController,
              private router: Router,
              private networkInterface: NetworkInterface,
              private camera: Camera,
              private activedRoute: ActivatedRoute) {

    this.networkInterface.getWiFiIPAddress()
      .then(address => {
        this.model.ip = address.ip;
      })
      .catch(error => console.error(`Unable to get IP: ${error}`));

    this.networkInterface.getCarrierIPAddress()
      .then(address => {
        if (!this.model.ip) {
          this.model.ip = address.ip;
        }
      })
      .catch(error => console.error(`Unable to get IP: ${error}`));
  }

  ngOnDestroy(): void {
    console.log('ngOnDestroy');
  }

  isDisabled() {
    if (this.model.tipo === 'Postes') {
      return (!this.model.idIrsMaterial || !this.model.idIrsEstadoRed || !this.model.ubicacion || !this.model.imagen);
    } else if (this.model.tipo === 'Torres' || this.model.tipo === 'Antenas' || this.model.tipo === 'Armarios') {
      return (!this.model.idIrsEstadoRed || !this.model.ubicacion || !this.model.imagen);
    } else {
      return true;
    }
  }

  ngOnInit() {
    this.idItem = this.activedRoute.snapshot.paramMap.get('id');
    this.idCategoriaItem = this.activedRoute.snapshot.paramMap.get('categoria');
    console.log(this.idItem)
    console.log(this.idCategoriaItem)

    this.model = {
      tipo: null,
      clasePoste: null,
      idIrsMaterial: null,
      identificador: null,
      tieneLampara: false,
      tieneTransformador: false,
      idIrsOperador: null,
      idIrsEstadoRed: null,
      ubicacion: null,
      imagen: null,
      idUsuario: 1,
      idIrsOperadorCelular: null,
      idIrsEstadoRedCelular: null,
      ip: null
    };
  }

  async loadModalMap() {
    const modal = await this.modalCtrl.create({
      component: MapaPage,
      componentProps: {}
    });
    await modal.present();
    const {data: { ubicacion }} = await modal.onDidDismiss();
    this.model.ubicacion = ubicacion;
  }

  // async loadModalPoll() {
  //   const modal = await this.modalCtrl.create({
  //     component: ModalEncuestaPage,
  //     componentProps: {}
  //   });
  //   await modal.present();
  //   const {data: { encuesta }} = await modal.onDidDismiss();
  //   this.model.idIrsOperadorCelular = encuesta.idIrsOperadorCelular;
  //   this.model.idIrsEstadoRedCelular = encuesta.idIrsEstadoRedCelular;
  //   this.complete = (this.model.idIrsOperadorCelular && this.model.idIrsEstadoRedCelular) ? true : false;
  // }

  // save() {
  //   if (!this.complete) {
  //     this.loadModalPoll();
  //   } else {
  //     this.loading = true;
  //     this.service.setInventario(this.model).subscribe(async (response) => {
  //       const toast = await this.toastCtrl.create({
  //         message: 'Encuesta guardada con éxito',
  //         color: 'light',
  //         duration: 1800
  //       });
  //       await toast.present();
  //       await this.navCtrl.navigateBack('/irs-inicio');
  //       this.loading = false;
  //     });
  //   }
  // }

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
            console.log('Salida cancelada...');
          }
        }, {
          text: 'Si',
          handler: () => {
            this.navCtrl.navigateBack('/irs-inicio');
          }
        }
      ]
    });
    await alert.present();
  }

  async loadCamera() {
    const options = {
      quality: 25,
      destinationType: this.camera.DestinationType.DATA_URL,
      encodingType: this.camera.EncodingType.JPEG,
      mediaType: this.camera.MediaType.PICTURE,
      correctOrientation: true,
      cameraDirection: this.camera.Direction.BACK,
    };
    this.model.imagen = 'data:image/jpeg;base64,' + await this.camera.getPicture(options);
  }

}
