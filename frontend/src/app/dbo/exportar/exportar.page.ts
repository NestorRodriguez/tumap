import { Component, OnInit } from '@angular/core';
import { DboService } from '../../Services/dbo/dbo.service';

@Component({
  selector: 'app-exportar',
  templateUrl: './exportar.page.html',
  styleUrls: ['./exportar.page.scss'],
})
export class ExportarPage implements OnInit {


  csvData = [];
  // csvData: any[] = [];
  // headerRow: any[] = [];

  constructor(private dbo: DboService) { }

  ngOnInit() {
    console.log('Entro a exportar')
    this.dbo.getRespuestasResultado().subscribe(
      res => this.listar(res) ,  // this.csvData = res ,
      err => console.error(err)
      );
      console.log('Result: ' + JSON.stringify(this.csvData));
  }

  listar(res) { 
    console.log(res);
  }

}
