import { Component, OnInit } from '@angular/core';
import { JydService } from '../../Services/api_jyd/jyd.service';

@Component({
  selector: 'app-resumen',
  templateUrl: './resumen.page.html',
  styleUrls: ['./resumen.page.scss'],
})
export class ResumenPage implements OnInit {

  registro: any = [];
  items: any = [];
  errorMessage = '';

  constructor(private getData: JydService) { }

  ngOnInit() {
    this.registro.push(JSON.parse(localStorage.getItem('infoItem')));
    console.log('fucking item:'+this.registro[0].codItem)
    this.getData.getDatosItem(this.registro[0].codItem).subscribe( item => {
      console.log(item)
      this.items.push(JSON.parse(JSON.stringify(item)))
    }, error => this.errorMessage = error);
    console.log(this.registro);
    console.log('items devueltos:'+this.items.nombre);
  }

}
