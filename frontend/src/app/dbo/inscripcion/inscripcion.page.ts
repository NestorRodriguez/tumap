import { Component, OnInit } from '@angular/core';

import { DboService } from '../../Services/dbo/dbo.service';
import { Inscripcion } from 'src/app/models/dbo/Inscripcion';
import { THIS_EXPR } from '@angular/compiler/src/output/output_ast';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-inscripcion',
  templateUrl: './inscripcion.page.html',
  styleUrls: ['./inscripcion.page.scss'],
})
export class InscripcionPage implements OnInit {

  inscripciones: Inscripcion[] = [];
  isValid = false;
  posicion: string;

  latDef = 4.590244;
  lngDef = -74.193179;


  inscripcion: Inscripcion = {
    id: 0,
    documento: null,
    nombre: '',
    lat: this.latDef.toString(),
    lng: this.lngDef.toString(),
    direccion: '',
    departamento: '',
    municipio: '',
    usuario: 'USER-DEFAULT',
    fecha: new Date(),
    isUpdate: false,
  };

  constructor(private dboService: DboService, private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    // this.posicion = this.activatedRoute.snapshot.paramMap.get('id');
    // if ( this.posicion === '0') {
    //   this.inscripcion.lat = this.latDef.toString();
    //   this.inscripcion.lng = this.lngDef.toString();
    // } else {
    //   this.inscripcion.lat =  this.posicion.split(',')[0];
    //   this.inscripcion.lng =  this.posicion.split(',')[1];
    // }
    // this.posicion = this.inscripcion.lat  + ',' + this.inscripcion.lng;
    // console.log('posicion: ' + this.posicion);
  }

  getInscripcion() {
    if (this.inscripcion.documento === null) { return; }
    this.isValid = false;
    this.dboService.getInscripcion(this.inscripcion.documento.toString()).subscribe(
      res => {
        this.inscripciones = res;
        if ( this.inscripciones.length > 0) {
          this.inscripcion = this.inscripciones[0];
          this.inscripcion.isUpdate = this.isValid = true;
        } else {
          // this.inscripcion.id = 0;
          // this.inscripcion.nombre = '';
          // this.inscripcion.lat = this.latDef.toString();
          // this.inscripcion.lng = this.lngDef.toString();
          // this.inscripcion.direccion = '';
          // this.inscripcion.departamento = '';
          // this.inscripcion.municipio = '';
          // this.inscripcion.usuario = 'USER-DEFAULT';
          // this.inscripcion.isUpdate = false;
        }

        this.posicion = this.inscripcion.lat  + ',' + this.inscripcion.lng;
        console.log('All: ' + JSON.stringify(this.inscripciones));
        console.log('All: ' + JSON.stringify(this.inscripcion));
      },
      err => console.error(err)
    );
  }

  saveInscripcion() {
    console.log(JSON.stringify(this.inscripcion));
    if (this.latDef.toString() === this.inscripcion.lat && this.lngDef.toString() === this.inscripcion.lng){
      this.inscripcion.lat = '';
      this.inscripcion.lng = '';
      console.log('lat y lng a vacio');
    }
    if (this.inscripcion.isUpdate === true  && this.inscripcion.id > 0) {
      // delete this.inscripcion.isUpdate;
      // delete this.inscripcion.fecha;
      this.dboService.updateInscripcion(this.inscripcion.id, this.inscripcion).subscribe(
        res => console.log(res)
        ,
        err => console.error(err)
      );
      console.log('Update Inscripcion' + JSON.stringify(this.inscripcion));
    } else {
      // delete this.inscripcion.isUpdate;
      // delete this.inscripcion.fecha;
      this.dboService.saveInscripcion(this.inscripcion).subscribe(
        res => {
          this.inscripciones = res;
          if ( this.inscripciones.length > 0) {
            this.inscripcion = this.inscripciones[0];
            this.inscripcion.isUpdate = this.isValid = true;
          }
        },
        err => console.error(err)
      );
      console.log('Save Inscripcion' + JSON.stringify(this.inscripcion));
    }
  }
}
