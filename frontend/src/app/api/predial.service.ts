import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, tap, map } from 'rxjs/operators';
import { ToastController } from '@ionic/angular';

@Injectable({
  providedIn: 'root'
})
export class PredialService {

  private paisUrl = 'http://localhost:3000/usopredio';

  constructor(private http: HttpClient) { }

  obtenerData(): Observable<any[]> {
    return this.http.get<any[]>(this.paisUrl).pipe(
      tap(data => (JSON.stringify(data))),
      catchError(this.handleError)
    );
  }

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
