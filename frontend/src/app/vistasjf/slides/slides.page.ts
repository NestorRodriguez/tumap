import {Component, OnInit, OnDestroy} from '@angular/core';
import {JfService} from '../../Services/estadoVias/jf.service';
import {NavController, AlertController, ModalController} from '@ionic/angular';
import {MapaPage} from '../mapa/mapa.page';
import {Router, ActivatedRoute} from '@angular/router';
import {NetworkInterface} from '@ionic-native/network-interface/ngx';
import {Camera, CameraOptions} from '@ionic-native/camera/ngx';
import {ToastController} from '@ionic/angular';

@Component({
  selector: 'app-slides',
  templateUrl: './slides.page.html',
  styleUrls: ['./slides.page.scss'],
})

export class SlidesPage implements OnInit {
  idItem = null
  idCategoriaItem = null
  materiales: any = [];
  operadores: any = [];
  estados: any = [];
  model: any = {};
  complete = false;
  loading = false;
  estadoVias: any[];

  constructor(private servicio: JfService,
              private activatedRoute: ActivatedRoute,
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
    this.servicio.consulta('detalle_vias').subscribe(detalleVias => {
      this.estadoVias = detalleVias;
      console.log(this.estadoVias);
    });

    this.idItem = this.activedRoute.snapshot.paramMap.get('id');
    this.idCategoriaItem = this.activedRoute.snapshot.paramMap.get('categoria');
    console.log(this.idItem)
    console.log(this.idCategoriaItem)

    this.model = {
      direccion: null,
      detalle: null,
      ubicacion: null,
      lat: null,
      lng: null,
      // imagen: 'assets/img_jyd/foto_calle.png',
      imagen: null,
      idUsuario: 1
    };
  }

  seleccion(valor:any) {
    this.model.detalle = valor.detail.value;
    // console.log('este es', this.model);
  };

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
    console.log("DIRECCION : " + this.model.direccion);
    console.log("DETALLE : " + this.model.detalle);
    console.log("UBICACIÓN : " + JSON.stringify(this.model.ubicacion));
    console.log("IMAGEN : " + this.model.imagen);
    localStorage.setItem('infoVia', JSON.stringify(this.model));
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
