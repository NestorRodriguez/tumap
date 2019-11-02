import { Component, OnInit } from '@angular/core';
import {JfService} from '../../Services/estadoVias/jf.service';
import {NavController, AlertController, ModalController} from '@ionic/angular';
import {ToastController} from '@ionic/angular';

@Component({
  selector: 'app-historicovias',
  templateUrl: './historicovias.page.html',
  styleUrls: ['./historicovias.page.scss'],
})
export class HistoricoviasPage implements OnInit {

  registro: any = [];
  items: any = [];
  errorMessage = '';

  constructor(private service: JfService,
              private toastCtrl: ToastController,
              private navCtrl: NavController) { }

  ngOnInit() {
    this.service.consulta('vias').subscribe( item => {
      console.log(item)
      this.items = item;
    }, error => this.errorMessage = error);
  }

}
