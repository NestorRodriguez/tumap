import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';

import { Inscripcion } from '../../models/dbo/Inscripcion';
import { Observable, throwError  } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DboService {

  API_URL = 'https://tumap.azurewebsites.net';

    // Data formulario

  private respuestas = [];

  constructor(private http: HttpClient) {}

  getServerUrl() {
    return this.API_URL;
  }

  public getInscripcion(documento: string): Observable<any[]> {
      return this.http.get<any[]>(`${this.API_URL}/dbo_inscripcion/${documento}`);
      }

  public saveInscripcion(inscripcion: Inscripcion): Observable<any>  {
    return this.http.post<any>(`${this.API_URL}/dbo_inscripcion`, inscripcion);
  }

  public updateInscripcion(id: number, inscripcion: Inscripcion): Observable<any> {
    return this.http.put<any>(`${this.API_URL}/dbo_inscripcion/${id}`, inscripcion);
  }

  public getPreguntas(): Observable<any[]> {
    return this.http.get<any[]>(`${this.API_URL}/dbo_preguntas-respuestas`);
  }

  getImagenes() {
    console.log('Select Imagenes');
  }

  getRespuestas() {
    return this.respuestas;
  }

  public getExiteRespuesta(documento: number): Observable<any> {
    return this.http.get<any>(`${this.API_URL}/dbo_respuesta/${documento}`);
  }

  public getRespuestasResultado(): Observable<any[]> {
    return this.http.get<any[]>(`${this.API_URL}/dbo_respuesta`);
  }


  addRespuesta(respuesta) {
    this.respuestas.push(respuesta);
  }

  saveRespuesta() {
    try {
      // console.log(JSON.stringify(this.respuestas));
      // console.log(this.getRespuestas());
      return this.http.post(`${this.API_URL}/dbo_respuesta`, this.respuestas );
    } catch (error) {
      console.log(error);
    }
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

