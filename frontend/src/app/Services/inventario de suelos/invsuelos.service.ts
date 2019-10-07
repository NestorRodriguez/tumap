import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse, HttpErrorResponse } from '@angular/common/http';
import { throwError, Observable} from 'rxjs';
import { catchError, tap, map } from 'rxjs/operators';


@Injectable({
  providedIn: 'root'
})
export class InvsuelosService {
  serverUrl = 'http://localhost:3000';
  bodyForm: any;
  constructor( private http: HttpClient) { }

getData(): Observable<any[]> {
  return this.http.get<any[]>(this.serverUrl + '/suelos').pipe(
    tap(data => console.log(JSON.stringify(data))),
    catchError(this.handleError)
  );
}
saveFormData(): Observable<any[]> {
  return this.http.post<any[]>(this.serverUrl + '/suelos', this.bodyForm).pipe(
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
