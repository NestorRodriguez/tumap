import {Component, OnInit, OnDestroy} from '@angular/core';
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

  constructor(private activatedRoute: ActivatedRoute,
              private navCtrl: NavController,
              private modalCtrl: ModalController,
              private alertCtrl: AlertController,
              private toastCtrl: ToastController,
              private router: Router,
              private networkInterface: NetworkInterface,
              private camera: Camera,
              private activedRoute: ActivatedRoute) {
  }

  ngOnDestroy(): void {
    console.log('ngOnDestroy');
  }

  ngOnInit() {
    this.idItem = this.activedRoute.snapshot.paramMap.get('id');
    this.idCategoriaItem = this.activedRoute.snapshot.paramMap.get('categoria');
    console.log(this.idItem)
    console.log(this.idCategoriaItem)

    this.model = {
      codItem: this.idItem,
      fecha: "2019-10-20",
      estadoItem: null,
      descripcion: null,
      tipo: null,
      clasePoste: null,
      idIrsMaterial: null,
      identificador: null,
      tieneLampara: false,
      tieneTransformador: false,
      idIrsOperador: null,
      idIrsEstadoRed: null,
      ubicacion: null,
      lat: null,
      lng: null,
      imagen: 'assets/img_jyd/foto_calle.png',
      // imagen: null,
      pk_id_registro: 1,
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
    console.log(ubicacion);
    this.model.ubicacion = ubicacion;
    this.model.lat = ubicacion.lat;
    this.model.lng = ubicacion.lng;
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

  save() {
    console.log("IDUSUARIO : " + this.model.idUsuario);
    console.log("ITEM : " + this.model.codItem);
    console.log("ESTADOITEM : " + this.model.estadoItem);
    // console.log("UBICACIÓN : " + JSON.stringify(this.model.ubicacion));
    console.log("LATITUD : " + JSON.stringify(this.model.lat));
    console.log("LONGITUD : " + JSON.stringify(this.model.lng));
    console.log("IMAGEN : " + this.model.imagen);
    console.log("DESCRIPCIÓN : " + this.model.descripcion);
    localStorage.setItem('infoItem', JSON.stringify(this.model));
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
