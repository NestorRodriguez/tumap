import { Component, OnInit } from "@angular/core";

@Component({
  selector: "app-nivel",
  templateUrl: "./nivel.page.html",
  styleUrls: ["./nivel.page.scss"]
})
export class NivelPage implements OnInit {
  buttonNiveles: any = [
    "Un Piso",
    "Dos Pisos",
    "Tres Pisos",
    "Cuatro Pisos",
    "Cinco Pisos"
  ];

  constructor() {}

  ngOnInit() {}
}
