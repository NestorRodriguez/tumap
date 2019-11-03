import { Component, OnInit } from '@angular/core';
import { Storage } from '@ionic/storage';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-show-marker',
  templateUrl: './show-marker.page.html',
  styleUrls: ['./show-marker.page.scss'],
})
export class ShowMarkerPage implements OnInit {

  lat = 0;
  lng = 0;

  constructor(private activedRoute: ActivatedRoute) { }

  ngOnInit() {
    this.lat = parseFloat(this.activedRoute.snapshot.paramMap.get('lat'));
    this.lng = parseFloat(this.activedRoute.snapshot.paramMap.get('lng'));

    console.log(this.lat);
    console.log(this.lng);
  }

}
