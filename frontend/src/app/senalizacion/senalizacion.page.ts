import { Component, OnInit } from '@angular/core';
import { JydService } from '../Services/api_jyd/jyd.service';

@Component({
  selector: 'app-senalizacion',
  templateUrl: './senalizacion.page.html',
  styleUrls: ['./senalizacion.page.scss'],
})
export class SenalizacionPage implements OnInit {

  constructor(private getItem: JydService) { }

  items: any[] = [];
  errorMessage = '';

  ngOnInit() {
    this.getItem.getItemSenalizacion().subscribe( item => {
      this.items = item;
    }, error => this.errorMessage = error);
  }

}
