import { Component, OnInit, Input } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ObtenerdataService } from '../../Services/inventario de suelos/obtenerdata.service';
import { Storage } from '@ionic/storage';
import { Marcador } from '../class';

@Component({
  selector: 'app-usosueloshome',
  templateUrl: './usosueloshome.page.html',
  styleUrls: ['./usosueloshome.page.scss'],
})
export class UsosueloshomePage implements OnInit {
  @Input()
  dataUser: any;
  polygon: boolean;
  poligonoPrincipal: Array<any> = [];
  lat = 4.60972222222;
  lng = -74.0816666667;
  latA: number;
  latB: number;
  lngA: number;
  lngB: number;
  marcadores: Marcador[] = [];
  constructor(private obtenerData: ObtenerdataService,
              private storage: Storage) { }

  ngOnInit() {
    if (navigator) {
      navigator.geolocation.getCurrentPosition( pos => {
        this.lng = +pos.coords.longitude;
        this.lat = +pos.coords.latitude;
        this.ingresarMarcador(this.lat, this.lng);
      });
    }
    this.dataUser = this.obtenerData.enviarData();
    console.log( 'DATOS', this.dataUser );
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
  

  }
  ingresarMarcador(lat, lng) {
    const nuevoMarcador = new Marcador(lat, lng);
    this.marcadores.push(nuevoMarcador);
  }

  public agregarMarcador(evento) {
    this.ingresarMarcador(parseFloat(evento.coords.lat), parseFloat(evento.coords.lng));
    this.storage.set('poligono', JSON.stringify(this.marcadores));
    if (this.marcadores.length >= 4 ) {
      this.polygon = true;
    } else {
      this.polygon = false;
    }
  }
}



