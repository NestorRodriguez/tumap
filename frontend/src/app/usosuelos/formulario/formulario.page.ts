import { Component, OnInit } from '@angular/core';
import { InvsuelosService } from '../../Services/inventario de suelos/invsuelos.service';

@Component({
  selector: 'app-formulario',
  templateUrl: './formulario.page.html',
  styleUrls: ['./formulario.page.scss'],
})
export class FormularioPage implements OnInit {
  registros: any[] = [];
  errorMessage = '';
  constructor(private suelosService: InvsuelosService) { }

  ngOnInit() {
    this.suelosService.getData().subscribe(registros => {
    this.registros = registros;
    console.log(this.registros);
    // tslint:disable-next-line: no-unused-expression
    }, error => this.errorMessage = error);
  }

}
