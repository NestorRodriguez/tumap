import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.page.html',
  styleUrls: ['./registro.page.scss'],
})
export class RegistroPage implements OnInit {
  idItem = null
  idCategoriaItem = null

  constructor(private activedRoute: ActivatedRoute) { }

  ngOnInit() {
    this.idItem = this.activedRoute.snapshot.paramMap.get('id');
    this.idCategoriaItem = this.activedRoute.snapshot.paramMap.get('categoria');
    console.log(this.idItem)
    console.log(this.idCategoriaItem)
  }

}
