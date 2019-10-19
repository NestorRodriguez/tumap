import { Component, OnInit, Input } from '@angular/core';
import { ObtenerdataService } from '../../Services/inventario de suelos/obtenerdata.service';
import { Storage } from '@ionic/storage';
import { Marcador } from '../class';
import { ModalController } from '@ionic/angular';
import { ModalSuelosPage } from '../modal-suelos/modal-suelos.page';
import { InvsuelosService } from 'src/app/Services/inventario de suelos/invsuelos.service';

@Component({
  selector: 'app-usosueloshome',
  templateUrl: './usosueloshome.page.html',
  styleUrls: ['./usosueloshome.page.scss'],
})
export class UsosueloshomePage implements OnInit {
  tipoArea: string;
  // Area construida, Area de cultivo, Area de ganadería, Area de reserva, Area comúm
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
  constructor(private obtenerData: ObtenerdataService,
              private service: InvsuelosService,
              private storage: Storage,
              public modal: ModalController) { }

  ngOnInit() {
    if (navigator) {
      navigator.geolocation.getCurrentPosition( pos => {
        this.lng = +pos.coords.longitude;
        this.lat = +pos.coords.latitude;
        this.ingresarMarcadorSubpoligonos(this.lat, this.lng);
      });
    }
    this.dataUser = this.obtenerData.enviarData();
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
  public async cerrarPoligono() {
    // if ( this.poligonoCerrado  ) {
      const modal: any = await this.presentModal();
      this.arraySubPoligono.push({
        poligono: this.marcadoresSubpoligono,
        color: modal.data.HEX
      });
      this.storage.set('subpoligono', JSON.stringify(this.arraySubPoligono));
      this.checkmarkEnabled = true;
      this.marcadoresSubpoligono = [];
      this.polygonSub = true;
  //   } else {
  //     this.poligonoCerrado = true;
  // }
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
    this.storage.clear();

  }
  // Agregar ubicación inicial al arreglo marcador
//   ingresarMarcador(lat, lng) {
//     const nuevoMarcador = new Marcador(lat, lng);
//     this.marcadores.push(nuevoMarcador);
// }
//   // Agregar puntos al local storage poligono
//   public agregarMarcador(evento) {
//     if (!this.poligonoCerrado) {
//       this.ingresarMarcador(parseFloat(evento.coords.lat), parseFloat(evento.coords.lng));
//       this.storage.set('poligono', JSON.stringify(this.marcadores));
//       if (this.marcadores.length >= 3 ) {
//         this.polygon = true;
//       } else {
//         this.polygon = false;
//       }
//     } else {
//       this.agregarSubpoligonos(evento);
//     }
//   }
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
    this.ingresarMarcadorSubpoligonos(parseFloat(evento.coords.lat), parseFloat(evento.coords.lng));
    // this.polygonSub = false;
  }

  // Llamado del modal
  public async presentModal() {
    const modal = await this.modal.create({
      component: ModalSuelosPage
    });
    await modal.present();
    const dataModal = await modal.onWillDismiss();
    return dataModal;
    }

    public saveData() {
      console.log('@@@', this.idRegistro);
      const regData = {
        nombrePropietario: this.dataUser.nombrepropietario,
        nombrePredio: this.dataUser.nombrepredio,
        area: this.dataUser.area,
        direccion: this.dataUser.direccion,
        poligono: JSON.stringify(this.arraySubPoligono),
        idRegistro: this.idRegistro
      };
      console.log(regData);
      this.service.saveFormData(regData).subscribe( res => {
       console.log('RESPUESTA', res);
      });
    }
}
