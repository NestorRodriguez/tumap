import { Platform } from '@ionic/angular';
import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.page.html',
  styleUrls: ['./inicio.page.scss'],
})
export class InicioPage implements OnInit {

  flag: [];
  iconName = [
    'radio-button-off', 'radio-button-on'
  ]

  buttonContainer: any = [
    {
      id: 'serv_pub',
      nombreMenu: 'Servicios Públicos',
      rLink: '/predial',
      icon: this.iconName[0],
      iconStart: 'phone-portrait'
    },
    {
      id: 'uso_sue',
      nombreMenu: 'Uso de Suelos',
      rLink: '/pd',
      icon: this.iconName[0],
      iconStart: 'speedometer'
    },
    {
      id: 'niv_viv',
      nombreMenu: 'Nivel de vivienda',
      rLink: '/pd',
      icon: this.iconName[0],
      iconStart: 'home'
    },
    {
      id: 'lim_col',
      nombreMenu: 'Límites - Colindantes',
      rLink: '/colinda',
      icon: this.iconName[0],
      iconStart: 'pin'
    },    
  ];
  constructor(
    private route:Router, 
    private activatedRoute:ActivatedRoute,
    private platform: Platform) {
    }

  var: any;

  ngOnInit() {
    console.log(this.buttonContainer);
    this.var = this.activatedRoute.snapshot.paramMap.get('id')
    console.log(this.var)
    if(this.var !== null){
      this.flag = this.var.split('-')
      let optMenu = this.var.split('-')[1]
      console.log(this.flag);
      
      this.buttonContainer.find( (data, key) => {
        console.log(key)
        if(data.id=== optMenu){
          this.buttonContainer[key].icon = this.iconName[1]
        }
      });
      console.log(this.buttonContainer);      
    }    
  }

  showDetail(url: string){
    this.route.navigateByUrl(url)
  }

}
