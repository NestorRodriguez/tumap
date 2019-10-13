import { Component, OnInit } from '@angular/core';
import { PredialService } from '../api/predial.service';
import { AlertController } from '@ionic/angular';

@Component({
  selector: 'app-predial',
  templateUrl: './predial.page.html',
  styleUrls: ['./predial.page.scss'],
})
export class PredialPage implements OnInit {

  usopredial: any[] = [];
  nivelvivienda: any[] = [];
  errorMessage = ``;
  filtro: any[] = [];
  filteredProducts: any[] = [];

  constructor(private servicioPredialService: PredialService, private alertController: AlertController) { }

  ngOnInit() {
    this.servicioPredialService.obtenerusoPredial().subscribe(
      data => {
        this.usopredial = data;
        console.log(this.usopredial);
      }, error => 
      {
          this.errorMessage = <any>error
          this.presentAlert();
      }
    );

    this.servicioPredialService.obtenernivelVivienda().subscribe(
      data => {
        this.nivelvivienda = data;
        console.log(this.usopredial);
      }, error => 
      {
          this.errorMessage = <any>error
          this.presentAlert();
      }
    );
  }

  async presentAlert() {
    const alert = await this.alertController.create({
      header: 'Alert',
      subHeader: 'Server not found',
      message: 'Error en la conexión a Server.',
      buttons: ['OK']
    });

    await alert.present();
  }

}
