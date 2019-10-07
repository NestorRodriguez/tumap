import { Component, OnInit } from '@angular/core';
import { JydService } from '../Services/api_jyd/jyd.service';

@Component({
  selector: 'app-mobiliario',
  templateUrl: './mobiliario.page.html',
  styleUrls: ['./mobiliario.page.scss'],
})
export class MobiliarioPage implements OnInit {

  constructor(private getItem: JydService) { }

  items: any[] = [];
  errorMessage = '';

  ngOnInit() {
    this.getItem.getItemMobiliario().subscribe( item => {
      this.items = item;
    }, error => this.errorMessage = error);
  }

}
