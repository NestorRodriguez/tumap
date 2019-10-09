import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError  } from 'rxjs';
import { catchError, tap, map} from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class MinasService {

  serverUrlUsers = 'http://localhost:3000/users';
  serverUrlMinasEstadoActual = 'http://localhost:3000/Minas/EstadoActual';
  serverUrlMinasTipoMaterial = 'http://localhost:3000/Minas/TipoMaterial';
  serverUrlMinasSistemaExplotacion = 'http://localhost:3000/Minas/SistemaExplotacion';
  serverUrlMinasRegistroMina = 'http://localhost:3000/Minas/RegistroMina';
  constructor(public http: HttpClient) { }

  getPeople(): Observable<any[]> {
    return this.http.get<any[]>(this.serverUrlUsers).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
      );
  }

  getMinasEstadoActual(): any/*: Observable<any[]>*/ {
    return this.http.get(this.serverUrlMinasEstadoActual);
    /*<any[]>(this.serverUrlMinasEstadoActual).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
      );*/
  }
  getMinaMinasTipoMaterial(): Observable<any[]> {
    return this.http.get<any[]>(this.serverUrlMinasTipoMaterial).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
      );
  }

  getMinasSistemaExplotacion(): Observable<any[]> {
    return this.http.get<any[]>(this.serverUrlMinasSistemaExplotacion).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
      );
  }

  getMinasRegistroMina(): Observable<any[]> {
    return this.http.get<any[]>(this.serverUrlMinasRegistroMina).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
      );
  }

  setEstadoActual(data: any) {
    return this.http.post(this.serverUrlMinasEstadoActual, data);
  }

  private handleError(err: HttpErrorResponse) {
    let errorMessage = '';
    if (err.error instanceof ErrorEvent) {
      errorMessage = `An error ocurred ${ err.error.message }`;
    } else {
      errorMessage = `Server returned code: ${err.status}, error message is:   ${err.message}`;
  }    console.log(errorMessage);
    return throwError(errorMessage);
  }
}
