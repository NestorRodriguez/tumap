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
      expanded: true,
      idPregunta: 1,
      products: [
        { id: 1, name: 'Si', path: '/assets/dbo/imagen11.jpg' },
        { id: 2, name: 'No', path: '/assets/dbo/imagen12.jpg' }
      ]
    },
    {
      category: '¿Qué tipo de vegetación se encuentra en el terreno?',
      idPregunta: 2,
      products: [
        { id: 3, name: 'imagen21', path: '/assets/dbo/imagen21.jpg' },
        { id: 4, name: 'imagen22', path: '/assets/dbo/imagen22.jpg' },
        { id: 5, name: 'imagen23', path: '/assets/dbo/imagen23.jpg' }
      ]
    },
    {
      category: '¿Qué se puede observar en la superficie del suelo?',
      idPregunta: 3,
      products: [
        { id: 6, name: 'Suelo de color oscuro', path: '/assets/dbo/imagen31.jpg' },
        { id: 7, name: 'Suelo arcilloso o arenoso', path: '/assets/dbo/imagen32.jpg' },
        { id: 8, name: 'Roca / material pétreo', path: '/assets/dbo/imagen33.jpg' }
      ]
    },
    {
      category: '¿Cuál es el color del suelo?',
      idPregunta: 4,
      products: [
        { id: 9, name: 'imagen41', path: '/assets/dbo/imagen41.jpg' },
        { id: 10, name: 'imagen42', path: '/assets/dbo/imagen42.jpg' },
        { id: 11, name: 'imagen43', path: '/assets/dbo/imagen43.jpg' },
        { id: 12, name: 'imagen44', path: '/assets/dbo/imagen44.jpg' }
      ]
    }
  ];

  private cart = [];


  // : Observable<Inscripcion>

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

  public getPreguntas(documento: string): Observable<any[]> {
    return this.http.get<any[]>(`${this.API_URL}/dbo_pregunta`);
  }

  // formulario
  getPreguntasData() {
    return this.data;
  }
  getRespuestas() {
    return this.cart;
  }
  addRespuesta(product) {
    this.cart.push(product);
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

