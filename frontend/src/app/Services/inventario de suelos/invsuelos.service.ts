import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse, HttpErrorResponse } from '@angular/common/http';
import { throwError, Observable} from 'rxjs';
import { catchError, tap, map } from 'rxjs/operators';


@Injectable({
  providedIn: 'root'
})
export class InvsuelosService {
  serverUrl = 'http://localhost:3000';
  // serverUrl = 'http://192.168.43.170:3000';
  constructor( private http: HttpClient) { }

getData(ruta: string): Observable<any[]> {
  return this.http.get<any[]>(this.serverUrl + `/${ruta}`).pipe(
    tap(data => console.log(JSON.stringify(data))),
    catchError(this.handleError)
  );
}
saveFormData(registro: any): Observable<any[]> {

  return this.http.post<any[]>(this.serverUrl + '/usosuelos', registro).pipe(
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
} console.log(errorMessage);
  return throwError(errorMessage);
}
}
