import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'home',
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
  { path: 'ubicacion', loadChildren: './dbo/ubicacion/ubicacion.module#UbicacionPageModule' },
  { path: 'inscripcion', loadChildren: './dbo/inscripcion/inscripcion.module#InscripcionPageModule' },
  { path: 'formulario', loadChildren: './dbo/formulario/formulario.module#FormularioPageModule' },
  { path: 'exportar', loadChildren: './dbo/exportar/exportar.module#ExportarPageModule' },
  { path: 'formulariosuelos', loadChildren: './usosuelos/formulario/formulario.module#FormularioPageModule' },
  { path: 'usosueloshome', loadChildren: './usosuelos/usosueloshome/usosueloshome.module#UsosueloshomePageModule' },
  { path: 'irs-inicio', loadChildren: './irs/inicio/inicio.module#InicioPageModule' },
  { path: 'irs-inventario-postes/:tipo', loadChildren: './irs/inventario-postes/inventario-postes.module#InventarioPostesPageModule' },
  { path: 'homeeducation', loadChildren: './Education/homeeducation/homeeducation.module#HomeeducationPageModule' },
  { path: 'minasestadoactual', loadChildren: './minas/minasestadoactual/minasestadoactual.module#MinasestadoactualPageModule' },
  { path: 'minasestadoactual-details/:idcodigo', loadChildren: './minas/minasestadoactual-details/minasestadoactual-details.module#MinasestadoactualDetailsPageModule' },
  { path: 'senalizacion', loadChildren: './vistasjyd/senalizacion/senalizacion.module#SenalizacionPageModule' },
  { path: 'categorias', loadChildren: './vistasjyd/categorias/categorias.module#CategoriasPageModule' },
  { path: 'mapa-item', loadChildren: './vistasjyd/mapa/mapa.module#MapaPageModule' },
  { path: 'registroitem/:id/:categoria', loadChildren: './vistasjyd/registro/registro.module#RegistroPageModule' },
  { path: 'mobiliario', loadChildren: './vistasjyd/mobiliario/mobiliario.module#MobiliarioPageModule' },
  { path: 'instruccion', loadChildren: './usosuelos/instruccion/instruccion.module#InstruccionPageModule' },
  { path: 'homeadminedu', loadChildren: './Education/homeadminedu/homeadminedu.module#HomeadmineduPageModule' },
  { path: 'cambiarclave', loadChildren: './Education/cambiarclave/cambiarclave.module#CambiarclavePageModule' },
  { path: 'predial', loadChildren: './predial/predial.module#PredialPageModule' },
  { path: 'usoynivel', loadChildren: './usoynivel/usoynivel.module#UsoynivelPageModule' },
  { path: 'colinda', loadChildren: './colinda/colinda.module#ColindaPageModule' },
  { path: 'minatipomaterial', loadChildren: './minas/minatipomaterial/minatipomaterial.module#MinatipomaterialPageModule' },
  { path: 'minatipomaterialdetails/:id', loadChildren: './minas/minatipomaterialdetails/minatipomaterialdetails.module#MinatipomaterialdetailsPageModule' },
  { path: 'minasistemaexplotacion', loadChildren: './minas/minasistemaexplotacion/minasistemaexplotacion.module#MinasistemaexplotacionPageModule' },
  { path: 'minasistemaexplotacion-details/:id', loadChildren: './minas/minasistemaexplotacion-details/minasistemaexplotacion-details.module#MinasistemaexplotacionDetailsPageModule' },
  { path: 'minaregistro', loadChildren: './minas/minaregistro/minaregistro.module#MinaregistroPageModule' },
  { path: 'minarmapa', loadChildren: './minas/minarmapa/minarmapa.module#MinarmapaPageModule' },
  { path: 'predial', loadChildren: './predial/predial.module#PredialPageModule' },
  { path: 'usoynivel', loadChildren: './usoynivel/usoynivel.module#UsoynivelPageModule' },
  { path: 'resumen', loadChildren: './vistasjyd/resumen/resumen.module#ResumenPageModule' },
  { path: 'registroinfo', loadChildren: './Education/registroinfo/registroinfo.module#RegistroinfoPageModule' },
  { path: 'verinfoinstitucion', loadChildren: './Education/verinfoinstitucion/verinfoinstitucion.module#VerinfoinstitucionPageModule' },
  { path: 'mapadmin', loadChildren: './Education/mapadmin/mapadmin.module#MapadminPageModule' },
  { path: 'centrosformacion', loadChildren: './Education/centrosformacion/centrosformacion.module#CentrosformacionPageModule' },
  { path: 'comercioformal', loadChildren: './socioeconomico/comercioformal/comercioformal.module#ComercioformalPageModule' },
  { path: 'comercioinformal', loadChildren: './socioeconomico/comercioinformal/comercioinformal.module#ComercioinformalPageModule' },
  { path: 'encuestasocial', loadChildren: './socioeconomico/encuestasocial/encuestasocial.module#EncuestasocialPageModule' },
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}




];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}

