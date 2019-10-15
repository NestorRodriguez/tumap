import { Component, OnInit } from '@angular/core';
import { Marcador } from '../models/colinda/marcador';
import { Router } from '@angular/router'
import { LoadingController } from '@ionic/angular'

@Component({
  selector: 'app-colinda',
  templateUrl: './colinda.page.html',
  styleUrls: ['./colinda.page.scss'],
})
export class ColindaPage implements OnInit {

  //marcadores : Marcador[] = [];
  markets: any = [
      {lat: '', lng: '', title: '', description: ''}
  ];
  lat = 4.60972222222;
  lng = -74.0816666667;
  icon: any = {};
  btnState: boolean = true;
  varColor: string = 'medium';

  constructor(
    private router: Router,
    private loadingController: LoadingController) {}

  ngOnInit()
  {
    this.icon = {
      url: '/assets/LOGO VERDE.svg',
      scaledSize: {
        width: 35,
        height: 35
      }
    }    
  }
  ingresarMarcador(lat: number, lng: number, title: string, description: string){
    //const nuevoMarcador = new Marcador(lat, lng, title, description);
    this.markets[0] = new Marcador(lat, lng, title, description);
    console.log(this.markets);
    this.lat = lat;
    this.lng = lng;
    this.btnState = false;
    this.varColor = 'primary'
  }

  agregarMarcador(evento){
    this.ingresarMarcador(parseFloat(evento.coords.lat), parseFloat(evento.coords.lng), evento.coords.title, evento.coords.description);    
  }

  async SaveCoordenda(){
    await this.presentLoading()
    this.router.navigateByUrl('/ibpredial-inicio/1-lim_col')
      .then(e => {
        if (e) {
          console.log("Navigation is successful!");
        } else {
          console.log("Navigation has failed!");
        }
      });
  }

  async presentLoading() {
    const loading = await this.loadingController.create({
      message: 'Guardando',
      duration: 2000,
      spinner: 'bubbles'
    });
    await loading.present()
    await loading.onDidDismiss()
  }

}
