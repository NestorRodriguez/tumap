import { Component, OnInit } from '@angular/core';
import { MinasService } from '../../Services/Minas/Minas.service';
import { TaskEstadoActual } from '../../Services/Minas/task.interface';
import { ActivatedRoute } from '@angular/router';
import { NavController, LoadingController } from '@ionic/angular';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-minasestadoactual-details',
  templateUrl: './minasestadoactual-details.page.html',
  styleUrls: ['./minasestadoactual-details.page.scss'],
})
export class MinasestadoactualDetailsPage implements OnInit {

  estadoActual: any = [];
  id: string;
  errorMessage = '';
  public idestadomina: Int32Array;
  public nombreestadomina: string;
  constructor(
    private minasService: MinasService,
    private route: ActivatedRoute, private nav: NavController, private loadingController: LoadingController) {
  }

  ngOnInit() {
    this.id = this.route.snapshot.paramMap.get('idcodigo');
    if (this.id) {
      this.loadData();
    }
  }
  async saveTodo(nombre: string) {
    const loading = await this.loadingController.create({
      message: 'Guardando...'
    });
    const data = {
      id_estadomina: this.id,
      nombre_estadomina: nombre
    };
    console.log(data);

    this.minasService.putEstadoActual(data).subscribe(
      response => {
        loading.dismiss();
        this.nav.navigateForward('/minasestadoactual');
      });
  }


  loadData() {
    this.minasService.getEstadoActualC(this.id).subscribe(
      estadoActual => {
        console.log(estadoActual);
        this.estadoActual = estadoActual;
      }, error => this.errorMessage = error);
    /*
        this.minasService.getEstadoActualC(this.id).subscribe(res => {
          console.log(res);
          this.estadoActual = res;
           });
    */
  }


}

