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

  /*{ path: 'register', loadChildren: './Education/register/register.module#RegisterPageModule' }*/

  { path: 'login', loadChildren: './login/login.module#LoginPageModule' },
  { path: 'ubicacion/:id', loadChildren: './dbo/ubicacion/ubicacion.module#UbicacionPageModule' },
  { path: 'inscripcion/:id', loadChildren: './dbo/inscripcion/inscripcion.module#InscripcionPageModule' },
  { path: 'formulario/:id', loadChildren: './dbo/formulario/formulario.module#FormularioPageModule' },
  { path: 'exportar', loadChildren: './dbo/exportar/exportar.module#ExportarPageModule' },
  { path: 'formulariosuelos', loadChildren: './usosuelos/formulario/formulario.module#FormularioPageModule' },
  { path: 'usosueloshome', loadChildren: './usosuelos/usosueloshome/usosueloshome.module#UsosueloshomePageModule' },
  { path: 'irs-inicio', loadChildren: './irs/inicio/inicio.module#InicioPageModule' },
  { path: 'irs-inventario-postes/:tipo', loadChildren: './irs/inventario-postes/inventario-postes.module#InventarioPostesPageModule' },
  { path: 'homeeducation', loadChildren: './Education/homeeducation/homeeducation.module#HomeeducationPageModule' },
  { path: 'minasestadoactual', loadChildren: './minas/minasestadoactual/minasestadoactual.module#MinasestadoactualPageModule' },
  { path: 'senalizacion', loadChildren: './vistasjyd/senalizacion/senalizacion.module#SenalizacionPageModule' },
  { path: 'categorias', loadChildren: './vistasjyd/categorias/categorias.module#CategoriasPageModule' },
  { path: 'mapa-item', loadChildren: './vistasjyd/mapa/mapa.module#MapaPageModule' },
  { path: 'registro-item', loadChildren: './vistasjyd/registro/registro.module#RegistroPageModule' },
  { path: 'mobiliario', loadChildren: './vistasjyd/mobiliario/mobiliario.module#MobiliarioPageModule' },
  { path: 'instruccion', loadChildren: './usosuelos/instruccion/instruccion.module#InstruccionPageModule' },
  { path: 'homeadminedu', loadChildren: './Education/homeadminedu/homeadminedu.module#HomeadmineduPageModule' },
  { path: 'cambiarclave', loadChildren: './Education/cambiarclave/cambiarclave.module#CambiarclavePageModule' },
  //{ path: 'senalizacion', loadChildren: './senalizacion/senalizacion.module#SenalizacionPageModule' },
  //{ path: 'mobiliario', loadChildren: './mobiliario/mobiliario.module#MobiliarioPageModule' },
  //{ path: 'senalizacion', loadChildren: './senalizacion/senalizacion.module#SenalizacionPageModule' },
  //{ path: 'mobiliario', loadChildren: './mobiliario/mobiliario.module#MobiliarioPageModule' },
  { path: 'predial', loadChildren: './predial/predial.module#PredialPageModule' },
  { path: 'usoynivel', loadChildren: './usoynivel/usoynivel.module#UsoynivelPageModule' },



];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}

