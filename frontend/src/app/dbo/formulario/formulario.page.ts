import { Component, OnInit } from '@angular/core';
import { DboService } from 'src/app/Services/dbo/dbo.service';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-formulario',
  templateUrl: './formulario.page.html',
  styleUrls: ['./formulario.page.scss'],
})
export class FormularioPage implements OnInit {

  preguntas = [];
  items = [];
  idInscripcion: string;

  sliderConfig = {
    spaceBetween: 10,
    centeredSlides: true,
    slidesPerView: 1.6
  };


  constructor(private dboService: DboService, private router: Router, private actRoute: ActivatedRoute) {}

  ngOnInit() {
    this.idInscripcion = this.actRoute.snapshot.paramMap.get('id');
    this.preguntas = this.dboService.getPreguntasData();
    console.log(this.preguntas);
    this.items = this.dboService.getRespuestas();
    console.log(this.items);
  }

  addToRespuestas(pregunta, respuesta) {
    pregunta.isAdd = true;
    // delete respuesta.name;
    // delete respuesta.path;
    respuesta.id_Inscripcion = Number(this.idInscripcion);
    this.dboService.addRespuesta(respuesta);
    console.log('addRespuesta: ', respuesta);

  }

  openRespuestas() {
    this.router.navigate(['respuestas']);
    console.log('navegate respuestas');
  }

  saveRespuestas() {
    this.dboService.saveRespuesta().subscribe(
      res => {
        console.log(res);
      },
      err => console.error(err)
    );
    console.log('save respuestas');
  }

}
