import { Component, OnInit } from '@angular/core';
import { ModalController, Platform } from '@ionic/angular';
import { Geolocation, Geoposition } from '@ionic-native/geolocation/ngx';

@Component({
  selector: 'app-mapa',
  templateUrl: './mapa.page.html',
  styleUrls: ['./mapa.page.scss'],
})
export class MapaPage implements OnInit {  
  lat = 4.60972222222;
  lng = -74.0816666667;
  icon;
  
  constructor(private modalCtrl: ModalController,
              private geolocation: Geolocation,
              private platform: Platform) {
          
      this.icon = {
        url: '/assets/LOGO VERDE.svg',
        scaledSize: {
        width: 35,
        height: 35
      }
    };
  }

  getGeolocation() {
    console.log('getGeolocation');
    this.geolocation.getCurrentPosition()
        .then((geoposition: Geoposition) => {
          console.log('getGeolocation: ');
          console.log(geoposition);
          this.lat = geoposition.coords.latitude;
          this.lng = geoposition.coords.longitude;
        })
        .catch(error => console.log(error));
  }

  ngOnInit() {
    if (navigator)
    {
    navigator.geolocation.getCurrentPosition( pos => {
        this.lng = +pos.coords.longitude;
        this.lat = +pos.coords.latitude;
      });
    }
  }

  ionViewDidLoad() {
    console.log('getGeolocation');
    this.platform.ready().then(() => {
      this.getGeolocation();
    });
  }

  toFloat(value) {
    return parseFloat(value);
  }

  closeModal() {
    this.modalCtrl.dismiss({
      ubicacion: {lat: this.lat, lng: this.lng}
    });
  }

  setMarker(evento) {
    this.lat = this.toFloat(evento.coords.lat);
    this.lng = this.toFloat(evento.coords.lng);
  }

}
