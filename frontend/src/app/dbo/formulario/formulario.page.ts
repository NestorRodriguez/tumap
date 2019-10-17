import { Component, OnInit } from '@angular/core';
import { DboService } from '../../Services/dbo/dbo.service';
import { NavController } from '@ionic/angular';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-formulario',
  templateUrl: './formulario.page.html',
  styleUrls: ['./formulario.page.scss'],
})
export class FormularioPage implements OnInit {

  constructor(private dbo: DboService, private navCtrl: NavController, private actRoute: ActivatedRoute) { }

  ngOnInit() {
    // this.service.getEstadosRedes().subscribe(data => {
    //   this.estados = data;
    // });
  }
// Fin FormularioPage
}
