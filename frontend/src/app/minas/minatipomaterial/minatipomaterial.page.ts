import { Component, OnInit } from '@angular/core';
import { MinasService } from '../../Services/Minas/Minas.service';
import { TaskEstadoActual } from '../../Services/Minas/task.interface';
import { ActivatedRoute } from '@angular/router';
import { NavController, LoadingController } from '@ionic/angular';

@Component({
  selector: 'app-minatipomaterial',
  templateUrl: './minatipomaterial.page.html',
  styleUrls: ['./minatipomaterial.page.scss'],
})
export class MinatipomaterialPage implements OnInit {

  constructor(private minasService: MinasService, private navControl: NavController, private route: ActivatedRoute) { }
  data: any = [];
  errorMessage = '';
  public nombre: string;
  id: string;

  ngOnInit() {
    this.getForm();
  }

  getForm() {
    this.minasService.getMinaMinasTipoMaterial().subscribe(
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
    this.navControl.navigateForward(`minatipomaterialdetails/${id}`);
    this.ngOnInit();
  }

  deleteForm(id: string) {
    this.id = id;
    this.minasService.deleteMinasTipoMaterial(id).subscribe(response => {
      this.ngOnInit();
      console.log(response);
    });
  }

  saveForm() {
    const data = {
      nombre_tipomaterial: this.nombre
    };
    this.minasService.setMinasTipoMaterial(data).subscribe(response => {
      this.getForm();
      console.log(response);
    });
  }

}
