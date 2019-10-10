import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Inscripcion } from '../../models/dbo/Inscripcion';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DboService {

  API_URL = 'http://localhost:3000';

  // : Observable<Inscripcion>

  constructor(private http: HttpClient) {}

  getInscripcion(documento: string) {
    return this.http.get(`${this.API_URL}/dbo_inscripcion/${documento}`);
  }

  saveInscripcion(inscripcion: Inscripcion) {
    return this.http.post(`${this.API_URL}/dbo_inscripcion`, inscripcion);
  }

  updateInscripcion(id: string, inscripcion: Inscripcion) {
    return this.http.put(`${this.API_URL}/dbo_inscripcion/${id}`, inscripcion);
  }
}
