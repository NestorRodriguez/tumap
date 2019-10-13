import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-usosueloshome',
  templateUrl: './usosueloshome.page.html',
  styleUrls: ['./usosueloshome.page.scss'],
})
export class UsosueloshomePage implements OnInit {
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
