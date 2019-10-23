import { Component, OnInit } from '@angular/core';
import { HidroServicesService } from 'src/app/Services/hidroetno/hidro-services.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-hogaropt',
  templateUrl: './hogaropt.page.html',
  styleUrls: ['./hogaropt.page.scss'],
})
export class HogaroptPage implements OnInit {
  //  objetoInfo = {
  //    valorColor: null,
  //    valorPresion: null,
  //    valorTipo: null
  //  };

  constructor(private servicio: HidroServicesService) { }

  public color: any;
  public presion: any;
  public valorTipo: any;

  ngOnInit() {
  }

  saveCoverages() {
    const data = {
      color: this.color,
      presion: this.presion,
      valorTipo: this.valorTipo,
    };
    this.servicio.setCoverturas(data).subscribe(response => {
      console.log(response);
    });
  }

}


  // colorChanged(event){
  //   this.objetoInfo.valorColor = event.detail.value;
  // }

  // presionChanged( event ) {
  //   this.objetoInfo.valorPresion = event.detail.value
  // }

  // valorChanged( event ) {
  //   this.objetoInfo.valorTipo = event.detail.value
  // }

  // guardar(){
  //   console.log(this.objetoInfo);
  //   this.servicio.capturaInfo(this.objetoInfo);
  // }



