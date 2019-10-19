import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { tap, catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class HidroServicesService {

  urlUsers = 'http://localhost:3000/Users/';
  urlCoverages = 'http://localhost:3000/coverages/';
  urlWithout_coverage = 'http://localhost:3000/without_coverage/';
  urlGrown = 'http://localhost:3000/grown/';
  urlConnections = 'http://localhost:3000/connections/';
  urlEthnobotany = 'http://localhost:3000/ethnobotany/';

  constructor(public http: HttpClient) { }

  getUser(): Observable<any[]> {
    return this.http.get<any[]>(this.urlUsers).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
    );
  }

  // Coverturas
  getCoverturas(): Observable<any[]> {
    return this.http.get<any[]>(this.urlCoverages).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
    );
  }

  setCoverturas(data: any) {
    return this.http.post(this.urlCoverages, data);
  }

  getCoverturasI(id: string) {
    return this.http.get(`${this.urlCoverages}/${id}`);
  }

  putCoverturas(data: any) {
    console.log(data);
    return this.http.put(this.urlCoverages, data);
  }

  deleteCoverturas(id: string) {
    console.log(`${this.urlCoverages}/${id}`);
    return this.http.delete(`${this.urlCoverages}/${id}`);
  }

  // Sin Covertura

  getSinCovertura(): Observable<any[]> {
    return this.http.get<any[]>(this.urlWithout_coverage).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
    );
  }

  setSinCovertura(data: any) {
    return this.http.post(this.urlWithout_coverage, data);
  }

  getSinCoverturaI(id: string) {
    return this.http.get(`${this.urlWithout_coverage}/${id}`);
  }

  putSinCovertura(data: any) {
    console.log(data);
    return this.http.put(this.urlWithout_coverage, data);
  }

  deleteSinCovertura(id: string) {
    console.log(`${this.urlWithout_coverage}/${id}`);
    return this.http.delete(`${this.urlWithout_coverage}/${id}`);
  }


  // Crecidas

  getCrecidas(): Observable<any[]> {
    return this.http.get<any[]>(this.urlGrown).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
    );
  }

  setCrecidas(data: any) {
    return this.http.post(this.urlGrown, data);
  }

  getCrecidasI(id: string) {
    return this.http.get(`${this.urlGrown}/${id}`);
  }

  putCrecidas(data: any) {
    console.log(data);
    return this.http.put(this.urlGrown, data);
  }

  deleteCrecidas(id: string) {
    console.log(`${this.urlGrown}/${id}`);
    return this.http.delete(`${this.urlGrown}/${id}`);
  }

  // Conexiones

  getConexiones(): Observable<any[]> {
    return this.http.get<any[]>(this.urlConnections).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
    );
  }

  setConexiones(data: any) {
    return this.http.post(this.urlConnections, data);
  }

  getConexionesI(id: string) {
    return this.http.get(`${this.urlConnections}/${id}`);
  }

  putConexiones(data: any) {
    console.log(data);
    return this.http.put(this.urlConnections, data);
  }

  deleteConexiones(id: string) {
    console.log(`${this.urlConnections}/${id}`);
    return this.http.delete(`${this.urlConnections}/${id}`);
  }

  // Etnobotanica

  getEtnobotanica(): Observable<any[]> {
    return this.http.get<any[]>(this.urlEthnobotany).pipe(
      tap(data => console.log(JSON.stringify(data))),
      catchError(this.handleError)
    );
  }

  setEtnobotanica(data: any) {
    return this.http.post(this.urlEthnobotany, data);
  }

  getEtnobotanicaI(id: string) {
    return this.http.get(`${this.urlEthnobotany}/${id}`);
  }

  putEtnobotanica(data: any) {
    console.log(data);
    return this.http.put(this.urlEthnobotany, data);
  }

  deleteEtnobotanica(id: string) {
    console.log(`${this.urlEthnobotany}/${id}`);
    return this.http.delete(`${this.urlEthnobotany}/${id}`);
  }

  private handleError(err: HttpErrorResponse) {
    let errorMessage = '';
    if (err.error instanceof ErrorEvent) {
      errorMessage = `An error ocurred: ${err.error.message}`;
    } else {
      errorMessage = `Server returned code: ${err.status}, error message is: ${err.message}`;
    }
    console.error(errorMessage);
    return throwError(errorMessage);
  }

}
