import { Component, OnInit } from '@angular/core';

import { Marcador } from 'src/app/models/dbo/Marcador';
import { NavParams, ModalController } from '@ionic/angular';
import { MouseEvent } from '@agm/core';



@Component({
  selector: 'app-ubicacion',
  templateUrl: './ubicacion.page.html',
  styleUrls: ['./ubicacion.page.scss'],
})
export class UbicacionPage implements OnInit {

  lat: number;
  lng: number;
  posicion: string;
  titulo: string;
  descripcion: string;
  isValid = false;
  protected map: any;


  marcadores: Marcador[] = [];

  constructor(private navParams: NavParams, private modalCtrl: ModalController) { }

  ngOnInit()
  {
   this.posicion = this.navParams.get('custom_id');
    this.titulo = this.navParams.get('custom_titulo');
    this.descripcion = this.navParams.get('custom_descripcion');

    this.lat = Number(this.posicion.split(',')[0]);
    this.lng = Number(this.posicion.split(',')[1]);
    console.log(this.lat);
    console.log(this.lng);
    console.log(this.posicion );
    this.ingresarMarcador(this.lat, this.lng, this.titulo, this.descripcion);
  }

  // mapReady($event) {
  //   this.map = $event;
  //   console.log(this.map);
  //   this.map.setCenter({ lat: this.map.coords.lat, lng: this.map.coords.lng });
  //   this.lat = this.map.coods.lat; this.lng = this.map.coods.lng;
  // }

  ingresarMarcador(lat, lng, title, description) {
    this.lat = lat; this.lng = lng;
    console.log('ingresarMarcador coordenadas: ' + lat + ' ' + lng );

    const nuevoMarcador = new Marcador(lat, lng, title, description);
    this.posicion = nuevoMarcador.lat.toString() + ',' + nuevoMarcador.lng.toString();
    this.marcadores[0] = nuevoMarcador;
  }

  agregarMarcador($evento) {
    // this.map = $evento;
    // console.log(this.map);
    console.log('agregarMarcador coordenadas: ' + $evento.coords.lat + ' ' + $evento.coords.lng );
    this.ingresarMarcador($evento.coords.lat, $evento.coords.lng, '', '');
  }

  // clickedMarker( $event: MouseEvent, label: string, index: number) {
  //   // this.map.setCenter({ lat: $event.coords.lat, lng: $event.coords.lng });
  //   console.log('clicked', $event, { lat: $event.coords.lat, lng: $event.coords.lng });
  //   console.log(`clicked the marker: ${label || index}`);
  // }

  // markerDragEnd(m: Marcador, $event: MouseEvent) {
  //   console.log('dragEnd', m, $event);
  // }

  closeModal() {
    this.modalCtrl.dismiss({
      posicion: this.posicion
    });
  }
  // fin
}
