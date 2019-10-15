import { Component, OnInit, Input } from '@angular/core';
import { ObtenerdataService } from '../../Services/inventario de suelos/obtenerdata.service';
import { Storage } from '@ionic/storage';
import { Marcador } from '../class';
import { ModalController } from '@ionic/angular';
import { ModalSuelosPage } from '../modal-suelos/modal-suelos.page';
import { present } from '@ionic/core/dist/types/utils/overlays';

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
  latA: number;
  latB: number;
  lngA: number;
  lngB: number;
  arraySubPoligono: any[] = [];
  arrayColores: any[] = [];
  marcadores: Marcador[] = [];
  marcadoresSubpoligono: any[] = [];
  subPoligonoCerrado: boolean;
  constructor(private obtenerData: ObtenerdataService,
              private storage: Storage,
              public modal: ModalController) { }

  ngOnInit() {
    if (navigator) {
      navigator.geolocation.getCurrentPosition( pos => {
        this.lng = +pos.coords.longitude;
        this.lat = +pos.coords.latitude;
        this.ingresarMarcador(this.lat, this.lng);
      });
    }
    this.dataUser = this.obtenerData.enviarData();
    this.storage.get('poligono').then((poligono => {
      const marcador: Marcador = JSON.parse(poligono);
      // tslint:disable-next-line: prefer-const
      // tslint:disable-next-line: forin
      for (const i in marcador) {
        this.marcadores.push(marcador[i]);
      }
      this.poligonoPrincipal = this.marcadores;
    }));
  }
  public cerrarPoligono() {
    if ( this.poligonoCerrado  ) {
      this.presentModal();
      this.subPoligonoCerrado = true;
      this.arraySubPoligono.push(this.marcadoresSubpoligono);
      this.marcadoresSubpoligono = [];
      this.polygonSub = true;
      this.poligonColor = '#d9534f';
    } else {
      this.poligonoCerrado = true;
  }
  }

  public borrarPoligono() {
    this.marcadores = [];
    this.poligonoPrincipal = [];
    this.poligonoCerrado = false;
    this.polygon = false;
  }
  // Agregar ubicación inicial al arreglo marcador
  ingresarMarcador(lat, lng) {
    const nuevoMarcador = new Marcador(lat, lng);
    this.marcadores.push(nuevoMarcador);
}
  // Agregar puntos al local storage poligono
  public agregarMarcador(evento) {
    if (!this.poligonoCerrado) {
      this.ingresarMarcador(parseFloat(evento.coords.lat), parseFloat(evento.coords.lng));
      this.storage.set('poligono', JSON.stringify(this.marcadores));
      if (this.marcadores.length >= 3 ) {
        this.polygon = true;
      } else {
        this.polygon = false;
      }
    } else {
      this.agregarSubpoligonos(evento);
    }
  }
  // Ingreso de puntos al array de subpoligonos
  ingresarMarcadorSubpoligonos(lat, lng) {
      const nuevoMarcador = new Marcador(lat, lng);
      this.marcadoresSubpoligono.push(nuevoMarcador);
      console.log('SubPoligonos', this.arraySubPoligono);
    }
  // Almacenamiento en storage de subpoligonos
  public agregarSubpoligonos(evento) {
    this.ingresarMarcadorSubpoligonos(parseFloat(evento.coords.lat), parseFloat(evento.coords.lng));
    this.storage.set('subpoligono', JSON.stringify(this.marcadoresSubpoligono));
    this.polygonSub = false;
    console.log(this.arraySubPoligono);
  }



  // Llamado del modal
  public async presentModal() {
    const modal = await this.modal.create({
      component: ModalSuelosPage
    });
    await modal.present();
    const data = await modal.onWillDismiss();
    console.log(data);
  }
}

