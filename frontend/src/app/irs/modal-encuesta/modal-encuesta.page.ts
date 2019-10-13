import { Component, OnInit } from '@angular/core';
import { ModalController, Platform } from '@ionic/angular';
import {IrsService} from '../../Services/irs/irs.service';

@Component({
  selector: 'app-modal-mapa',
  templateUrl: './modal-encuesta.page.html',
  styleUrls: ['./modal-encuesta.page.scss'],
})
export class ModalEncuestaPage implements OnInit {

  operadorCelular: string;
  estadoRed: string;

  operadores: any = [];
  estados: any = [];

  constructor(private service: IrsService, private modalCtrl: ModalController) {
  }

  ngOnInit() {

    this.service.getOperadoresCelulares().subscribe(data => {
      this.operadores = data;
    });

    this.service.getEstadosRedes().subscribe(data => {
      this.estados = data;
    });
  }

  closeModal() {
    this.modalCtrl.dismiss({
      encuesta: {
        idIrsOperadorCelular: this.operadorCelular,
        idIrsEstadoRedCelular: this.estadoRed,
      }
    });
  }
}
