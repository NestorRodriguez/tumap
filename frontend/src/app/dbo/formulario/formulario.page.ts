import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-formulario',
  templateUrl: './formulario.page.html',
  styleUrls: ['./formulario.page.scss'],
})
export class FormularioPage implements OnInit {

  constructor() { }
  imagenes = [ 
    'assets/dbo_img/imagen11.jpg',
    'assets/dbo_img/imagen21.jpg',
    'assets/dbo_img/imagen32.jpg',
    'assets/dbo_img/imagen42.jpg',
    'assets/dbo_img/Imagen52.jpg',
    'assets/dbo_img/imagen63.jpg',
    'assets/dbo_img/Imagen73.jpg',
    'assets/dbo_img/imagen83.jpg',
    'assets/dbo_img/Imagen94.jpg',
    'assets/dbo_img/imagen104.jpg',
    'assets/dbo_img/imagen114.jpg',
    'assets/dbo_img/imagen124.jpg',
    'assets/dbo_img/imagen134.jpg',
    
  
  ];
  verImagen(){
  alert('assets/respuestas/imagen 11.jpg')
}

  ngOnInit() {
  }
  

}
