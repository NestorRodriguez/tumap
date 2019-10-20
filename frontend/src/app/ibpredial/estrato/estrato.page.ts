import { Component, OnInit } from "@angular/core";
import { AlertController } from "@ionic/angular";
import { Router } from "@angular/router";
import { LoadingController } from "@ionic/angular";
import { PredialService } from "../../api/predial.service";

@Component({
  selector: "app-estrato",
  templateUrl: "./estrato.page.html",
  styleUrls: ["./estrato.page.scss"]
})
export class EstratoPage implements OnInit {
  buttonUsos: any = [
    { id_suelo: 1, descripcion: "Comercial" },
    { id_suelo: 2, descripcion: "Predial" },
    { id_suelo: 3, descripcion: "Rural" }
  ];
  idUsoSuelo: number;
  predialBasico: any;
  btnState: boolean = true;

  constructor(
    public alertController: AlertController,
    private router: Router,
    private loadingController: LoadingController,
    private predialService: PredialService
  ) {}

  ngOnInit() {
    this.GetLocalStorage();
  }

  async Cancelar() {
    const alert = await this.alertController.create({
      header: "Deseas Salir?",
      message: "Confirmar que deseas <strong>salir</strong>",
      buttons: [
        {
          text: "Cancelar",
          role: "cancel",
          cssClass: "secondary",
          handler: blah => {
            //
          }
        },
        {
          text: "Ok",
          handler: () => {
            this.router.navigateByUrl("/ibpredial-inicio");
          }
        }
      ]
    });

    await alert.present();
  }

  activo() {
    this.btnState = false;
  }

  Aceptar() {
    this.predialBasico.uso_suelo = this.idUsoSuelo;
    this.predialService.SaveLocalStorageItem(
      "predial_basica",
      JSON.stringify(this.predialBasico)
    );
    this.router.navigateByUrl("/ibpredial-inicio/2-uso_sue");
  }

  testRadio() {
    console.log(this.idUsoSuelo);
  }

  GetLocalStorage() {
    this.predialBasico = JSON.parse(
      this.predialService.GetLocalStorageItem("predial_basica")
    );
    console.log(this.predialBasico);
  }
}
