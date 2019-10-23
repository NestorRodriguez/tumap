import { Component, OnInit } from '@angular/core';
import { ModalController, Platform } from '@ionic/angular';
import { Geolocation, Geoposition } from '@ionic-native/geolocation/ngx';
import { LocationAccuracy } from '@ionic-native/location-accuracy/ngx';


@Component({
  selector: 'app-centrosformacion',
  templateUrl: './centrosformacion.page.html',
  styleUrls: ['./centrosformacion.page.scss'],
})
export class CentrosformacionPage implements OnInit {

  lat = 4.60972222222;
  lng = -74.0816666667;
  zoom = 16;
  icon;
  // tslint:disable-next-line: max-line-length
  constructor(private modalCtrl: ModalController, private geolocation: Geolocation, private platform: Platform, private locationAccuracy: LocationAccuracy) {
}

getGeolocation() {
this.geolocation.getCurrentPosition()
.then((location: Geoposition) => {
this.lat = location.coords.latitude;
this.lng = location.coords.longitude;
})
.catch(error => console.log(error));
}

ngOnInit() {
this.getGeolocation();
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
