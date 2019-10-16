import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse, HttpErrorResponse } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class IrsService {

  serverUrl = 'http://tumap.tapplentos.com';

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

  setInventario(data) {
    return this.http.post(`${this.serverUrl}/irs-inventarios`, data);
  }

  getServerUrl() {
    return this.serverUrl;
  }

}
