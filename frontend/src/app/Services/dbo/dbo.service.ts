import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';

import { Inscripcion } from '../../models/dbo/Inscripcion';
import { Observable, throwError  } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DboService {

  API_URL = 'http://localhost:3000';

    // Data formulario
  // Se realizo asi mientras por DBO se hace y que quede igualito.

  private data = [
    {
      category: '¿Hay presencia de cobertura vegetal en la zona?',
      id_Pregunta: 1,
      expanded: true,
      isAdd: false,
      respuestas: [
        { id_Imagen: 1, id_Pregunta: 1, id_Inscripcion: 0, name: '', path: 'assets/dbo_img/imagen11.jpg' },
        { id_Imagen: 2, id_Pregunta: 1, id_Inscripcion: 0, name: '', path: 'assets/dbo_img/imagen12.jpg' }
      ]
    },
    {
      category: '¿Qué tipo de vegetación se encuentra en el terreno?',
      id_Pregunta: 2,
      isAdd: false,
      respuestas: [
        { id_Imagen: 3, id_Pregunta: 2, id_Inscripcion: 0, name: 'Pasto y maleza', path: 'assets/dbo_img/imagen21.jpg' },
        { id_Imagen: 4, id_Pregunta: 2, id_Inscripcion: 0, name: 'Muchos arbustos', path: 'assets/dbo_img/imagen22.jpg' },
        { id_Imagen: 5, id_Pregunta: 2, id_Inscripcion: 0, name: 'Presencia de arboles', path: 'assets/dbo_img/imagen23.jpg' }
      ]
    },
    {
      category: '¿Qué se puede observar en la superficie del suelo?',
      id_Pregunta: 3,
      isAdd: false,
      respuestas: [
        { id_Imagen: 6, id_Pregunta: 3, id_Inscripcion: 0, name: 'Tierra oscura', path: 'assets/dbo_img/imagen31.jpg' },
        { id_Imagen: 7, id_Pregunta: 3, id_Inscripcion: 0, name: 'Suelo arcilloso o arenoso', path: 'assets/dbo_img/imagen32.jpg' },
        { id_Imagen: 8, id_Pregunta: 3, id_Inscripcion: 0, name: 'Roca', path: 'assets/dbo_img/imagen33.jpg' }
      ]
    },
    {
      category: '¿Cuál es el color del suelo?',
      id_Pregunta: 4,
      isAdd: false,
      respuestas: [
        { id_Imagen: 9, id_Pregunta: 4, id_Inscripcion: 0, name: 'Colores claros', path: 'assets/dbo_img/imagen41.jpg' },
        { id_Imagen: 10, id_Pregunta: 4, id_Inscripcion: 0, name: 'Negra o oscura', path: 'assets/dbo_img/imagen42.jpg' },
        { id_Imagen: 11, id_Pregunta: 4, id_Inscripcion: 0, name: 'Rojiza', path: 'assets/dbo_img/imagen43.jpg' },
        { id_Imagen: 12, id_Pregunta: 4, id_Inscripcion: 0, name: 'Amarillento', path: 'assets/dbo_img/imagen44.jpg' },
        { id_Imagen: 13, id_Pregunta: 4, id_Inscripcion: 0, name: 'Grisaceo', path: 'assets/dbo_img/imagen45.jpg' }
      ]
    }
  ];

  private respuestas = [];

  constructor(private http: HttpClient) {}

  public getInscripcion(documento: string): Observable<any[]> {
      return this.http.get<any[]>(`${this.API_URL}/dbo_inscripcion/${documento}`);
      }

  public saveInscripcion(inscripcion: Inscripcion): Observable<any[]>  {
    return this.http.post<any[]>(`${this.API_URL}/dbo_inscripcion`, inscripcion);
  }

  public updateInscripcion(id: number, inscripcion: Inscripcion): Observable<any> {
    return this.http.put<any>(`${this.API_URL}/dbo_inscripcion/${id}`, inscripcion);
  }

  public getPreguntas(): Observable<any[]> {
    return this.http.get<any[]>(`${this.API_URL}/dbo_pregunta`);
  }

  // formulario
  getPreguntasData() {
    return this.data;
  }

  getImagenes() {
    console.log('Select Imagenes');
  }

  getRespuestas() {
    return this.respuestas;
  }

  addRespuesta(respuesta) {
    this.respuestas.push(respuesta);
  }

  public saveRespuesta()  {
      console.log(JSON.stringify(this.getRespuestas()));
      return this.http.post<any[]>(`${this.API_URL}/dbo_respuesta`, this.respuestas);
  }

  public handleError(err: HttpErrorResponse) {
    let errorMessage = '';
    if (err.error instanceof ErrorEvent) {
      errorMessage = `An error occurred: ${err.error.message}`;
    } else {
        errorMessage = `Server retorned code: ${err.status}, error message is: ${err.message}`;
    }
    console.error(errorMessage);
    return throwError(errorMessage);
  }
}

