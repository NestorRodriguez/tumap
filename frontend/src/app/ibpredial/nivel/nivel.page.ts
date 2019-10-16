import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-nivel',
  templateUrl: './nivel.page.html',
  styleUrls: ['./nivel.page.scss'],
})
export class NivelPage implements OnInit {

  buttonNiveles: any = [
    {
      nombreMenu: 'Un Piso'
    },
    {
      nombreMenu: 'Dos Pisos'
    },
    {
      nombreMenu: 'Tres Pisos'
    },
    {
      nombreMenu: 'Cuatro Pisos'
    },
    {
      nombreMenu: 'Cinco Pisos'
    },
  ];

  constructor() { }

  ngOnInit() {
  }

}
