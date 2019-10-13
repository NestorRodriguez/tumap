import { Component, OnInit } from '@angular/core';
import { MinasService } from '../../Services/Minas/Minas.service';
import { TaskEstadoActual } from '../../Services/Minas/task.interface';
import { ActivatedRoute } from '@angular/router';
import { NavController, LoadingController } from '@ionic/angular';

@Component({
  selector: 'app-minaregistro',
  templateUrl: './minaregistro.page.html',
  styleUrls: ['./minaregistro.page.scss'],
})
export class MinaregistroPage implements OnInit {

  constructor(private minasService: MinasService, private navControl: NavController, private route: ActivatedRoute) { }


  public nombre = 'Maikol';
  public ubicacion = 'POLYGON((4.474022 -74.087073))';
  public latitud: any;
  public longitud: any;
  public mineral: any;
  public ntrabajadores: any;
  public observaciones: any;
  public tipoexplotacion: any;
  public tipomaterial: any;
  public estadoactual: any;
  public estadoregistro = '1';
  public pregunta: any;


  ngOnInit() {
    this.latitud = this.route.snapshot.paramMap.get('lat');
    this.longitud = this.route.snapshot.paramMap.get('lng');
  }

  saveForm() {
    const data = {
      nombre: this.nombre,
      ubicacion: this.ubicacion,
      mineral: this.mineral,
      trabajadores: this.ntrabajadores,
      observacion: this.observaciones,
      id_sistemaexplotacion: this.tipoexplotacion,
      id_tipomaterial: this.tipomaterial,
      id_estadomina: this.estadoactual,
      estadoregistro: this.estadoregistro,
      pregunta: this.pregunta,
    };
    this.minasService.setEstadoActual(data).subscribe(response => {
      console.log(response);
    });
  }

}
