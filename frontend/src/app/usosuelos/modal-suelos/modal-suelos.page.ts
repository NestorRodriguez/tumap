import { Component, OnInit, Input } from '@angular/core';
import { InvsuelosService } from 'src/app/Services/inventario de suelos/invsuelos.service';
import { NavParams, ModalController } from '@ionic/angular';
import { ViewController } from '@ionic/core';


@Component({
  selector: 'app-modal-suelos',
  templateUrl: './modal-suelos.page.html',
  styleUrls: ['./modal-suelos.page.scss'],
})
export class ModalSuelosPage implements OnInit {
  usosuelos: any[] = [];
  data: any = {};
  constructor(private service: InvsuelosService,
              private view: ModalController) { }

  ngOnInit() {

    this.service.getData('tipousosuelos').subscribe( data => {
      this.usosuelos = data;
      console.log(this.usosuelos);
    });
    this.data = {
      id: null,
      tipouso: null
    };
  }
  public seleccion(id: any) {
    this.data = (id.detail);
  }

  dismiss() {
    // using the injected ModalController this page
    // can "dismiss" itself and optionally pass back data
      this.view.dismiss(this.data);
  }

}
