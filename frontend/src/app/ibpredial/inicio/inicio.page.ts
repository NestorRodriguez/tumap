import { Platform } from "@ionic/angular";
import { Component, OnInit } from "@angular/core";
import { Router, ActivatedRoute } from "@angular/router";
import { PredialService } from "../../api/predial.service";

@Component({
  selector: "app-inicio",
  templateUrl: "./inicio.page.html",
  styleUrls: ["./inicio.page.scss"]
})
export class InicioPage implements OnInit {
  flag: [];
  iconName = ["radio-button-off", "radio-button-on"];

  iconColor = ["danger", "success"];

  checkState = {
    ser_pub: false,
    uso_sue: false,
    niv_viv: false,
    lim_col: false
  };

  buttonContainer: any = [
    {
      id: "serv_pub",
      nombreMenu: "Servicios Públicos",
      rLink: "/predial",
      icon: this.iconName[0],
      iconStart: "phone-portrait",
      colori: this.iconColor[0]
    },
    {
      id: "uso_sue",
      nombreMenu: "Uso de Suelos",
      rLink: "/estrato",
      icon: this.iconName[0],
      iconStart: "speedometer",
      colori: this.iconColor[0]
    },
    {
      id: "niv_viv",
      nombreMenu: "Nivel de vivienda",
      rLink: "/nivel",
      icon: this.iconName[0],
      iconStart: "home",
      colori: this.iconColor[0]
    },
    {
      id: "lim_col",
      nombreMenu: "Límites - Colindantes",
      rLink: "/colinda",
      icon: this.iconName[0],
      iconStart: "pin",
      colori: this.iconColor[0]
    }
  ];

  disabled = true;
  predial_basica: any;

  constructor(
    private route: Router,
    private activatedRoute: ActivatedRoute,
    private platform: Platform,
    private predialService: PredialService
  ) {}

  var: any;

  ngOnInit() {
    this.SvCheckStateLocalStorage();
    this.estadoBoton();
    //this.checkList();
    this.var = this.activatedRoute.snapshot.paramMap.get("id");
    if (this.var !== null) {
      this.flag = this.var.split("-");
      let optMenu = this.var.split("-")[1];
      console.log(this.flag);
    }
  }

  showDetail(url: string) {
    this.route.navigateByUrl(url);
  }

  SaveLocalLstorage() {
    localStorage.setItem("predial_basica", JSON.stringify(this.predial_basica));
  }

  SvCheckStateLocalStorage() {
    if (this.predialService.GetLocalStorageItem("checkState") === null) {
      localStorage.setItem("checkState", JSON.stringify(this.checkState));
    }
  }

  // checkList() {
  //   let optMenu = JSON.parse(
  //     this.predialService.GetLocalStorageItem("checkState")
  //   );

  //   this.buttonContainer.id["lim_col"] = optMenu.lim_col;
  //   this.buttonContainer.id["niv_viv"] = optMenu.niv_viv;
  //   this.buttonContainer.id["ser_pub"] = optMenu.ser_pub;
  //   this.buttonContainer.id["uso_sue"] = optMenu.uso_sue;

  //   this.buttonContainer.find((data, key) => {
  //     if (data.id === optMenu) {
  //       this.buttonContainer[key].icon = this.iconName[1];
  //       this.buttonContainer[key].colori = this.iconColor[1];
  //     }
  //   });

  //   this.buttonContainer.find((data, key) => {
  //     if (data.id === optMenu) {
  //       this.buttonContainer[key].icon = this.iconName[1];
  //       this.buttonContainer[key].colori = this.iconColor[1];
  //     }
  //   });
  // }

  estadoBoton() {
    let checkState = JSON.parse(
      this.predialService.GetLocalStorageItem("checkState")
    );
    console.log("cheksate...", checkState);
    if (
      checkState.ser_pub === true &&
      checkState.uso_sue === true &&
      checkState.niv_viv === true &&
      checkState.lim_col === true
    ) {
      this.disabled = false;
    }
  }

  Grabar() {
    this.predialService
      .SavePredial()
      .subscribe(resp => console.log(resp), error => console.log(error));
  }

  Cancelar() {
    this.route.navigateByUrl("/matricula");
  }
}
