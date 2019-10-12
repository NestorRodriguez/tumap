import { Component, OnInit } from '@angular/core';

import { Marcador } from 'src/app/models/dbo/Marcador';
import { ActivatedRoute } from '@angular/router';


@Component({
  selector: 'app-ubicacion',
  templateUrl: './ubicacion.page.html',
  styleUrls: ['./ubicacion.page.scss'],
})
export class UbicacionPage implements OnInit {

  lat: number;
  lng: number;
  posicion: string;
  isValid = false;

  marcadores: Marcador[] = [];

  constructor( private activedRoute: ActivatedRoute) { }

  ngOnInit() {
    this.posicion = this.activedRoute.snapshot.paramMap.get('id');
    if ( this.posicion.length > 0) {
      this.lat = Number( this.posicion.split(',')[0]);
      this.lng = Number( this.posicion.split(',')[1] );
      console.log(this.lat);
      console.log(this.lng);
      this.ingresarMarcador(this.lat, this.lng, '', '');
    }
  }

  ingresarMarcador(lat, lng, title, description) {
    const nuevoMarcador = new Marcador(lat, lng, title, description);
    this.posicion = nuevoMarcador.lat.toString() + ',' + nuevoMarcador.lng.toString();
    console.log(this.posicion);
    this.marcadores[0] = nuevoMarcador;
    console.log('Ingreso Marcador');
    console.log(nuevoMarcador);
  }

  agregarMarcador(evento) {
    this.ingresarMarcador(parseFloat(evento.coords.lat), parseFloat(evento.coords.lng), evento.coords.title, evento.coords.description);
    console.log('Ingreso agm Agregar-Marcador');
  }

}
