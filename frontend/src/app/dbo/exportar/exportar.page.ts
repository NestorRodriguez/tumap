import { Component, OnInit } from '@angular/core';
import { DboService } from '../../Services/dbo/dbo.service';
import { InAppBrowser } from '@ionic-native/in-app-browser';

@Component({
  selector: 'app-exportar',
  templateUrl: './exportar.page.html',
  styleUrls: ['./exportar.page.scss'],
})
export class ExportarPage implements OnInit {


  csvData: string ;
  ruta: string;
  // csvData: any[] = [];
  // headerRow: any[] = [];

  constructor(private dbo: DboService) { }
// , private iab: InAppBrowser
  ngOnInit() {
    console.log('Entro a exportar')
    // this.dbo.getRespuestasResultado().subscribe(
    //   res => console.log(res.toString()) ,  // this.csvData = res ,
    //   err => console.error(err)
    //   );
    // console.log(this.csvData);
    this.ruta = this.dbo.getServerUrl() + '/dbo_vlistado';
    this.openBrowser();

  }

  openBrowser() {
    // const browser = this.iab.open(this.dbo.getServerUrl() + '/dbo_respuesta', '_blank');
    // browser.show();
  }

}
