import { Component, OnInit } from '@angular/core';
import { Marcador } from '../models/colinda/marcador';

@Component({
  selector: 'app-colinda',
  templateUrl: './colinda.page.html',
  styleUrls: ['./colinda.page.scss'],
})
export class ColindaPage implements OnInit {

  marcadores : Marcador[] = [];
  lat = 4.60972222222;
  lng = -74.0816666667;
  paths: Array<any> = [];
  polygon = false;
  latA: number;
  latB: number;
  lngA: number;
  lngB: number;
  polyline = false;
  icon: any = {};

  constructor() {}

  ngOnInit()
  {
    this.icon = {
      url: '/assets/LOGO VERDE.svg',
      scaledSize: {
        width: 35,
        height: 35
      }
    }
    /*this.polygon = false;
    this.polyline = false;
    //this.storage.get('marker').then((val) =>
    {
      let marcador : Marcador = JSON.parse(val);
      // tslint:disable-next-line: forin
      for (let i in marcador)
      {
        this.marcadores.push(marcador[i]);
        console.log(this.marcadores);
        if(parseInt(i)<=2)
        {
          this.paths.push(marcador[i]);
        }
        if(parseInt(i)==3)
        {
          this.polygon=true;
          this.latA = (marcador[i].lat);
          this.lngA = (marcador[i].lng);
        }
        if(parseInt(i)==4)
        {
          this.latB = (marcador[4].lat);
          this.lngB = (marcador[4].lng);
          this.polyline = true;
        }
      }
    });*/
  }
  ingresarMarcador(lat, lng, title, description){
    const nuevoMarcador = new Marcador(lat, lng, title, description);
    this.marcadores.push(nuevoMarcador);
  }

  agregarMarcador(evento){
    this.ingresarMarcador(parseFloat(evento.coords.lat), parseFloat(evento.coords.lng), evento.coords.title, evento.coords.description);
    // Almacenamiento en local storage
    // this.storage.set('marker', JSON.stringify(this.marcadores) );
    console.log(this.marcadores.length);
  }

}
