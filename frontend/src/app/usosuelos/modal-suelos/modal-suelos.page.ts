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
    });

  }
  public seleccion(id: any) {
    this.data = (id.detail);
  }

  dismiss() {

   const result = this.usosuelos.find( ({ ID }) => ID === this.data.value );
   this.view.dismiss(result);
  }

}
