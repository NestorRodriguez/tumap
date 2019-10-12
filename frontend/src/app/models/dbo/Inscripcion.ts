// dbo desarrollo de las interfases
// /////////////////////////////////
export interface Inscripcion {
  id?: number;
  documento: number;
  nombre: string;
  lat?: string;
  lng?: string;
  direccion?: string;
  departamento?: string;
  municipio?: string;
  usuario?: string;
  fecha: Date;
  isUpdate: boolean;
}
