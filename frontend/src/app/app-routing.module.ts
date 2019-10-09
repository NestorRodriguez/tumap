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
  { path: 'ubicacion', loadChildren: './dbo/ubicacion/ubicacion.module#UbicacionPageModule' },
  { path: 'inscripcion', loadChildren: './dbo/inscripcion/inscripcion.module#InscripcionPageModule' },
  { path: 'formulario', loadChildren: './dbo/formulario/formulario.module#FormularioPageModule' },
  { path: 'exportar', loadChildren: './dbo/exportar/exportar.module#ExportarPageModule' },
  { path: 'formulariosuelos', loadChildren: './usosuelos/formulario/formulario.module#FormularioPageModule' },
  { path: 'categorias', loadChildren: './jyd-categorias/jyd-categorias.module#JydCategoriasPageModule' },
  { path: 'senalizacion', loadChildren: './senalizacion/senalizacion.module#SenalizacionPageModule' },
<<<<<<< HEAD
  { path: 'mobiliario', loadChildren: './mobiliario/mobiliario.module#MobiliarioPageModule' },  { path: 'minasestadoactual', loadChildren: './minas/minasestadoactual/minasestadoactual.module#MinasestadoactualPageModule' },









=======
  { path: 'mobiliario', loadChildren: './mobiliario/mobiliario.module#MobiliarioPageModule' },
  { path: 'usosueloshome', loadChildren: './usosuelos/usosueloshome/usosueloshome.module#UsosueloshomePageModule' },
  { path: 'categorias', loadChildren: './jyd-categorias/jyd-categorias.module#JydCategoriasPageModule' },
  { path: 'senalizacion', loadChildren: './senalizacion/senalizacion.module#SenalizacionPageModule' },
  { path: 'mobiliario', loadChildren: './mobiliario/mobiliario.module#MobiliarioPageModule' },
  { path: 'inventario-redes-secas/inicio', loadChildren: './irs/inicio/inicio.module#InicioPageModule' },
  { path: 'inventario-postes', loadChildren: './irs/inventario-postes/inventario-postes.module#InventarioPostesPageModule' },
  { path: 'inventario-otros', loadChildren: './irs/inventario-otros/inventario-otros.module#InventarioOtrosPageModule' },  { path: 'homeeducation', loadChildren: './Education/homeeducation/homeeducation.module#HomeeducationPageModule' },



>>>>>>> origin
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}

