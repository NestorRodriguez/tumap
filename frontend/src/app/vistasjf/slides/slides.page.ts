import { Component, OnInit } from '@angular/core';
import {JfService} from '../../Services/estadoVias/jf.service';

@Component({
  selector: 'app-slides',
  templateUrl: './slides.page.html',
  styleUrls: ['./slides.page.scss'],
})
export class SlidesPage implements OnInit {
  datos : any;
  estadoVias: any[];
  constructor(private servicio: JfService) {}

  ngOnInit() {
    this.servicio.consulta('/detalle_vias').subscribe(detalleVias => {
      this.estadoVias = detalleVias;
      console.log(this.estadoVias);
    });

    this.datos = {
      direccion: null,
      estado: null
    };
  }

  seleccion(id:any) {
    this.datos.estado = id.detail.value;
    console.log('este es', this.datos);
  };

  guardar() {
  // const body = {
  //   puntos: '',
  //   nombre_via: '',
  //   id_detalle_via: '',
  //   imagen: '', 
  //   id_estado: '0'
  // };
  this.servicio.recibirDatos(this.datos);
  }
}
