import { Component } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  private selectedItem: any;
  private icons = [
    "md-map",
    "ios-albums",
    "trending-up",
    "flask",
    "wifi",
    "beer",
    "football",
    "basketball",
    "paper-plane",
    "american-football",
    "boat",
    "bluetooth",
    "build",
    "list-box",
    "film",
    "construct"
  ];
  public items: Array<{
    title: string;
    note: string;
    route: string;
    icon: string;
  }> = [];
  constructor() {
    this.items.push(
      {
        title: "Señalización y mobiliario urbano",
        note: "",
        route: "/categorias",
        icon: this.icons[0]
      },
      {
        title: "Inventario uso de suelos",
        note: "",
        route: "/instruccion",
        icon: this.icons[1]
      },
      {
        title: "Inventario redes secas",
        note: "",
        route: "/irs-inicio",
        icon: this.icons[4]
      },
      {
        title: "Encuesta Socio Economica",
        note: "",
        route: "/encuestasocial",
        icon: this.icons[1]
      },
      //{title: 'Información Predial Básica', note: '',  route: '/ibpredial-inicio', icon: this.icons[8]},
      {
        title: "Información Predial Básica",
        note: "",
        route: "/matricula",
        icon: this.icons[8]
      },
      {
        title: 'Encuesta Tipos de Suelo',
        note: '',
        route: '/inscripcion/0',
         icon: this.icons[13]
      },
      {
        title: 'Estado de vias',
        note: '',
        route: '/opcionesvias',
         icon: this.icons[14]
      },
      {
        
        title: 'Centros de salud',
        note: '',
        route: '/tab5',
         icon: this.icons[4]
      },
      {
        title: "Fuentes Hidricas / Etnobotanica",
        note: "",
        route: "/options",
        icon: this.icons[4]
      },
      {
        title: "Minas",
        note: "",
        route: "/menuminas",
        icon: this.icons[15]
      }
    );
  }

  ngOnInit() {}
  // add back when alpha.4 is out
  // navigate(item) {
  //   this.router.navigate(['/list', JSON.stringify(item)]);
  // }
}

