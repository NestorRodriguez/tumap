import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-exterioropt',
  templateUrl: './exterioropt.page.html',
  styleUrls: ['./exterioropt.page.scss'],
})
export class ExterioroptPage implements OnInit {

  constructor() { }

  ngOnInit() {
  }
  segmentChanged( event ) {
    const valorSegmento = event.detail.value;
    console.log(event);
  }

}