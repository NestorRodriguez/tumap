import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-list',
  templateUrl: 'list.page.html',
  styleUrls: ['list.page.scss']
})
export class ListPage implements OnInit {
  private selectedItem: any;
  private icons = [
    'md-map',
    'ios-albums',
    'trending-up',
    'flask',
    'wifi',
    'beer',
    'football',
    'basketball',
    'paper-plane',
    'american-football',
    'boat',
    'bluetooth',
    'build'
  ];
  public items: Array<{ title: string; note: string; route: string; icon: string }> = [];
  constructor() {
    this.items.push(
      {title: 'Señalización y mobiliario urbano', note: '',  route: '/categorias', icon: this.icons[0]},
      {title: 'Inventario uso de suelos', note: '',  route: '/formulariosuelos', icon: this.icons[1]},
      {title: 'Información Predial', note: '',  route: '/predial', icon: this.icons[2]},
      {title: 'Aqui va otro servicio!', note: '', route: '/', icon: this.icons[3]}
    );
  }

  ngOnInit() {
  }
  // add back when alpha.4 is out
  // navigate(item) {
  //   this.router.navigate(['/list', JSON.stringify(item)]);
  // }
}
