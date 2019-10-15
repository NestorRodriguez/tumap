import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-hogaropt',
  templateUrl: './hogaropt.page.html',
  styleUrls: ['./hogaropt.page.scss'],
})
export class HogaroptPage implements OnInit {

  constructor() { }

  ngOnInit() {
  }

  segmentChanged( event ) {
    const valorSegmento = event.detail.value;
    console.log(event);
  }
}

