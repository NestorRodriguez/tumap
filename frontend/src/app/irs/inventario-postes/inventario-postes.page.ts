import { Component, OnInit } from '@angular/core';
import {InventarioRedesSecasService} from '../../Services/irs/inventario-redes-secas.service';
import {ModalController} from '@ionic/angular';
import {ModalMapaPage} from '../modal-mapa/modal-mapa.page';

@Component({
  selector: 'app-inventario-postes',
  templateUrl: './inventario-postes.page.html',
  styleUrls: ['./inventario-postes.page.scss'],
})
export class InventarioPostesPage implements OnInit {

  materiales: any = [];
  estados: any = [];
  model: any = {};
  idIrsMateriales: any = '';

  constructor(private service: InventarioRedesSecasService,
              private modalCtrl: ModalController) { }

  ngOnInit() {
    this.service.getTiposMateriales().subscribe(data => {
      this.materiales = data;
    });

    this.service.getEstadosRedes().subscribe(data => {
      this.estados = data;
    });
  }

  async loadModalMap(type) {
   const modal = await this.modalCtrl.create({
     component: ModalMapaPage,
     componentProps: {
       type,
     }
   });
   await modal.present();
   const { data } = await modal.onDidDismiss();
   console.log(data);
   this.model.ubicacion = data;
  }

}
