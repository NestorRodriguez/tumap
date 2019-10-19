import { Component, OnInit } from '@angular/core';
import { JfService } from '../../Services/estadoVias/jf.service';

@Component({
  selector: 'app-mapavias',
  templateUrl: './mapavias.page.html',
  styleUrls: ['./mapavias.page.scss'],
})
export class MapaviasPage implements OnInit {

  lat = 4.60972222222;
  lng = -74.0816666667;

  almacenamiento: any;

  constructor(private servicio: JfService) {}

  ngOnInit() {
    if (navigator)
    {
    navigator.geolocation.getCurrentPosition( pos => {
        this.lng = +pos.coords.longitude;
        this.lat = +pos.coords.latitude;
      });
    }
    this.almacenamiento = this.servicio.enviarDatos();
    console.log('Esto es de la anterior', this.almacenamiento);
  }

}
