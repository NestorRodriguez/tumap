import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'login',
    pathMatch: 'full'
  },
  {
    path: 'home',
    loadChildren: () => import('./home/home.module').then(m => m.HomePageModule)
  },
  {
    path: 'list',
    loadChildren: () => import('./list/list.module').then(m => m.ListPageModule)
  },
  {
    path: 'register',
    loadChildren: () => import('./Education/register/register.module').then(m => m.RegisterPageModule)
  },
  { path: 'login', loadChildren: './login/login.module#LoginPageModule' },
  { path: 'inscripcion/:id', loadChildren: './dbo/inscripcion/inscripcion.module#InscripcionPageModule' },
  { path: 'formulario/:id', loadChildren: './dbo/formulario/formulario.module#FormularioPageModule' },
  { path: 'exportar', loadChildren: './dbo/exportar/exportar.module#ExportarPageModule' },
  { path: 'formulariosuelos', loadChildren: './usosuelos/formulario/formulario.module#FormularioPageModule' },
  { path: 'usosueloshome', loadChildren: './usosuelos/usosueloshome/usosueloshome.module#UsosueloshomePageModule' },
  { path: 'irs-inicio', loadChildren: './irs/inicio/inicio.module#InicioPageModule' },
  { path: 'irs-inventario-postes/:tipo', loadChildren: './irs/inventario-postes/inventario-postes.module#InventarioPostesPageModule' },
  { path: 'homeeducation', loadChildren: './Education/homeeducation/homeeducation.module#HomeeducationPageModule' },
  { path: 'minasestadoactual', loadChildren: './minas/minasestadoactual/minasestadoactual.module#MinasestadoactualPageModule' },
  // tslint:disable-next-line:max-line-length
  { path: 'minasestadoactual-details/:idcodigo', loadChildren: './minas/minasestadoactual-details/minasestadoactual-details.module#MinasestadoactualDetailsPageModule' },
  { path: 'senalizacion', loadChildren: './vistasjyd/senalizacion/senalizacion.module#SenalizacionPageModule' },
  { path: 'categorias', loadChildren: './vistasjyd/categorias/categorias.module#CategoriasPageModule' },
  // { path: 'mapa-item', loadChildren: './vistasjyd/mapa/mapa.module#MapaPageModule' },
  { path: 'registroitem/:id/:categoria', loadChildren: './vistasjyd/registro/registro.module#RegistroPageModule' },
  { path: 'mobiliario', loadChildren: './vistasjyd/mobiliario/mobiliario.module#MobiliarioPageModule' },
  { path: 'instruccion', loadChildren: './usosuelos/instruccion/instruccion.module#InstruccionPageModule' },
  { path: 'homeadminedu', loadChildren: './Education/homeadminedu/homeadminedu.module#HomeadmineduPageModule' },
  { path: 'cambiarclave', loadChildren: './Education/cambiarclave/cambiarclave.module#CambiarclavePageModule' },
  { path: 'usoynivel', loadChildren: './usoynivel/usoynivel.module#UsoynivelPageModule' },
  { path: 'minatipomaterial', loadChildren: './minas/minatipomaterial/minatipomaterial.module#MinatipomaterialPageModule' },
  { path: 'minatipomaterialdetails/:id', loadChildren: './minas/minatipomaterialdetails/minatipomaterialdetails.module#MinatipomaterialdetailsPageModule' },
  { path: 'minasistemaexplotacion', loadChildren: './minas/minasistemaexplotacion/minasistemaexplotacion.module#MinasistemaexplotacionPageModule' },
  { path: 'minasistemaexplotacion-details/:id', loadChildren: './minas/minasistemaexplotacion-details/minasistemaexplotacion-details.module#MinasistemaexplotacionDetailsPageModule' },
  { path: 'minaregistro/:lat/:lng', loadChildren: './minas/minaregistro/minaregistro.module#MinaregistroPageModule' },
  { path: 'minarmapa', loadChildren: './minas/minarmapa/minarmapa.module#MinarmapaPageModule' },
  { path: 'predial', loadChildren: './ibpredial/predial/predial.module#PredialPageModule' },
  { path: 'usoynivel', loadChildren: './usoynivel/usoynivel.module#UsoynivelPageModule' },
  { path: 'resumen', loadChildren: './vistasjyd/resumen/resumen.module#ResumenPageModule' },
  { path: 'infohabitantes', loadChildren: './Education/infohabitantes/infohabitantes.module#InfohabitantesPageModule' },
  { path: 'registroinfo', loadChildren: './Education/registroinfo/registroinfo.module#RegistroinfoPageModule' },
  { path: 'verinfoinstitucion', loadChildren: './Education/verinfoinstitucion/verinfoinstitucion.module#VerinfoinstitucionPageModule' },
  { path: 'mapadmin', loadChildren: './Education/mapadmin/mapadmin.module#MapadminPageModule' },
  { path: 'centrosformacion', loadChildren: './Education/centrosformacion/centrosformacion.module#CentrosformacionPageModule' },
  { path: 'mapa', loadChildren: './minas/mapa/mapa.module#MapaPageModule' },
  { path: 'colinda', loadChildren: './ibpredial/colinda/colinda.module#ColindaPageModule' },
  { path: 'comercioformal', loadChildren: './socioeconomico/comercioformal/comercioformal.module#ComercioformalPageModule' },
  { path: 'comercioinformal', loadChildren: './socioeconomico/comercioinformal/comercioinformal.module#ComercioinformalPageModule' },
  { path: 'encuestasocial', loadChildren: './socioeconomico/encuestasocial/encuestasocial.module#EncuestasocialPageModule' },
  { path: 'tipocomercio', loadChildren: './socioeconomico/tipocomercio/tipocomercio.module#TipocomercioPageModule' },
  { path: 'options', loadChildren: './hidroetno/options/options.module#OptionsPageModule' },
  { path: 'hidrica', loadChildren: './hidroetno/hidrica/hidrica.module#HidricaPageModule' },
  { path: 'etnobotanica', loadChildren: './hidroetno/etnobotanica/etnobotanica.module#EtnobotanicaPageModule' },
  { path: 'hogaropt', loadChildren: './hidroetno/hogaropt/hogaropt.module#HogaroptPageModule' },
  { path: 'sincobopt', loadChildren: './hidroetno/sincobopt/sincobopt.module#SincoboptPageModule' },
  { path: 'exterioropt', loadChildren: './hidroetno/exterioropt/exterioropt.module#ExterioroptPageModule' },
  { path: 'ibpredial-inicio', loadChildren: './ibpredial/inicio/inicio.module#InicioPageModule' },
  { path: 'ibpredial-inicio/:id', loadChildren: './ibpredial/inicio/inicio.module#InicioPageModule' },
  { path: 'predial', loadChildren: './ibpredial/predial/predial.module#PredialPageModule' },
  { path: 'colinda', loadChildren: './ibpredial/colinda/colinda.module#ColindaPageModule' },
  { path: 'estrato', loadChildren: './ibpredial/estrato/estrato.module#EstratoPageModule' },
  { path: 'nivel', loadChildren: './ibpredial/nivel/nivel.module#NivelPageModule' },
  { path: 'matricula', loadChildren: './ibpredial/matricula/matricula.module#MatriculaPageModule' },
  { path: 'respuestas', loadChildren: './dbo/respuestas/respuestas.module#RespuestasPageModule' },
  { path: 'mapavias', loadChildren: './vistasjf/mapavias/mapavias.module#MapaviasPageModule' },
  { path: 'slides', loadChildren: './vistasjf/slides/slides.module#SlidesPageModule' },
  { path: 'resumenjf', loadChildren: './vistasjf/resumen/resumen.module#ResumenPageModule' },
<<<<<<< HEAD
  { path: 'cv-salud', loadChildren: './cv-salud/cv-salud.module#CvSaludPageModule' },
  { path: 'tab1', loadChildren: './cv-salud/tab1/tab1.module#Tab1PageModule' },
  { path: 'tab2', loadChildren: './cv-salud/tab2/tab2.module#Tab2PageModule' },
  { path: 'tab3', loadChildren: './cv-salud/tab3/tab3.module#Tab3PageModule' },
  { path: 'tab4', loadChildren: './cv-salud/tab4/tab4.module#Tab4PageModule' },
  { path: 'tab5', loadChildren: './cv-salud/tab5/tab5.module#Tab5PageModule' },
  { path: 'tab6', loadChildren: './cv-salud/tab6/tab6.module#Tab6PageModule' },
  { path: 'class', loadChildren: './class/marcador#MarcadorModule' },





=======
>>>>>>> fed30c3129f82ec2a42b3a3a041d3a51a176ef02
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})

export class AppRoutingModule { }