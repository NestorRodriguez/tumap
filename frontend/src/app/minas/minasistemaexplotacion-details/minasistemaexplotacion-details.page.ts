import { Component, OnInit } from '@angular/core';
import { MinasService } from '../../Services/Minas/Minas.service';
import { TaskEstadoActual } from '../../Services/Minas/task.interface';
import { ActivatedRoute } from '@angular/router';
import { NavController, LoadingController } from '@ionic/angular';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-minasistemaexplotacion-details',
  templateUrl: './minasistemaexplotacion-details.page.html',
  styleUrls: ['./minasistemaexplotacion-details.page.scss'],
})
export class MinasistemaexplotacionDetailsPage implements OnInit {

  data: any = [];
  codigo: string;
  errorMessage = '';
  constructor(
    private minasService: MinasService,
    private route: ActivatedRoute, private nav: NavController, private loadingController: LoadingController) {
  }

  ngOnInit() {
    this.codigo = this.route.snapshot.paramMap.get('id');
    if (this.codigo) {
      this.loadData();
    }
  }
  async saveTodo(nombre: string) {
    const loading = await this.loadingController.create({
      message: 'Guardando...'
    });
    const data = {
      id_sistemaexplotacion: this.codigo,
      nombre_sistemaexplotacion: nombre
    };
    console.log(data);

    this.minasService.putSistemaExplotacion(data).subscribe(
      response => {
        loading.dismiss();
        this.nav.navigateForward('/minasistemaexplotacion');
      });
  }


  loadData() {
    this.minasService.getSistemaExplotacionC(this.codigo).subscribe(
      data => {
        console.log(data);
        this.data = data;
      }, error => this.errorMessage = error);
  }


}

