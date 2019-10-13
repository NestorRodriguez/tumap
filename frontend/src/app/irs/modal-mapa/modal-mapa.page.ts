import { Component, OnInit } from '@angular/core';
import { ModalController, Platform } from '@ionic/angular';
import { Geolocation, Geoposition } from '@ionic-native/geolocation/ngx';

@Component({
  selector: 'app-modal-mapa',
  templateUrl: './modal-mapa.page.html',
  styleUrls: ['./modal-mapa.page.scss'],
})
export class ModalMapaPage implements OnInit {
  lat = 4.6586508;
  lng = -74.0669778;
  zoom = 16;
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
