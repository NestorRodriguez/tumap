import { Component, OnInit } from "@angular/core";
import { Router } from "@angular/router";
import { PredialService } from "../../api/predial.service";
import { AlertController } from "@ionic/angular";

@Component({
  selector: "app-predial",
  templateUrl: "./predial.page.html",
  styleUrls: ["./predial.page.scss"]
})
export class PredialPage implements OnInit {
  buttonServicios: any = [
    {
      id_servicios: 1,
      nombreMenu: "Agua",
      toogleService: "",
      checked: false,
      disabled: false
    },
    {
      id_servicios: 2,
      nombreMenu: "Luz",
      toogleService: "",
      checked: false,
      disabled: false
    },
    {
      id_servicios: 3,
      nombreMenu: "Internet",
      toogleService: "",
      checked: false,
      disabled: false
    },
    {
      id_servicios: 4,
      nombreMenu: "Telefonía Fija",
      toogleService: "",
      checked: false,
      disabled: false
    },
    {
      id_servicios: 5,
      nombreMenu: "Telefonia Movil",
      toogleService: "",
      checked: false,
      disabled: false
    },
    {
      id_servicios: 6,
      nombreMenu: "Gas Natural",
      toogleService: "",
      checked: false,
      disabled: false
    },
    {
      id_servicios: 7,
      nombreMenu: "Gas Propano",
      toogleService: "",
      checked: false,
      disabled: false
    }
  ];

  predialBasico: any;
  usopredial: any[] = [];
  usonivel: any[] = [];
  errorMessage = ``;
  filtro: any[] = [];
  filteredProducts: any[] = [];
  state: any;

  constructor(
    private predialService: PredialService,
    private router: Router,
    private alertController: AlertController
  ) {}

  ngOnInit() {
    this.predialService.obtenerPredial().subscribe(
      data => {
        this.usopredial = data;
        console.log(this.usopredial);
      },
      error => {
        this.errorMessage = <any>error;
        this.presentAlert();
      }
    );

    this.predialService.obtenerNivel().subscribe(
      data => {
        this.usonivel = data;
        console.log(this.usonivel);
      },
      error => {
        this.errorMessage = <any>error;
        this.presentAlert();
      }
    );
  }

  async presentAlert() {
    // const alert = await this.alertController.create({
    //   header: 'Alert',
    //   subHeader: 'Server not found',
    //   message: 'Error en la conexión a Server.',
    //   buttons: ['OK']
    // });
    // await alert.present();
  }

  Toogle() {
    console.log(this.buttonServicios);
  }

  Aceptar() {
    this.GetLocalStorage();
    this.StateCheck();
    this.buttonServicios.map((data, key) => {
      this.predialBasico.serv_publicos[key] = data.toogleService;
    });

    // for (let i = 1; i <= this.buttonServicios.length; i++) {
    //   this.predialBasico.serv_publicos[i] = i;
    // }
    this.predialService.SaveLocalStorageItem(
      "predial_basica",
      JSON.stringify(this.predialBasico)
    );
    this.router.navigateByUrl("/ibpredial-inicio/1-serv_pub");
  }

  GetLocalStorage() {
    this.predialBasico = JSON.parse(
      this.predialService.GetLocalStorageItem("predial_basica")
    );
    console.log(this.predialBasico);
  }

  SaveLocalLstorage() {
    localStorage.setItem("checkState", JSON.stringify(this.state));
  }

  StateCheck() {
    this.state = JSON.parse(
      this.predialService.GetLocalStorageItem("checkState")
    );
    this.state.ser_pub = true;
    this.SaveLocalLstorage();
  }
}
