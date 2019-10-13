import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, tap, map } from 'rxjs/operators';

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
  // Estado Actual
  getMinasEstadoActual(): Observable<any[]> {

    return this.http.get<any[]>(this.serverUrlMinasEstadoActual).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
    );
  }

  setEstadoActual(data: any) {
    return this.http.post(this.serverUrlMinasEstadoActual, data);
  }

  getEstadoActualC(id: string) {
    return this.http.get(`${this.serverUrlMinasEstadoActual}/${id}`);
  }

  putEstadoActual(data: any) {
    console.log(data);
    return this.http.put(this.serverUrlMinasEstadoActual, data);
  }

  deleteEstadoActual(id: string) {
    console.log(`${this.serverUrlMinasEstadoActual}/${id}`);
    return this.http.delete(`${this.serverUrlMinasEstadoActual}/${id}`);
  }

  // Tipo de Material
  getMinaMinasTipoMaterial(): Observable<any[]> {
    return this.http.get<any[]>(this.serverUrlMinasTipoMaterial).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
    );
  }

  setMinasTipoMaterial(data: any) {
    return this.http.post(this.serverUrlMinasTipoMaterial, data);
  }

  getMinasTipoMaterialC(id: string) {
    return this.http.get(`${this.serverUrlMinasTipoMaterial}/${id}`);
  }

  putMinasTipoMaterial(data: any) {
    console.log(data);
    return this.http.put(this.serverUrlMinasTipoMaterial, data);
  }

  deleteMinasTipoMaterial(id: string) {
    console.log(`${this.serverUrlMinasTipoMaterial}/${id}`);
    return this.http.delete(`${this.serverUrlMinasTipoMaterial}/${id}`);
  }

  // Sistema de Explotacion
  getMinasSistemaExplotacion(): Observable<any[]> {
    return this.http.get<any[]>(this.serverUrlMinasSistemaExplotacion).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
    );
  }


  setSistemaExplotacion(data: any) {
    return this.http.post(this.serverUrlMinasSistemaExplotacion, data);
  }

  getSistemaExplotacionC(id: string) {
    return this.http.get(`${this.serverUrlMinasSistemaExplotacion}/${id}`);
  }

  putSistemaExplotacion(data: any) {
    console.log(data);
    return this.http.put(this.serverUrlMinasSistemaExplotacion, data);
  }

  deleteSistemaExplotacion(id: string) {
    console.log(`${this.serverUrlMinasSistemaExplotacion}/${id}`);
    return this.http.delete(`${this.serverUrlMinasSistemaExplotacion}/${id}`);
  }

  // Termina Explotación

  // Registro Mina
  getMinasRegistroMina(): Observable<any[]> {
    return this.http.get<any[]>(this.serverUrlMinasRegistroMina).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
    );
  }

  setSistemaRegistroMina(data: any) {
    return this.http.post(this.serverUrlMinasRegistroMina, data);
  }

  getSistemaRegistroMinaC(id: string) {
    return this.http.get(`${this.serverUrlMinasRegistroMina}/${id}`);
  }

  putSistemaRegistroMina(data: any) {
    console.log(data);
    return this.http.put(this.serverUrlMinasRegistroMina, data);
  }

  deleteSistemaRegistroMina(id: string) {
    console.log(`${this.serverUrlMinasRegistroMina}/${id}`);
    return this.http.delete(`${this.serverUrlMinasRegistroMina}/${id}`);
  }

  private handleError(err: HttpErrorResponse) {
    let errorMessage = '';
    if (err.error instanceof ErrorEvent) {
      errorMessage = `An error ocurred ${err.error.message}`;
    } else {
      errorMessage = `Server returned code: ${err.status}, error message is:   ${err.message}`;
      // tslint:disable-next-line:align
    } console.log(errorMessage);
    return throwError(errorMessage);
  }
}
