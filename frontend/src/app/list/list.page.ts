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
    this.items.push({
      title: 'Señalización y mobiliario urbano',
      note: '',
      route: '/categorias',
      icon: this.icons[0]
    },
    {
      title: 'Aqui va otro servicio!',
      note: '',
      route: '/',
      icon: this.icons[1]
    });
  }

  ngOnInit() {
  }
  // add back when alpha.4 is out
  // navigate(item) {
  //   this.router.navigate(['/list', JSON.stringify(item)]);
  // }
}
