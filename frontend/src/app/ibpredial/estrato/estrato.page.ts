import { Component, OnInit } from "@angular/core";
import { AlertController } from "@ionic/angular";
import { Router } from "@angular/router";
import { LoadingController } from "@ionic/angular";

@Component({
  selector: "app-estrato",
  templateUrl: "./estrato.page.html",
  styleUrls: ["./estrato.page.scss"]
})
export class EstratoPage implements OnInit {
  buttonUsos: any = ["Residencial", "Rural", "Comercial", "Mixto"];

  btnState: boolean = true;

  constructor(
    public alertController: AlertController,
    private router: Router,
    private loadingController: LoadingController
  ) {}

  ngOnInit() {}

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
    this.router.navigateByUrl("/ibpredial-inicio/2-uso_sue");
  }
}
