import { Component, OnInit } from '@angular/core';
import {ModalController} from "@ionic/angular";

@Component({
  selector: 'app-modal-mapa',
  templateUrl: './modal-mapa.page.html',
  styleUrls: ['./modal-mapa.page.scss'],
})
export class ModalMapaPage implements OnInit {

  constructor(private modalCtrl: ModalController) { }

  ngOnInit() {
  }

  closeModal(){
    this.modalCtrl.dismiss();
  }

}
