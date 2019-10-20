import { Component, OnInit } from '@angular/core';
import { DboService } from 'src/app/Services/dbo/dbo.service';


@Component({
  selector: 'app-respuestas',
  templateUrl: './respuestas.page.html',
  styleUrls: ['./respuestas.page.scss'],
})
export class RespuestasPage implements OnInit {

  selectedItems = [] ;
  total = 0;

  constructor(private dboService: DboService) { }

  ngOnInit() {
    const items = this.dboService.getRespuestas();
    const selected = {};
    for (const obj of items) {
      if (selected[obj.id]) {
        selected[obj.id].count++;
      } else {
        selected[obj.id] = {...obj, count: 1};
      }
    }
    this.selectedItems = Object.keys(selected).map(key => selected[key]);
    console.log('items: ', this.selectedItems);
    this.total = this.selectedItems.reduce((a, b) => a + b.count, 0);
  }
}

