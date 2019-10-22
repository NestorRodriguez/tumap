import { Component, OnInit } from "@angular/core";

@Component({
  selector: "app-list",
  templateUrl: "list.page.html",
  styleUrls: ["list.page.scss"]
})
export class ListPage implements OnInit {
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
    "film"
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
         icon: this.icons[14]
      },
      {
        title: "Aqui va otro servicio!",
        note: "",
        route: "/",
        icon: this.icons[2]
      }
    );
  }

  ngOnInit() {}
  // add back when alpha.4 is out
  // navigate(item) {
  //   this.router.navigate(['/list', JSON.stringify(item)]);
  // }
}
