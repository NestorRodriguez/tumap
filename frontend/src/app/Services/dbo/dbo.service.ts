import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';

import { Inscripcion } from '../../models/dbo/Inscripcion';
import { Observable, throwError  } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DboService {

  API_URL = 'http://localhost:3000';

  // : Observable<Inscripcion>

  constructor(private http: HttpClient) {}

  public getInscripcion(documento: string): Observable<any[]> {
      return this.http.get<any[]>(`${this.API_URL}/dbo_inscripcion/${documento}`);
      }

  public saveInscripcion(inscripcion: Inscripcion): Observable<any> {
    return this.http.post<any>(`${this.API_URL}/dbo_inscripcion`, inscripcion);
  }

  public updateInscripcion(id: number, inscripcion: Inscripcion): Observable<any> {
    return this.http.put<any>(`${this.API_URL}/dbo_inscripcion/${id}`, inscripcion);
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

