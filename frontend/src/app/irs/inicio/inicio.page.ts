import { Component, OnInit } from '@angular/core';
import {IrsService} from '../../Services/irs/irs.service';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.page.html',
  styleUrls: ['./inicio.page.scss'],
})
export class InicioPage implements OnInit {
  tiposRedes: any = [];
  constructor(private service: IrsService) { }

  ngOnInit() {
    this.service.getTiposRedes().subscribe(data => {
      this.tiposRedes = data;
    });
  }

}
