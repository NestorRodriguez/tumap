import { Component, OnInit } from '@angular/core';
import { InvsuelosService } from '../../Services/inventario de suelos/invsuelos.service';
import { Router } from '@angular/router';
import { ObtenerdataService } from '../../Services/inventario de suelos/obtenerdata.service';

@Component({
  selector: 'app-formulario',
  templateUrl: './formulario.page.html',
  styleUrls: ['./formulario.page.scss'],
})
export class FormularioPage implements OnInit {
  registros: any[] = [];
  errorMessage = '';
  constructor(private suelosService: InvsuelosService,
              private router: Router,
              private sendData: ObtenerdataService ) { }
  model: any = {};
  ngOnInit() {
    // this.suelosService.getData().subscribe(registros => {
    // this.registros = registros;
    // console.log(this.registros);
    // // tslint:disable-next-line: no-unused-expression
    // }, error => this.errorMessage = error);s
    this.model = {
    nombrepropietario : null,
    nombrepredio : null,
    area : null,
    direccion : null
  };
  }
  public enviarData(  ) {
    this.sendData.obtenerData(this.model);
    console.log(this.model);
  }

}
