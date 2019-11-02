import { Component, OnInit, Input } from '@angular/core';
import { ObtenerdataService } from '../../Services/inventario de suelos/obtenerdata.service';
import { Storage } from '@ionic/storage';
import { Marcador } from '../class';
import { ModalController, AlertController } from '@ionic/angular';
import { ModalSuelosPage } from '../modal-suelos/modal-suelos.page';
import { ModalSuelosOkPage } from '../modal-suelos-ok/modal-suelos-ok.page';
import { InvsuelosService } from 'src/app/Services/inventario de suelos/invsuelos.service';
import { isUndefined } from 'util';
import { isEmpty } from 'rxjs/operators';
import { Router } from '@angular/router';
import { Geolocation, Geoposition } from '@ionic-native/geolocation/ngx';
import { LoginService } from '../../Services/login/login.service';


@Component({
  selector: 'app-usosueloshome',
  templateUrl: './usosueloshome.page.html',
  styleUrls: ['./usosueloshome.page.scss'],
})
export class UsosueloshomePage implements OnInit {
  tipoArea: string;
  dataUser: any;
  polygon: boolean;
  polygonSub: boolean;
  poligonoCerrado: boolean;
  poligonColor = '#5cb85c';
  poligonoPrincipal: Array<any> = [];
  lat: number ;
  lng: number;
  arraySubPoligono: any[] = [];
  arrayColores: any[] = [];
  marcadores: Marcador[] = [];
  marcadoresSubpoligono: any[] = [];
  subPoligonoCerrado: boolean;
  poligonoInicial: boolean;
  checkmarkEnabled: boolean;
  idRegistro: any[];
  idUser: any;
  constructor(private obtenerData: ObtenerdataService,
              private service: InvsuelosService,
              private storage: Storage,
              public modal: ModalController,
              public modalOk: ModalController,
              public alertController: AlertController,
              private router: Router,
              private geolocation: Geolocation,
              private serviceLogin: LoginService, ) { }

  ngOnInit() {
    this.getGeolocation();
    this.dataUser = this.obtenerData.enviarData();
    // this.dataUser = this.serviceLogin.userInfo();
    console.log('ID Usuario##', this.dataUser);
    ( isUndefined(this.dataUser)) ? this.router.navigateByUrl('formulariosuelos') :
    this.service.getData('usosuelosid').subscribe( Id => { this.idRegistro = Id[0].lastID;
    });
    try {
    this.storage.get('subpoligono').then(( subpoligonos => {
      const subpoligono: Marcador = JSON.parse(subpoligonos);
      this.polygonSub = true;
      // tslint:disable-next-line: prefer-const
      // tslint:disable-next-line: forin
      for (const i in subpoligono) {
        this.marcadoresSubpoligono.push(subpoligono[i].poligono);
        this.arraySubPoligono.push({
          poligono: subpoligono[i].poligono,
          color: subpoligono[i].color });
      }
    }));
  } catch (error) {
    console.log(error);
     }
  }

  getGeolocation() {
    this.geolocation.getCurrentPosition()
        .then((location: Geoposition) => {
          this.lat = location.coords.latitude;
          this.lng = location.coords.longitude;
          this.ingresarMarcadorSubpoligonos(this.lat, this.lng);
        })
        .catch(error => console.log(error));
  }
  public async cerrarPoligono() {
      const modal: any = await this.presentModal();
      this.arraySubPoligono.push({
        poligono: this.marcadoresSubpoligono,
        color: modal.data.HEX
      });
      this.storage.set('subpoligono', JSON.stringify(this.arraySubPoligono));
      this.checkmarkEnabled = true;
      this.marcadoresSubpoligono = [];
      this.polygonSub = true;

  }

  public borrarPoligono() {
    this.marcadores.length = 0;
    this.poligonoPrincipal.length = 0;
    this.poligonoCerrado = false;
    this.polygon = false;
    this.arraySubPoligono.length = 0;
    this.subPoligonoCerrado = false;
    this.marcadoresSubpoligono.length = 0;
    this.polygonSub = false;
    this.storage.remove('subpoligono');

  }
  // Ingreso de puntos al array de subpoligonos
  ingresarMarcadorSubpoligonos(lat, lng) {
      const nuevoMarcador = new Marcador(lat, lng);
      this.marcadoresSubpoligono.push(nuevoMarcador);
      if (this.marcadoresSubpoligono.length > 3 ) {
      this.polygonSub = true;
      }
    }
  // Almacenamiento en storage de subpoligonos
  public agregarSubpoligonos(evento) {
    this.checkmarkEnabled = false;
    this.ingresarMarcadorSubpoligonos(parseFloat(evento.coords.lat), parseFloat(evento.coords.lng));
  }

  // Llamado del modal tipo de suelos
  public async presentModal() {
    const modal = await this.modal.create({
      component: ModalSuelosPage
    });
    await modal.present();
    const dataModal = await modal.onWillDismiss();
    return dataModal;
    }
    // Llamado del modal de confirmación de registro
  public async presentModalOk() {
    const modal = await this.modal.create({
      component: ModalSuelosOkPage
    });
    await modal.present();
    const dataModal = await modal.onWillDismiss();
    }

    public saveData() {
      try {
      const regData = {
        nombrePropietario: this.dataUser.nombrepropietario,
        nombrePredio: this.dataUser.nombrepredio,
        area: this.dataUser.area,
        direccion: this.dataUser.direccion,
        poligono: JSON.stringify(this.arraySubPoligono),
        idRegistro: this.idRegistro,
        idUser: this.idUser
      };
      this.service.saveFormData(regData).subscribe( res => {
        this.presentModalOk();
      }, error => {
      } );

      } catch (error) {
        console.log(`Ocurrió un error ${ error }`);
      }
    }

    // Muestreo del alert
    public async  presentAlert() {
      const alert = await this.alertController.create({
        header: '¿Guardar estos registros?',
        message: '¿Confirma que desea guardar estos registros?',
        buttons: [
          {
            text: 'Cancelar',
            role: 'cancel',
            cssClass: 'secondary',
            handler: (blah) => {
              console.log('Confirm Cancel: blah');
            }
          }, {
            text: 'Guardar',
            handler: () => {
              this.saveData();
            }
          }
        ]
    });
      await alert.present();
  }
}
