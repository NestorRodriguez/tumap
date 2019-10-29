import { Component, OnInit } from '@angular/core';

import { DboService } from '../../Services/dbo/dbo.service';
import { Inscripcion } from 'src/app/models/dbo/Inscripcion';
import { THIS_EXPR } from '@angular/compiler/src/output/output_ast';
import { ActivatedRoute } from '@angular/router';
import { ModalController, NavController } from '@ionic/angular';
import { UbicacionPage } from '../ubicacion/ubicacion.page';

@Component({
  selector: 'app-inscripcion',
  templateUrl: './inscripcion.page.html',
  styleUrls: ['./inscripcion.page.scss'],
})
export class InscripcionPage implements OnInit {

  inscripciones: Inscripcion[] = [];
  isValid = false;
  posicion: string = null;

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

  constructor(private dbo: DboService, private navCtrl: NavController, private actRoute: ActivatedRoute, private  modalCtrl: ModalController) { }

  ngOnInit() {
    this.posicion = this.actRoute.snapshot.paramMap.get('id');
    this.ValidarPosicion();
  }

  ValidarPosicion() {
    if ( this.posicion === '0') {
      this.inscripcion.lat = this.latDef.toString();
      this.inscripcion.lng = this.lngDef.toString();
    } else {
      this.inscripcion.lat =  this.posicion.split(',')[0];
      this.inscripcion.lng =  this.posicion.split(',')[1];
    }
    this.posicion = this.inscripcion.lat  + ',' + this.inscripcion.lng;
    console.log('posicion: ' + this.posicion);
  }

  getInscripcion() {
    if (this.inscripcion.documento === null) { return; }
    this.isValid = false;
    this.dbo.getInscripcion(this.inscripcion.documento.toString()).subscribe(
      res => {
        this.inscripciones = res;
        if ( this.inscripciones.length > 0) {
          this.inscripcion = this.inscripciones[0];
          this.inscripcion.isUpdate = this.isValid = true;
          if ( this.inscripcion.lat.length === 0 && this.inscripcion.lng.length === 0 ) {
            this.inscripcion.lat = this.latDef.toString();
            this.inscripcion.lng = this.lngDef.toString();
            console.log('lat y lng a vacio');
          }
        } else {
          this.inscripcion.id = 0;
          this.inscripcion.nombre = '';
          this.inscripcion.lat = this.latDef.toString();
          this.inscripcion.lng = this.lngDef.toString();
          this.inscripcion.direccion = '';
          this.inscripcion.departamento = '';
          this.inscripcion.municipio = '';
          this.inscripcion.usuario = 'USER-DEFAULT';
          this.inscripcion.isUpdate = false;
        }

        this.posicion = this.inscripcion.lat  + ',' + this.inscripcion.lng;
        console.log('All: ' + JSON.stringify(this.inscripciones));
        console.log('All: ' + JSON.stringify(this.inscripcion));
      },
      err => console.error(err)
    );
  }

  async saveInscripcion() {
    // this.ValidarPosicion();
    console.log(JSON.stringify(this.inscripcion));
    await this.dbo.getExiteRespuesta(this.inscripcion.id).subscribe(
      res => {
        console.log(res);
        if ( res[0].count) {
          return alert('Encuesta ya ingresada.');
        }
      },
      err => console.error(err)
    );

    if (this.latDef.toString() === this.inscripcion.lat && this.lngDef.toString() === this.inscripcion.lng){
      this.inscripcion.lat = '';
      this.inscripcion.lng = '';
      console.log('lat y lng a vacio');
    }
    if (this.inscripcion.isUpdate === true  && this.inscripcion.id > 0) {
      this.dbo.updateInscripcion(this.inscripcion.id, this.inscripcion).subscribe(
        res => console.log(res), err => console.error(err));
      console.log('Update Inscripcion' + JSON.stringify(this.inscripcion));
      this.navCtrl.navigateForward(`/formulario/${this.inscripcion.id}`);
    } else {
        this.dbo.saveInscripcion(this.inscripcion).subscribe(
        res => {

          // this.inscripciones = res;
          // if ( this.inscripciones.length > 0) {
          //   this.inscripcion = this.inscripciones[0];
          //   this.inscripcion.isUpdate = this.isValid = true;
          // }
          this.inscripcion.id = res.insertId;
          console.log(res);
          console.log('Save Inscripcion: ' + JSON.stringify(this.inscripcion));
          this.navCtrl.navigateForward(`/formulario/${this.inscripcion.id}`);
        },
        err => console.error(err)
      );
    }
  }


  async openModal() {
    const modal = await this.modalCtrl.create({
      component: UbicacionPage,
      componentProps: {
        custom_id: this.posicion,
        custom_titulo: this.inscripcion.nombre,
        custom_descripcion: this.inscripcion.direccion
      }
    });
    await modal.present();
    const {data: { posicion }} = await modal.onDidDismiss();
    this.posicion = posicion;
    this.ValidarPosicion();
  }
}
