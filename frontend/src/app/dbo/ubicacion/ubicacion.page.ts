import { Component, OnInit } from '@angular/core';

import { DboService } from '../../Services/dbo/dbo.service';
import { Inscripcion } from 'src/app/models/dbo/Inscripcion';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-ubicacion',
  templateUrl: './ubicacion.page.html',
  styleUrls: ['./ubicacion.page.scss'],
})
export class UbicacionPage implements OnInit {

  id: any = null;

  constructor(private activeRoute: ActivatedRoute) { }

  ngOnInit() {
    // this.id = this.activeRoute.snapshot.paramMap.get('id');
    // if (this.id != null) {
    //   console.log('All: ' + JSON.stringify(this.id));
    // }
  }
}
