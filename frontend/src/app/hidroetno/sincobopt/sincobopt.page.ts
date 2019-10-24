import { Component, OnInit } from '@angular/core';
import { HidroServicesService } from 'src/app/Services/hidroetno/hidro-services.service';

@Component({
  selector: 'app-sincobopt',
  templateUrl: './sincobopt.page.html',
  styleUrls: ['./sincobopt.page.scss'],
})
export class SincoboptPage implements OnInit {


  constructor(private servicio: HidroServicesService) { }

  public suspension: any;
  public corte: any;
  public sinServicio: any;

  ngOnInit() {
  }

  saveSinCovertura() {
    const data = {
      suspension: this.suspension,
      corte: this.corte,
      sinServicio: this.sinServicio,
    };
    this.servicio.setSinCovertura(data).subscribe(response => {
      console.log(response);
    });
  }
}
