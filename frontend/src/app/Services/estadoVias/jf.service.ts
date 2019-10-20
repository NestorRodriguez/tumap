import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse, HttpErrorResponse } from '@angular/common/http';
import { throwError, Observable} from 'rxjs';
import { catchError, tap, map } from 'rxjs/operators';


@Injectable({
  providedIn: 'root'
})
export class JfService {
  serverUrl = 'http://localhost:3000';
  // serverUrl = 'http://192.168.1.58:3000';
  almacenamiento: any;
  constructor( private http: HttpClient) { }

consulta(ruta: string): Observable<any[]> {
  return this.http.get<any[]>(this.serverUrl + ruta).pipe(
    tap(vias => console.log(JSON.stringify(vias))),
    catchError(this.handleError)
  );
}
guardar(body: any): Observable<any[]> {
  return this.http.post<any[]>(this.serverUrl + '/suelos', body).pipe(
    tap(data => console.log(JSON.stringify(data))),
    catchError(this.handleError)
  );
}
recibirDatos(datos: any) {
  this.almacenamiento = datos;
  console.log('recibir', this.almacenamiento);
}

enviarDatos() {
  return this.almacenamiento;
}

private handleError(err: HttpErrorResponse) {
  let errorMessage = '';
  if (err.error instanceof ErrorEvent) {
    errorMessage = `An error ocurred ${ err.error.message }`;
  } else {
    errorMessage = `Server returned code: ${err.status}, error message is:   ${err.message}`;
} console.log(errorMessage);
  return throwError(errorMessage);
}
}
