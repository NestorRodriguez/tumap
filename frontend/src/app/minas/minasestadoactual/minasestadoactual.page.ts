import { Component, OnInit } from '@angular/core';
import { MinasService } from '../../Services/Minas/Minas.service';
import { TaskEstadoActual } from '../../Services/Minas/task.interface';
import { ActivatedRoute } from '@angular/router';
import { NavController, LoadingController } from '@ionic/angular';

@Component({
  selector: 'app-minasestadoactual',
  templateUrl: './minasestadoactual.page.html',
  styleUrls: ['./minasestadoactual.page.scss'],
})

export class MinasestadoactualPage implements OnInit {

  constructor(private minasService: MinasService, private navControl: NavController, private route: ActivatedRoute) { }
  estadoActual: any = [];
  errorMessage = '';
  public nombreEstadomina: string;
  id: string;

  ngOnInit() {
    this.getEstadoActual();
  }

  getEstadoActual() {
    this.minasService.getMinasEstadoActual().subscribe(
      estadoActual => {
        console.log(estadoActual);
        estadoActual.map((item: any) => {
          Object.assign(item, { visible: false });
          return item;
        });
        this.estadoActual = estadoActual;
      }, error => this.errorMessage = error);
    this.nombreEstadomina = '';
  }
  editForm(id: string) {
    this.navControl.navigateForward(`minasestadoactual-details/${id}`);
    this.ngOnInit();
  }

  deleteForm(id: string) {
    this.id = id;
    this.minasService.deleteEstadoActual(id).subscribe(response => {
      this.ngOnInit();
      console.log(response);
    });
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
