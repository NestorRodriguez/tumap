import { Component, OnInit } from '@angular/core';
import { DboService } from '../../Services/dbo/dbo.service';

@Component({
  selector: 'app-exportar',
  templateUrl: './exportar.page.html',
  styleUrls: ['./exportar.page.scss'],
})
export class ExportarPage implements OnInit {

  items = [];

  constructor(private dboService: DboService) { }

  ngOnInit() {
    this.items = this.dboService.getRespuestas();
    console.log(this.items);
  }

  listar(){

  }

}
