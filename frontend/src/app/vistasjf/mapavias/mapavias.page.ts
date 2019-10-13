import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-mapavias',
  templateUrl: './mapavias.page.html',
  styleUrls: ['./mapavias.page.scss'],
})
export class MapaviasPage implements OnInit {

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

}
