import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse, HttpErrorResponse } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class InventarioRedesSecasService {

  serverUrl = 'http://localhost:3000';

  constructor( private http: HttpClient) { }

  getTiposRedes() {
    return this.http.get(`${this.serverUrl}/irs-tipos-redes`);
  }

  getEstadosRedes() {
    return this.http.get(`${this.serverUrl}/irs-estados-redes`);
  }

  getTiposMateriales() {
    return this.http.get(`${this.serverUrl}/irs-tipos-materiales`);
  }

  getOperadoresCelulares() {
    return this.http.get(`${this.serverUrl}/irs-operadores-celulares`);
  }

  setInventarioPostes(data) {
    return this.http.post(`${this.serverUrl}/irs-inventario-postes`, data);
  }

  setOtrosInventarios(data) {
    return this.http.post(`${this.serverUrl}/irs-inventario-otros`, data);
  }

}
