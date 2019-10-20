import { Component, OnInit } from "@angular/core";
import { Router } from "@angular/router";
import { LoadingController } from "@ionic/angular";
import { PredialService } from "../../api/predial.service";

@Component({
  selector: "app-nivel",
  templateUrl: "./nivel.page.html",
  styleUrls: ["./nivel.page.scss"]
})
export class NivelPage implements OnInit {
  buttonNiveles: any = [
    { id_nivel: 1, descripcion: "Un Piso" },
    { id_nivel: 2, descripcion: "Dos Pisos" },
    { id_nivel: 3, descripcion: "Tres Pisos" },
    { id_nivel: 4, descripcion: "Cuatro Pisos" },
    { id_nivel: 5, descripcion: "Cinco Pisos" }
  ];

  id_nivel: number;
  predialBasico: any;
  constructor(
    private router: Router,
    private loadingController: LoadingController,
    private predialService: PredialService
  ) {}

  ngOnInit() {
    this.GetLocalStorage();
  }

  Aceptar() {
    this.predialBasico.nivel_vivienda = this.id_nivel;
    this.predialService.SaveLocalStorageItem(
      "predial_basica",
      JSON.stringify(this.predialBasico)
    );
    this.router.navigateByUrl("/ibpredial-inicio/3-niv_viv");
  }

  testRadio() {
    console.log(this.id_nivel);
  }

  GetLocalStorage() {
    this.predialBasico = JSON.parse(
      this.predialService.GetLocalStorageItem("predial_basica")
    );
    console.log(this.predialBasico);
  }
}
