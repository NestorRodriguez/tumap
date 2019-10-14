import { Component, OnInit } from '@angular/core';
import { MinasService } from '../../Services/Minas/Minas.service';
import { TaskEstadoActual } from '../../Services/Minas/task.interface';
import { ActivatedRoute } from '@angular/router';
import { NavController, LoadingController } from '@ionic/angular';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-minatipomaterialdetails',
  templateUrl: './minatipomaterialdetails.page.html',
  styleUrls: ['./minatipomaterialdetails.page.scss'],
})
export class MinatipomaterialdetailsPage implements OnInit {

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
      id_tipomaterial: this.codigo,
      nombre_tipomaterial: nombre
    };
    console.log(data);

    this.minasService.putMinasTipoMaterial(data).subscribe(
      response => {
        loading.dismiss();
        this.nav.navigateForward('/minatipomaterial');
      });
  }


  loadData() {
    this.minasService.getMinasTipoMaterialC(this.codigo).subscribe(
      data => {
        console.log(data);
        this.data = data;
      }, error => this.errorMessage = error);
  }


}