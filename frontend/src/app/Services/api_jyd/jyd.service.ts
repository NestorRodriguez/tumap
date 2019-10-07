import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError  } from 'rxjs';
import { catchError, tap, map} from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class JydService {

  serverUrlUsers = 'http://localhost:3000/users';
  serverUrlCategorias = 'http://localhost:3000/categoria';
  serverUrlSenalizacion = 'http://localhost:3000/item_senalizacion';
  serverUrlMobiliario = 'http://localhost:3000/item_mobiliario';
  constructor(public http: HttpClient) { }

  getPeople(): Observable<any[]> {
    return this.http.get<any[]>(this.serverUrlUsers).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
      );
  }

  getCategorias(): Observable<any[]> {
    return this.http.get<any[]>(this.serverUrlCategorias).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
      );
  }

  getItemSenalizacion(): Observable<any[]> {
    return this.http.get<any[]>(this.serverUrlSenalizacion).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
      );
  }

  getItemMobiliario(): Observable<any[]> {
    return this.http.get<any[]>(this.serverUrlMobiliario).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
      );
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
