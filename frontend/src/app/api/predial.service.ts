import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, tap, map } from 'rxjs/operators';
import { ToastController } from '@ionic/angular';

@Injectable({
  providedIn: 'root'
})
export class PredialService {

  private usoPredial = 'http://localhost:3000/usopredio';
  private nivel = 'http://localhost:3000/nivel';

  constructor(private http: HttpClient) { }

  /***************************************************************
   *Obtener datos de la tabla servicios_Publicos (DB TUMAP)
   **************************************************************/
  obtenerusoPredial(): Observable<any[]> {
    return this.http.get<any[]>(this.usoPredial).pipe(
      tap(data => (JSON.stringify(data))),
      catchError(this.handleError)
    );
  }

  /***************************************************************
   *Obtener datos de la tabla nivel_Vivienda (DB TUMAP)
   **************************************************************/
  obtenernivelVivienda(): Observable<any[]> {
    return this.http.get<any[]>(this.nivel).pipe(
      tap(data => (JSON.stringify(data))),
      catchError(this.handleError)
    );
  }

  /***************************************************************
   *Captura de error en conexión
   **************************************************************/
  private handleError(err: HttpErrorResponse) {
    let errorMessage = '';
    let errorStatus = '';
    if (err.error instanceof ErrorEvent) {
      errorMessage = `An error ocurred: ${err.error.message}`;
      errorStatus = `${err.status}`
    } else {
      /*errorMessage = `Error en la conexiónOjo Diego Server returned code: ${err.status}, error message is: ${err.message}`;*/
      errorMessage = `Error en la conexión`;
      errorStatus = `${err.status}`
    }
    console.error(errorMessage);
    console.error(errorStatus);
    return throwError(errorMessage);
  }

}
