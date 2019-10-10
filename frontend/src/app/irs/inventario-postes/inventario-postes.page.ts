import { Component, OnInit, OnDestroy } from '@angular/core';
import {InventarioRedesSecasService} from '../../Services/irs/inventario-redes-secas.service';
import {AlertController, ModalController} from '@ionic/angular';
import {ModalMapaPage} from '../modal-mapa/modal-mapa.page';
import {Router} from '@angular/router';

@Component({
  selector: 'app-inventario-postes',
  templateUrl: './inventario-postes.page.html',
  styleUrls: ['./inventario-postes.page.scss'],
})
export class InventarioPostesPage implements OnInit, OnDestroy {

  materiales: any = [];
  estados: any = [];
  model: any = {}

  constructor(private service: InventarioRedesSecasService,
              private modalCtrl: ModalController,
              private alertCtrl: AlertController,
              private router: Router) { }

  ngOnInit() {
    this.service.getTiposMateriales().subscribe(data => {
      this.materiales = data;
    });

    this.service.getEstadosRedes().subscribe(data => {
      this.estados = data;
    });

    this.model = {
      idIrsMateriales: null,
      numero: null,
      idIrsEstadoRed: null,
      tieneLampara: false,
      tieneTransformador: null,
      ubicacion: null,
      imagen: null,
    };
    console.log('ngOnInit');
  }

  ngOnDestroy(): void {
    console.log('ngOnDestroy');
  }

  async loadModalMap() {
   const modal = await this.modalCtrl.create({
     component: ModalMapaPage,
     componentProps: {}
   });
   await modal.present();
   const { data: { ubicacion } } = await modal.onDidDismiss();
   this.model.ubicacion = ubicacion;
  }

  save() {

  }

  async cancel() {
      const alert = await this.alertCtrl.create({
          header: 'Cancelar registro',
          message: '¿Está seguro de cancelar el registro actual?',
          buttons: [
              {
                  text: 'No',
                  role: 'cancel',
                  cssClass: 'secondary',
                  handler: (blah) => {
                      console.log('Confirm Cancel: blah');
                  }
              }, {
                  text: 'Si',
                  handler: () => {
                      this.router.navigateByUrl('/irs-inicio');
                  }
              }
          ]
      });
      await alert.present();
  }

}
