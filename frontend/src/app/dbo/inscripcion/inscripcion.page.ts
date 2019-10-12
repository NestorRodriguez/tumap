import { Component, OnInit } from '@angular/core';

import { DboService } from '../../Services/dbo/dbo.service';
import { Inscripcion } from 'src/app/models/dbo/Inscripcion';
import { THIS_EXPR } from '@angular/compiler/src/output/output_ast';

@Component({
  selector: 'app-inscripcion',
  templateUrl: './inscripcion.page.html',
  styleUrls: ['./inscripcion.page.scss'],
})
export class InscripcionPage implements OnInit {

  inscripciones: Inscripcion[] = [];
  isValid = false;
  posicion: string;

  inscripcion: Inscripcion = {
    id: 0,
    documento: 0,
    nombre: '',
    lat: '',
    lng: '',
    direccion: '',
    departamento: '',
    municipio: '',
    usuario: 'USER-DEFAULT',
    fecha: new Date(),
    isUpdate: false,
  };

  constructor(private dboService: DboService) { }

  ngOnInit() {}

  getInscripcion() {
    this.isValid = false;
    this.dboService.getInscripcion(this.inscripcion.documento.toString()).subscribe(
      res => {
        this.inscripciones = res;
        if ( this.inscripciones.length > 0) {
          this.inscripcion = this.inscripciones[0];
          console.log(this.inscripcion);
          this.inscripcion.isUpdate = this.isValid = true;
          this.posicion = this.inscripcion.lat  + ',' + this.inscripcion.lng;
        }
        console.log('All: ' + JSON.stringify(this.inscripciones));
        console.log('All: ' + JSON.stringify(this.inscripcion));
      },
      err => console.error(err)
    );
  }

  saveInscripcion() {
    console.log(this.inscripcion);
    
  }
}
