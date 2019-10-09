import { Component, OnInit } from '@angular/core';
import {InventarioRedesSecasService} from '../../Services/irs/inventario-redes-secas.service';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.page.html',
  styleUrls: ['./inicio.page.scss'],
})
export class InicioPage implements OnInit {
  tiposRedes: any = [];
  constructor(private service: InventarioRedesSecasService) { }

  ngOnInit() {
    this.service.getTiposRedes().subscribe(data => {
      this.tiposRedes = data;
    });
  }

  getRouterLink(type) {
    return (type === 1) ? '/irs-inventario-postes' : '/irs-inventario-otros';
  }

}
