import { Component, OnInit } from '@angular/core';
import {InventarioRedesSecasService} from '../../Services/irs/inventario-redes-secas.service';

@Component({
  selector: 'app-inventario-postes',
  templateUrl: './inventario-postes.page.html',
  styleUrls: ['./inventario-postes.page.scss'],
})
export class InventarioPostesPage implements OnInit {

  materiales: any = [];
  estados: any = [];
  model: any = {};
  constructor(private service: InventarioRedesSecasService) { }

  ngOnInit() {
    this.service.getTiposMateriales().subscribe(data => {
      this.materiales = data;
    });

    this.service.getEstadosRedes().subscribe(data => {
      this.estados = data;
    });
  }

}
