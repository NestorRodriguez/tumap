import { Component, OnInit } from '@angular/core';

import { DboService } from '../../Services/dbo/dbo.service';
import { Inscripcion } from 'src/app/models/dbo/Inscripcion';

@Component({
  selector: 'app-inscripcion',
  templateUrl: './inscripcion.page.html',
  styleUrls: ['./inscripcion.page.scss'],
})
export class InscripcionPage implements OnInit {

  inscripciones: Inscripcion[] = [];
  inscripcion: Inscripcion;
  documento = 0;
  isValid = false;

  constructor(private dboService: DboService) { }

  ngOnInit() {}

  getInscripcion() {
    this.isValid = false;
    this.dboService.getInscripcion(this.documento.toString()).subscribe(
      res => {
        this.inscripciones = res;
        if ( this.inscripciones.length > 0) {
          this.inscripcion = this.inscripciones[0];
          this.isValid = true;

        }
        console.log('All: ' + JSON.stringify(this.inscripciones));
        console.log('All: ' + JSON.stringify(this.inscripcion));
      },
      err => console.error(err)
    );
  }

}
