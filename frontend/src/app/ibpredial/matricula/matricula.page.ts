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
  predial_basica: {
    matricula: number;
    uso_suelo: number;
    nivel_vivienda: number;
    limites: number[];
    serv_publicos: boolean[];
  };

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
    this.InicializarPredialBasico();
  }

  InicializarPredialBasico() {
    let validar = this.predialService.GetLocalStorageItem("predial_basica");
    this.predial_basica = {
      matricula: 0,
      uso_suelo: 0,
      nivel_vivienda: 0,
      limites: [0.0, 0.0],
      serv_publicos: [false, false, false, false, false, false, false]
    };
    this.SaveLocalLstorage();
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
          //this.router.navigateByUrl("/ibpredial-inicio");
          console.log(this.loadPredial);
        } else {
          this.loadingController.dismiss();
          this.alertControl();
        }
      },
      error => {
        this.loadingController.dismiss();
        alert("Error en la conexion");
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
            this.GetLocalStorage();
            console.log(this.validarForm.value);
            this.predial_basica.matricula = this.validarForm.value.matricula;
            this.SaveLocalLstorage();
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

  GetLocalStorage() {
    this.predial_basica = JSON.parse(
      this.predialService.GetLocalStorageItem("predial_basica")
    );
    console.log(this.predial_basica);
  }

  SaveLocalLstorage() {
    localStorage.setItem("predial_basica", JSON.stringify(this.predial_basica));
  }
}
