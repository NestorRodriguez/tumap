import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-resumen',
  templateUrl: './resumen.page.html',
  styleUrls: ['./resumen.page.scss'],
})
export class ResumenPage implements OnInit {

  registro: any = [];
  items: any = [];
  errorMessage = '';

  constructor() { }

  ngOnInit() {
    this.registro.push(JSON.parse(localStorage.getItem('infoVia')));
    console.log('fucking item:'+this.registro[0])
    console.log(this.registro);
  }

}
