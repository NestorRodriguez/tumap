import { Injectable } from "@angular/core";
import {
  HttpClient,
  HttpErrorResponse,
  HttpHeaders
} from "@angular/common/http";
import { Observable, throwError, of } from "rxjs";
import { catchError, tap, map, switchMap } from "rxjs/operators";
import { ToastController } from "@ionic/angular";
import { Matricula } from "../Interfaces/interfaces";

@Injectable({
  providedIn: "root"
})
export class PredialService {
  private predialUrl = "http://localhost:3000/usopredio";
  private nivelUrl = "http://localhost:3000/nivel";
  urlApi: string = "http://localhost:3000/predios";
  httpOptions = {
    headers: new HttpHeaders({
      "Content-Type": "application/json"
    })
  };

  constructor(private http: HttpClient) {}

  obtenerPredial(): Observable<any[]> {
    return this.http.get<any[]>(this.predialUrl).pipe(
      tap(data => JSON.stringify(data)),
      catchError(this.handleError)
    );
  }

  obtenerNivel(): Observable<any[]> {
    return this.http.get<any[]>(this.nivelUrl).pipe(
      tap(data => JSON.stringify(data)),
      catchError(this.handleError)
    );
  }

  obtenerPredialRoswell(matricula: string): Observable<any> {
    return this.http.get<Matricula>(`${this.urlApi}/${matricula}`).pipe(
      tap(data => JSON.stringify(data)),
      catchError(this.handleError)
    );
  }

  /**
   * Envia variable a Web Service con toda la data
   * @param coord = data con las coordenadas
   */
  SavePredial(): Observable<any> {
    let data = this.GetLocalStorageItem("predial_basica");
    const body = data;
    return this.http.post<any>(`${this.urlApi}`, body, this.httpOptions).pipe(
      switchMap(response => {
        console.log(response);
        return response.message !== "ok" ? throwError(response) : of(response);
      }),
      catchError(this.handleError)
    );
  }

  private handleError(err: HttpErrorResponse) {
    let errorMessage = "";
    let errorStatus = "";
    if (err.error instanceof ErrorEvent) {
      errorMessage = `An error ocurred: ${err.error.message}`;
      errorStatus = `${err.status}`;
    } else {
      errorMessage = `Error en la conexión`;
      errorStatus = `${err.status}`;
    }
    console.error(errorMessage);
    console.error(errorStatus);
    return throwError(errorMessage);
  }

  GetLocalStorageItem(item: string) {
    return localStorage.getItem(item);
  }

  SaveLocalStorageItem(name: string, data: any) {
    localStorage.setItem(name, data);
  }
}
