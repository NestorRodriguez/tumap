import { Component, OnInit } from "@angular/core";
import { Marcador } from "../../models/colinda/marcador";
import { Router } from "@angular/router";
import { LoadingController } from "@ionic/angular";
import { PredialService } from "../../api/predial.service";

@Component({
  selector: "app-colinda",
  templateUrl: "./colinda.page.html",
  styleUrls: ["./colinda.page.scss"]
})
export class ColindaPage implements OnInit {
  //marcadores : Marcador[] = [];
  predialBasico: any;
  markets: any = [{ lat: "", lng: "", title: "", description: "" }];
  lat = 4.60972222222;
  lng = -74.0816666667;
  icon: any = {};
  btnState: boolean = true;
  varColor: string = "medium";
  state: any;

  constructor(
    private router: Router,
    private predialService: PredialService,
    private loadingController: LoadingController
  ) {}

  ngOnInit() {
    this.icon = {
      url: "/assets/LOGO VERDE.svg",
      scaledSize: {
        width: 35,
        height: 35
      }
    };
  }
  ingresarMarcador(
    lat: number,
    lng: number,
    title: string,
    description: string
  ) {
    //const nuevoMarcador = new Marcador(lat, lng, title, description);
    this.markets[0] = new Marcador(lat, lng, title, description);
    console.log(this.markets);
    this.lat = lat;
    this.lng = lng;
    this.btnState = false;
    this.varColor = "primary";
  }

  agregarMarcador(evento) {
    this.ingresarMarcador(
      parseFloat(evento.coords.lat),
      parseFloat(evento.coords.lng),
      evento.coords.title,
      evento.coords.description
    );
  }

  async SaveCoordenda() {
    await this.presentLoading();
    this.GetLocalStorage();
    this.StateCheck();
    this.Coordenadas();
  }

  Coordenadas() {
    this.predialBasico.limites[0] = this.lat;
    this.predialBasico.limites[1] = this.lng;
    this.predialService.SaveLocalStorageItem(
      "predial_basica",
      JSON.stringify(this.predialBasico)
    );
    this.router.navigateByUrl("/ibpredial-inicio/4-lim_col");
  }

  GetLocalStorage() {
    this.predialBasico = JSON.parse(
      this.predialService.GetLocalStorageItem("predial_basica")
    );
  }

  async presentLoading() {
    const loading = await this.loadingController.create({
      message: "Guardando",
      duration: 500,
      spinner: "bubbles"
    });
    await loading.present();
    await loading.onDidDismiss();
  }

  SaveLocalLstorage() {
    localStorage.setItem("checkState", JSON.stringify(this.state));
  }

  StateCheck() {
    this.state = JSON.parse(
      this.predialService.GetLocalStorageItem("checkState")
    );
    this.state.lim_col = true;
    this.SaveLocalLstorage();
  }
}
