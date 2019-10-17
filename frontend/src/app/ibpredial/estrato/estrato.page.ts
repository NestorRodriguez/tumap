import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-estrato',
  templateUrl: './estrato.page.html',
  styleUrls: ['./estrato.page.scss'],
})
export class EstratoPage implements OnInit {

  buttonUsos: any = [
    {
      nombreMenu: 'Residencial'
    },
    {
      nombreMenu: 'Rural'
    },
    {
      nombreMenu: 'Comercial'
    },
    {
      nombreMenu: 'Mixto'
    },
  ];

  constructor() { }

  ngOnInit() {
  }

}
