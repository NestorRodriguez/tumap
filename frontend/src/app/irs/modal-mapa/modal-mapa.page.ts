import { Component, OnInit } from '@angular/core';
import { ModalController } from '@ionic/angular';

@Component({
  selector: 'app-modal-mapa',
  templateUrl: './modal-mapa.page.html',
  styleUrls: ['./modal-mapa.page.scss'],
})
export class ModalMapaPage implements OnInit {
  lat;
  lng;
  icon;
  constructor(private modalCtrl: ModalController) {
    if (navigator) {
      navigator.geolocation.getCurrentPosition( pos => {
        this.lng = this.toFloat(pos.coords.longitude);
        this.lat = this.toFloat(pos.coords.latitude);
        this.icon = {
          url: '/assets/LOGO VERDE.svg',
          scaledSize: {
            width: 35,
            height: 35
          }
        };
      });
    }
  }

  ngOnInit() {
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
