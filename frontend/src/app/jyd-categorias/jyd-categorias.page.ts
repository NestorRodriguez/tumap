import { Component, OnInit } from '@angular/core';
import { JydService } from '../Services/api_jyd/jyd.service';

@Component({
  selector: 'app-jyd-categorias',
  templateUrl: './jyd-categorias.page.html',
  styleUrls: ['./jyd-categorias.page.scss'],
})
export class JydCategoriasPage implements OnInit {

  constructor(private getPeople: JydService, private getCategoria: JydService) {}

  people: any[] = [];
  categorias: any[] = [];
  errorMessage = '';

  ngOnInit() {
    this.getPeople.getPeople().subscribe( people => {
      this.people = people;
    }, error => this.errorMessage = error);

    this.getCategoria.getCategorias().subscribe( categoria => {
      console.log(categoria);
      this.categorias = categoria;
    }, error => this.errorMessage = error);
  }
  
}
