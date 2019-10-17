export class Pregunta {

  public 'id_pregunta': number;
  public 'orden_pregunta': string;
  public pregunta: string;
  public 'id_imagen': number;
  public 'orden_imagen': string;
  public nombre: string;
  public ruta: string;

  constructor(idPregunta: number, 
    ordenPregunta: string, 
    pregunta: string,
    idImagen: number, 
    ordenImagen: string, 
    nombre: string, 
    ruta: string) {
      this.id_pregunta = idPregunta;
      this.orden_pregunta = ordenPregunta;
      this.pregunta = pregunta;
      this.id_imagen = idImagen;
      this.orden_pregunta = ordenPregunta;
      this.orden_imagen = ordenImagen;
      this.nombre =  nombre;
      this.ruta = ruta;
  }
}
