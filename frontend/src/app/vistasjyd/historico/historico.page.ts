import { Component, OnInit } from '@angular/core';
import { JydService } from '../../Services/api_jyd/jyd.service';
import {NavController, AlertController, ModalController} from '@ionic/angular';
import {ToastController} from '@ionic/angular';

@Component({
  selector: 'app-historico',
  templateUrl: './historico.page.html',
  styleUrls: ['./historico.page.scss'],
})
export class HistoricoPage implements OnInit {

  registro: any = [];
  items: any = [];
  errorMessage = '';

  constructor(private service: JydService,
              private toastCtrl: ToastController,
              private navCtrl: NavController) { }

  ngOnInit() {
    this.service.getRegistros().subscribe( item => {
      // console.log(item)
      this.items = item;
    }, error => this.errorMessage = error);
  }

}
