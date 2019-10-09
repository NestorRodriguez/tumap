import { Component, OnInit } from '@angular/core';
import { MinasService } from '../../Services/Minas/Minas.service';

@Component({
  selector: 'app-minasestadoactual',
  templateUrl: './minasestadoactual.page.html',
  styleUrls: ['./minasestadoactual.page.scss'],
})

export class MinasestadoactualPage implements OnInit {

  constructor(private minasService: MinasService) { }
  estadoActual: any = [];
  errorMessage = '';
  nombreEstadomina = 'VALOR A';

  ngOnInit() {
    this.getEstadoActual();
  }

  getEstadoActual() {
    this.minasService.getMinasEstadoActual().subscribe(
      estadoActual => {
      console.log(estadoActual);
      estadoActual.map((item: any) => {
        Object.assign(item, {visible: false});
        return item;
      });
      this.estadoActual = estadoActual;
    }, error => this.errorMessage = error);
  }

  setEditForm(index) {
    this.estadoActual[index].visible = true;
  }

  setViewForm(index) {
    this.estadoActual[index].visible = false;
  }

  saveForm() {
    const data = {
      nombre_estadomina: this.nombreEstadomina
    };
    this.minasService.setEstadoActual(data).subscribe(response => {
      this.getEstadoActual();
      console.log(response);
    });
  }

}
