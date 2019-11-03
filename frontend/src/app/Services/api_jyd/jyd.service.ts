import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError  } from 'rxjs';
import { catchError, tap, map} from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class JydService {

  serverUrl = 'http://localhost:3000';
  // serverUrl = 'http://192.168.1.58:3000';
  // serverUrl = 'http://192.168.43.184:3000';

  constructor(public http: HttpClient) { }

  getPeople(): Observable<any[]> {
    return this.http.get<any[]>(`${this.serverUrl}/users`).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
      );
  }

  getCategorias(): Observable<any[]> {
    return this.http.get<any[]>(`${this.serverUrl}/categoria`).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
      );
  }

  getItemSenalizacion(): Observable<any[]> {
    return this.http.get<any[]>(`${this.serverUrl}/item_senalizacion`).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
      );
  }

  getItemMobiliario(): Observable<any[]> {
    return this.http.get<any[]>(`${this.serverUrl}/item_mobiliario`).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
      );
  }

  getDatosItem(id: string) {
    return this.http.get<any[]>(`${this.serverUrl}/item/${id}`).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
      );
  }

  getRegistros() {
    return this.http.get<any[]>(`${this.serverUrl}/registro_item`).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
      );
  }

  setRegistro(data) {
    return this.http.post(`${this.serverUrl}/registro_item`, data);
  }

  setHistorico(data) {
    return this.http.post(`${this.serverUrl}/historico_item`, data);
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
