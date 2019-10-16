import { Component, OnInit } from '@angular/core';
import {IrsService} from '../../Services/irs/irs.service';
import { InAppBrowser } from '@ionic-native/in-app-browser/ngx';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.page.html',
  styleUrls: ['./inicio.page.scss'],
})
export class InicioPage implements OnInit {
  tiposRedes: any = [];
  constructor(private service: IrsService, private iab: InAppBrowser) { }

  ngOnInit() {
    this.service.getTiposRedes().subscribe(data => {
      this.tiposRedes = data;
    });
  }

  openBrowser() {
    const browser = this.iab.create(this.service.getServerUrl() + '/irs-inventarios-totales', '_blank');
    browser.show();
  }

}
