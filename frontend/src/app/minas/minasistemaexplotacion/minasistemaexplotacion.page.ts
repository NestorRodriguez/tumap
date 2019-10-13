import { Component, OnInit } from '@angular/core';
import { MinasService } from '../../Services/Minas/Minas.service';
import { TaskEstadoActual } from '../../Services/Minas/task.interface';
import { ActivatedRoute } from '@angular/router';
import { NavController, LoadingController } from '@ionic/angular';

@Component({
  selector: 'app-minasistemaexplotacion',
  templateUrl: './minasistemaexplotacion.page.html',
  styleUrls: ['./minasistemaexplotacion.page.scss'],
})
export class MinasistemaexplotacionPage implements OnInit {

  constructor(private minasService: MinasService, private navControl: NavController, private route: ActivatedRoute) { }
  data: any = [];
  errorMessage = '';
  public nombre: string;
  id: string;

  ngOnInit() {
    this.getForm();
  }

  getForm() {
    this.minasService.getMinasSistemaExplotacion().subscribe(
      data => {
        console.log(data);
        data.map((item: any) => {
          Object.assign(item, { visible: false });
          return item;
        });
        this.data = data;
      }, error => this.errorMessage = error);
    this.nombre = '';
  }
  editForm(id: string) {
    this.navControl.navigateForward(`minasistemaexplotacion-details/${id}`);
    this.ngOnInit();
  }

  deleteForm(id: string) {
    this.id = id;
    this.minasService.deleteSistemaExplotacion(id).subscribe(response => {
      this.ngOnInit();
      console.log(response);
    });
  }

  saveForm() {
    const data = {
      nombre_sistemaexplotacion: this.nombre
    };
    this.minasService.setSistemaExplotacion(data).subscribe(response => {
      this.getForm();
      console.log(response);
    });
  }

}
