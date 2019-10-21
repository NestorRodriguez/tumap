import { Component, OnInit } from '@angular/core';
import { HidroServicesService } from 'src/app/Services/hidroetno/hidro-services.service';

@Component({
  selector: 'app-sincobopt',
  templateUrl: './sincobopt.page.html',
  styleUrls: ['./sincobopt.page.scss'],
})
export class SincoboptPage implements OnInit {
  objetoInfo = {
    state: null
  };

  constructor(private servicio: HidroServicesService) { }

  ngOnInit() {
  }

}
