// dbo desarrollo de las interfases
// /////////////////////////////////
export interface Inscripcion {
  id?: number;
  documento: number;
  nombre: string;
  posicionamiento?: string;
  direccion?: string;
  departamento?: string;
  munipio?: string;
  usuario?: string;
  fecha?: Date;
}
