/*Crear base de datos*/
create database tumap;
use tumap;

/*Crear tabla usuarios */
CREATE TABLE IF NOT EXISTS usuarios (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NULL,
  `edad` INT NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `nivel_educativo` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
  /*Crear tabla registro_info */
  CREATE TABLE IF NOT EXISTS registro_info(
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_institucion` VARCHAR(45) NOT NULL,
  `ubicacion` VARCHAR(45) NOT NULL,
  `foto` TEXT NOT NULL,
  `referencias_aledanas` TEXT NOT NULL,
  `tipos_formacion` TEXT NOT NULL,
  `especificacon` TEXT NOT NULL,
  `pagina_web` VARCHAR(100) NOT NULL,
  `telefonos` VARCHAR(40) NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id`, `id_usuario`),
  CONSTRAINT `fk_registro_info_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `Educacion`.`usuarios` (`id`));
    
    /*Crear tabla registro_info */
  CREATE TABLE IF NOT EXISTS administrador(
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(70) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `celular` VARCHAR(25) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));
  
  /*Crear tabla validar_info */
  CREATE TABLE IF NOT EXISTS validar_info(
  `id` INT NOT NULL AUTO_INCREMENT,
  `validado` BOOLEAN,
  `fecha_validacion` DATE NOT NULL,
  `id_registro_info` INT NOT NULL,
  `id_administrador` INT NOT NULL,
  PRIMARY KEY (`id`, `id_registro_info`, `id_administrador`),
  CONSTRAINT `fk_validar_info_registro_info1`
    FOREIGN KEY (`id_registro_info`)
    REFERENCES `Educacion`.`registro_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_validar_info_administrador1`
    FOREIGN KEY (`id_administrador`)
    REFERENCES `Educacion`.`administrador` (`id`));
    
 /*Insert tabla usuarios */    
INSERT INTO usuarios (nombres,apellidos,edad,sexo,nivel_educativo,correo,clave)
values ('Sara','Camacho Albarracin','20','F','Tecnologo','saritacamachoa77@gmail.com','12345');

INSERT INTO usuarios (nombres,apellidos,edad,sexo,nivel_educativo,correo,clave)
values ('Fredy','Sanchez','24','M','Tecnologo','tareastrabajos@hotmail.com','78910');

/*Insert tabla registro_info */  
set @g = 'POINT(4.474022 -74.087073)';
INSERT INTO registro_info (nombre_institucion,ubicacion,foto,referencias_aledanas,tipos_formacion,especificacion,pagina_web,telefonos,id_usuario)
values ('SENA',ST_PointFromText(@g),'imagenes/sena','cerca al rio','Educación Superior','Tecnicos,Tecnologos,Especializaciones y Cursos Cortos','www.sena.com','0314451114',1);

set @e = 'POINT(4.477934 -74.104971)';
INSERT INTO registro_info (nombre_institucion,ubicacion,foto,referencias_aledanas,tipos_formacion,especificacion,pagina_web,telefonos,id_usuario)
values ('Colegio Rural El Uval',ST_PointFromText(@e),'imagenes/coelgio','cerca a la planta de tratamiento','Educación Basica','Desde transición hasta grado noveno','www.colegioeluval.com','0317614733',2);

/*Insert tabla administrador */ 
INSERT INTO administrador (nombres,apellidos,celular,usuario,clave)
values ('Pepito','Perez','3105623415','AdminUno','12345');

INSERT INTO administrador (nombres,apellidos,celular,usuario,clave)
values ('Juanita','Gomez','3105685963','AdminDos','78910');

/*Insert tabla validar_info */ 
INSERT INTO validar_info (validado,fecha_validacion,id_registro_info,id_administrador)
values (1,'2019-09-29',1,1);

INSERT INTO validar_info (validado,fecha_validacion,id_registro_info,id_administrador)
values (2,'2019-09-29',2,2);

/*Crear tabla rol*/
create table rol (id int not null primary key auto_increment , namerol varchar(20) not null );
insert into rol (namerol) values ('usuario');
insert into rol (namerol) values ('admin');

/*Crear usuarios*/
create table users (id int not null primary key auto_increment , nameuser varchar(20) not null,
password varchar(20) not null , email varchar(60) not null, id_rol int not null, foreign key (id_rol) references rol (id)
 );
insert into users (nameuser, password, email, id_rol) values ('nrodriguez', '1234', 'nrodriguez@sena.edu.co', 1);
insert into users (nameuser, password, email, id_rol) values ('nrodriguez', '1234', 'nrodriguez@sena.edu.co', 2);

/*Código que deben correr en workbeanch 8*/
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345'