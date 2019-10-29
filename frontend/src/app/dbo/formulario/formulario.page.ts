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


  constructor(private dbo: DboService, private router: Router, private actRoute: ActivatedRoute) {}

  ngOnInit() {
    this.idInscripcion = this.actRoute.snapshot.paramMap.get('id');
    this.dbo.getPreguntas().subscribe(data => {
      this.preguntas = data;
      console.log(this.preguntas);
      this.items = this.dbo.getRespuestas();
      console.log(this.items);
    });
  }

  addToRespuestas(pregunta, respuesta) {
    pregunta.isAdd = true;
    // delete respuesta.name;
    // delete respuesta.path;
    respuesta.id_inscripcion = Number(this.idInscripcion);
    this.dbo.addRespuesta(respuesta);
    console.log('addRespuesta: ', respuesta);
  }

  openRespuestas() {
    this.router.navigate(['respuestas']);
    console.log('navegate respuestas');
  }

  saveRespuestas() {

    this.dbo.getExiteRespuesta( parseInt(this.idInscripcion, 0) ).subscribe(
      res => {
        console.log(res);
        if ( res[0].count === 0) {
          console.log(JSON.stringify(this.dbo.getRespuestas()));
          this.dbo.saveRespuesta().subscribe(
            data => {
              console.log(data);
            },
            error => console.log(error)
          );
        }
      },
      err => console.error(err)
    );

  }

}
