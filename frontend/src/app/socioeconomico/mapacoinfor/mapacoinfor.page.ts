import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-mapacoinfor',
  templateUrl: './mapacoinfor.page.html',
  styleUrls: ['./mapacoinfor.page.scss'],
})
export class MapacoinforPage implements OnInit {

  lat = 4.60972222222;
  lng = -74.0816666667;

  constructor() { }

  ngOnInit() {
    if (navigator)
    {
    navigator.geolocation.getCurrentPosition( pos => {
        this.lng = +pos.coords.longitude;
        this.lat = +pos.coords.latitude;
      });
    }
  }

  setMarker(evento) {
    this.lat = +evento.coords.lat;
    this.lng = +evento.coords.lng;
  }

}