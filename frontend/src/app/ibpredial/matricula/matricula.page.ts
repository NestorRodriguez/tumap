import { Router } from "@angular/router";
import { LoadingController } from "@ionic/angular";
import { AlertController } from "@ionic/angular";
import { HttpClient } from "@angular/common/http";
import { Component, OnInit } from "@angular/core";
import { Matricula } from "src/app/Interfaces/interfaces";
import {
  FormGroup,
  FormBuilder,
  Validators,
  FormControl
} from "@angular/forms";
import { PredialService } from "../../api/predial.service";

@Component({
  selector: "app-matricula",
  templateUrl: "./matricula.page.html",
  styleUrls: ["./matricula.page.scss"]
})
export class MatriculaPage implements OnInit {
  loadPredial: Matricula;
  getWebService: any;
  validarForm: FormGroup;
  direccion: string = "";

  constructor(
    private httpClient: HttpClient,
    private formBuilder: FormBuilder,
    private predialService: PredialService,
    private router: Router,
    private alertController: AlertController,
    private loadingController: LoadingController
  ) {
    this.validarForm = this.formBuilder.group({
      matricula: new FormControl(
        "",
        Validators.compose([Validators.required, Validators.minLength(3)])
      )
    });
  }

  ngOnInit() {
    // this.getDataFromNodeJs().subscribe(
    //   data => {
    //     this.getWebService = data;
    //     console.log(this.getWebService);
    //     console.log(data);
    //   },
    //   error => console.log(error)
    // );
  }

  async getDataFromNodeJsId() {
    await this.presentLoading();
    let matricula = this.validarForm.value.matricula;
    console.log(`getDataFromNodeJs`);
    this.predialService.obtenerPredialRoswell(matricula).subscribe(
      data => {
        this.loadPredial = data;
        if (this.loadPredial !== null) {
          this.predialService.SaveLocalStorageItem(
            "dataFromNodeJsId",
            JSON.stringify(this.loadingController)
          );
          this.loadingController.dismiss();
          this.router.navigateByUrl("/ibpredial-inicio");
          console.log(this.loadPredial);
        } else {
          this.loadingController.dismiss();
          this.alertControl();
        }
      },
      error => {
        this.loadingController.dismiss();
        console.log(error);
      }
    );
  }

  Cancelar() {
    console.log(`Ha presioando boton cancelar...`);
  }

  async alertControl() {
    const alert = await this.alertController.create({
      header: "Deseas Ingresar este Predio?",
      message: "Confirmar que deseas <strong>crear</strong>",
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

  async presentLoading() {
    const loading = await this.loadingController.create({
      message: "Consultando",
      //duration: 2000,
      spinner: "bubbles"
    });
    await loading.present();
    //await loading.onDidDismiss();
  }
}
