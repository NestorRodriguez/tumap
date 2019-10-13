import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ObtenerdataService {
  data: any;
  constructor() { }

  public obtenerData(formulario: any) {
    this.data = formulario;
    console.log(this.data);
  }

  public enviarData() {
  return this.data;
  }
}
