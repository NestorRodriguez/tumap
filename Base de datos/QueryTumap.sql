/*Crear base de datos*/
create database tumap;
use tumap;

/*Crear tabla rol*/
create table rol (id int not null primary key auto_increment , namerol varchar(20) not null );
insert into rol (namerol) values ('usuario');
insert into rol (namerol) values ('admin');

/*Crear usuarios*/
create table users (id int not null primary key auto_increment , nameuser varchar(20) not null,
password varchar(20) not null , email varchar(60) not null, id_rol int not null, foreign key (id_rol) references rol (id)
 );
insert into users (nameuser, password, email, id_rol) values ('nrodriguez', '1234', 'nrodriguez@sena.edu.co', 2);
insert into users (nameuser, password, email, id_rol) values ('nrodriguez', '1234', 'nrodriguez@sena.edu.co', 1);
insert into users (nameuser, password, email, id_rol) values ('juanherrera', '1234', 'jcherreraa@sena.edu.co', 1);
insert into users (nameuser, password, email, id_rol) values ('davidr', '1234', 'davidreyes@sena.edu.co', 1);
insert into users (nameuser, password, email, id_rol) values ('scamacho', '1234', 'secamacho5@misena.edu.co', 1);
insert into users (nameuser, password, email, id_rol) values ('fsanchez', '1234', 'fsanchez@misena.edu.co', 1);

/*Código que deben correr en workbeanch 8*/
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345';

-- -----------------------------------------------------
-- Table `tumap`.`fys_datos_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tumap`.`fys_datos_usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(100) NOT NULL,
  `apellidos` VARCHAR(100) NOT NULL,
  `edad` INT NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  `nivel_educativo` VARCHAR(100) NOT NULL,
  `id_user` INT NOT NULL,
  PRIMARY KEY (`id`, `id_user`),
  CONSTRAINT `fk_users1`
    FOREIGN KEY (`id_user`)
    REFERENCES `tumap`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
  
-- -----------------------------------------------------
-- Table `tumap`.`registro_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tumap`.`fys_registro_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_institucion` VARCHAR(45) NOT NULL,
  `ubicacion` POINT NOT NULL,
  `foto` TEXT NOT NULL,
  `referencias_aledanas` TEXT NOT NULL,
  `tipos_formacion` TEXT NOT NULL,
  `especificacion` VARCHAR(100) NOT NULL,
  `pagina_web` VARCHAR(100) NOT NULL,
  `telefonos` VARCHAR(40) NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id`, `id_usuario`),
  CONSTRAINT `fk_registro_info_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `tumap`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `tumap`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tumap`.`fys_administrador` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(70) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `celular` VARCHAR(25) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `tumap`.`validar_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tumap`.`fys_validar_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `validado` BOOLEAN,
  `fecha_validacion` DATE NOT NULL,
  `id_registro_info` INT NOT NULL,
  `id_administrador` INT NOT NULL,
  PRIMARY KEY (`id`, `id_registro_info`, `id_administrador`),
  CONSTRAINT `fk_validar_info_registro_info1`
    FOREIGN KEY (`id_registro_info`)
    REFERENCES `tumap`.`fys_registro_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_validar_info_administrador1`
    FOREIGN KEY (`id_administrador`)
    REFERENCES `tumap`.`fys_administrador` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

select * from fys_validar_info;

set @g = 'POINT(4.474022 -74.087073)';
INSERT INTO fys_registro_info (nombre_institucion,ubicacion,foto,referencias_aledanas,tipos_formacion,especificacion,pagina_web,telefonos,id_usuario)
values ('SENA',ST_PointFromText(@g),'imagenes/sena','cerca al rio','Educación Superior','Tecnicos,Tecnologos,Especializaciones y Cursos Cortos','www.sena.com','0314451114',1);

set @e = 'POINT(4.477934 -74.104971)';
INSERT INTO fys_registro_info (nombre_institucion,ubicacion,foto,referencias_aledanas,tipos_formacion,especificacion,pagina_web,telefonos,id_usuario)
values ('Colegio Rural El Uval',ST_PointFromText(@e),'imagenes/coelgio','cerca a la planta de tratamiento','Educación Basica','Desde transición hasta grado noveno','www.colegioeluval.com','0317614733',2);

INSERT INTO fys_administrador (nombres,apellidos,celular,usuario,clave)
values ('Pepito','Perez','3105623415','AdminUno','12345');

INSERT INTO fys_administrador (nombres,apellidos,celular,usuario,clave)
values ('Juanita','Gomez','3105685963','AdminDos','78910');

INSERT INTO fys_validar_info (validado,fecha_validacion,id_registro_info,id_administrador)
values (1,'2019-09-29',1,1);

INSERT INTO fys_validar_info (validado,fecha_validacion,id_registro_info,id_administrador)
values (2,'2019-09-29',2,2);

INSERT INTO fys_datos_usuarios (nombres,apellidos,edad,sexo,nivel_educativo,id_user)
values ('Sara','Camacho Albarracin',20,'F','Tecnologo',3);

INSERT INTO fys_datos_usuarios (nombres,apellidos,edad,sexo,nivel_educativo,id_user)
values ('Fredy','Sanchez',24,'M','Tecnologo',4);

INSERT INTO rol (namerol)
values ('Administrador');

INSERT INTO rol (namerol)
values ('Habitante');

select * from users;

select * from rol;

select * from fys_registro_info;

/* Creamos tabla Predial (Residencial - Rural - Comercial) */
CREATE TABLE uso_Predio (
  id_predio INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  descripcion VARCHAR(55) NOT NULL
);

/* Creamos tabla Servicios (Agua - Luz - Teléono - Gas Natural
Gas propano - Alcantarillado) */
CREATE TABLE servicios_Publicos (
    id_servpub INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(55) NOT NULL    
);

/* Creamos tabla nivel de vivienda */
CREATE TABLE nivel_Vivienda (
    id_nivel INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(55) NOT NULL    
);

/* Creamos tabla Estratos */
CREATE TABLE estrato (
    id_estrato INT NOT NULL PRIMARY KEY  AUTO_INCREMENT,
    descripcion VARCHAR(55) NOT NULL    
);

/* Creamos tabla predios */
CREATE TABLE predios (
    id_predio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    matricula varchar(55) NOT NULL,	
    direccion varchar(55) NOT NULL,
    ide_estrato INT NOT NULL,
    id_usosuelo INT NOT NULL,
    ide_nivel INT NOT NULL,
    estado_Vivienda char not null, 
	servicio_agua boolean NOT NULL,
    servicio_energia boolean NOT NULL,
    servicio_internet boolean NOT NULL,
    servicio_telefoniaFija boolean NOT NULL,
    servicio_telefoniaMovil boolean NOT NULL,
    servicio_gasNatural boolean NOT NULL,
    servicio_gasPropano boolean NOT NULL,
    punto_locaclizacion point,    
    foreign key (ide_estrato) references estrato (id_estrato),
    foreign key (ide_nivel) references nivel_Vivienda (id_nivel),
    foreign key (id_usosuelo) references uso_Predio (id_predio)
);

insert into uso_predio (descripcion)
values ('Comercial');

insert into uso_predio (descripcion)
values ('Residencial');

insert into uso_predio (descripcion)
values ('Rural');

insert into servicios_Publicos (descripcion)
values ('Agua');

insert into servicios_Publicos (descripcion)
values ('Luz');

insert into servicios_Publicos (descripcion)
values ('Telefono');

insert into servicios_Publicos (descripcion)
values ('Alcantarillado');

insert into servicios_Publicos (descripcion)
values ('Gas natural');

insert into servicios_Publicos (descripcion)
values ('Gas Propano');

insert into nivel_Vivienda (descripcion)
values ('Un Piso');

insert into nivel_Vivienda (descripcion)
values ('Dos Pisos');

insert into nivel_Vivienda (descripcion)
values ('Tres Pisos');

insert into nivel_Vivienda (descripcion)
values ('Mayor a tres pisos');

insert into estrato (descripcion)
values ('Estrato 1');

insert into estrato (descripcion)
values ('Estrato 2');

insert into estrato (descripcion)
values ('Estrato 3');

insert into estrato (descripcion)
values ('Estrato 4');

SET @g = 'polygon((-74.08434887571491 4.611668551399252, -74.08434887571492 4.711668551399262, -74.08434887571491 4.711668551399268,-74.08434887571491 4.611668551399252))';
insert into predios (matricula,direccion,ide_estrato,id_usosuelo,ide_nivel,estado_Vivienda,servicio_agua,servicio_energia,servicio_internet,servicio_telefoniaFija,servicio_telefoniaMovil,servicio_gasNatural,servicio_gasPropano,punto_localizacion) 
values (14578235,'calle 24 # 34-35 sur',1,2,3,0,true,true,true,true,true,true,true,ST_PolygonFromText(@g));

/* Creamos tabla Predial (Residencial - Rural - Comercial) */
CREATE TABLE uso_Predio (
    id_predio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(55) NOT NULL    
);


/* Creamos tabla Servicios (Agua - Luz - Teléono - Gas Natural
Gas propano - Alcantarillado) */
CREATE TABLE servicios_Publicos (
    id_servpub INT NOT NULL  PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(55) NOT NULL    
);

/* Creamos tabla nivel de vivienda */
CREATE TABLE nivel_Vivienda (
    id_nivel INT NOT NULL  PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(55) NOT NULL    
);

/* Creamos tabla Estratos */
CREATE TABLE estrato (
    id_estrato INT NOT NULL  PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(55) NOT NULL    
);

/* Creamos tabla predios */
CREATE TABLE predios (
    id_predio INT NOT NULL  PRIMARY KEY AUTO_INCREMENT,
    matricula varchar(55) NOT NULL,	
    direccion varchar(55) NOT NULL,
    ide_estrato INT NOT NULL,
    id_usosuelo INT NOT NULL,
    ide_nivel INT NOT NULL,
    estado_Vivienda char not null, 
	servicio_agua boolean NOT NULL,
    servicio_energia boolean NOT NULL,
    servicio_internet boolean NOT NULL,
    servicio_telefoniaFija boolean NOT NULL,
    servicio_telefoniaMovil boolean NOT NULL,
    servicio_gasNatural boolean NOT NULL,
    servicio_gasPropano boolean NOT NULL,
    punto_locaclizacion point,    
    foreign key (ide_estrato) references estrato (id_estrato),
    foreign key (ide_nivel) references nivel_Vivienda (id_nivel),
    foreign key (id_usosuelo) references uso_Predio (id_predio)
);

insert into servicios_Publicos (descripcion)
values ('Agua');

insert into servicios_Publicos (descripcion)
values ('Luz');

insert into servicios_Publicos (descripcion)
values ('Telefono');

insert into servicios_Publicos (descripcion)
values ('Alcantarillado');

insert into servicios_Publicos (descripcion)
values ('Gas natural');

insert into servicios_Publicos (descripcion)
values ('Gas Propano');



insert into nivel_Vivienda (descripcion)
values ('Un Piso');

insert into nivel_Vivienda (descripcion)
values ('Dos Pisos');

insert into nivel_Vivienda (descripcion)
values ('Tres Pisos');

insert into nivel_Vivienda (descripcion)
values ('Mayor a tres pisos');
 


insert into estrato (descripcion)
values ('Estrato 1');

insert into estrato (descripcion)
values ('Estrato 2');

insert into estrato (descripcion)
values ('Estrato 3');

insert into estrato (descripcion)
values ('Estrato 4');



SET @g = 'polygon((-74.08434887571491 4.611668551399252, -74.08434887571492 4.711668551399262, -74.08434887571491 4.711668551399268,-74.08434887571491 4.611668551399252))';
insert into predios (matricula,direccion,ide_estrato,id_usosuelo,ide_nivel,estado_Vivienda,servicio_agua,servicio_energia,servicio_internet,servicio_telefoniaFija,servicio_telefoniaMovil,servicio_gasNatural,servicio_gasPropano,punto_localizacion) 
values (14578235,'calle 24 # 34-35 sur',1,2,3,0,true,true,true,true,true,true,true,ST_PolygonFromText(@g));


/*Código que deben correr en workbeanch 8*/
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345'
select * from fys_administrador;

select * from fys_validar_info;

--***********************************************************************
-- inicio DBO 
-- Generated: 2019-09-29 10:59
-- Project: suelos
-- Author: Divier Castaneda -- Diego Duarte
--***********************************************************************
-- **********Se puede copiar completa y ejecutar en sql*******************
--************************************************************************
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `tumap` DEFAULT CHARACTER SET utf8 ;
use tumap;
/******/
DROP TABLE IF EXISTS `tumap`.`dbo_incripcionPregunta`;
DROP TABLE IF EXISTS `tumap`.`dbo_respuesta`;
DROP TABLE IF EXISTS `tumap`.`dbo_pregunta` ;
DROP TABLE IF EXISTS `tumap`.`dbo_inscripcion`; 
DROP TABLE IF EXISTS `tumap`.`dbo_imagen`;

--****** dbo Creacion de las tablas
CREATE TABLE IF NOT EXISTS `tumap`.`dbo_pregunta` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `orden` TINYINT(2) NOT NULL,
  `pregunta` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `orden_UNIQUE` (`orden` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `tumap`.`dbo_imagen` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
    `id_pregunta` INT(11) NOT NULL,
	`orden` TINYINT(2) NOT NULL,  
	`nombre` VARCHAR(45) NULL DEFAULT NULL,    
	`ruta` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `orden_UNIQUE` (`id_pregunta`,`orden` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `tumap`.`dbo_inscripcion` (
  `id` INT(11) AUTO_INCREMENT,
  `documento` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `posicionamiento` VARCHAR(45) NULL DEFAULT NULL,
  `departamento` VARCHAR(45) NULL DEFAULT NULL,
  `munipio` VARCHAR(45) NULL DEFAULT NULL,
  `usuario` VARCHAR(45) NULL DEFAULT NULL,
  `fecha` timestamp default current_timestamp,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `tumap`.`dbo_respuesta` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_inscripcion` INT(11) NOT NULL,
  `id_pregunta` INT(11) NOT NULL,
  `id_imagen` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  
  CONSTRAINT `fk_respuesta_inscripcion1`
    FOREIGN KEY (`id_inscripcion`)
    REFERENCES `tumap`.`dbo_inscripcion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_respuesta_pregunta1`
    FOREIGN KEY (`id_pregunta`)
    REFERENCES `tumap`.`dbo_pregunta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_respuesta_imagen1`
    FOREIGN KEY (`id_imagen`)
    REFERENCES `tumap`.`dbo_imagen` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Placeholder table for view `tumap`.`dbo_vListado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tumap`.`dbo_vListado` (`id` INT);
USE `tumap`;

-- -----------------------------------------------------
-- View `tumap`.`dbo_vListado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tumap`.`dbo_vListado`;
USE `tumap`;
CREATE  OR REPLACE VIEW `dbo_vListado` AS
	select distinct  
	dbo_inscripcion.documento, 
	dbo_pregunta.orden,
	dbo_inscripcion.nombre, 
	dbo_inscripcion.posicionamiento,
	dbo_inscripcion.departamento,  
	dbo_inscripcion.munipio, 
	dbo_inscripcion.fecha,
	dbo_pregunta.pregunta,
	dbo_imagen.nombre as imagen
	from dbo_inscripcion
	inner join dbo_respuesta on dbo_respuesta.id = dbo_inscripcion.id
	inner join dbo_pregunta on dbo_pregunta.id = dbo_respuesta.id_pregunta
	inner join dbo_imagen on dbo_imagen.id= dbo_respuesta.id_imagen
	order by dbo_inscripcion.documento, dbo_pregunta.orden;


DROP TABLE IF EXISTS `tumap`.`dbo_vListadoTodo`;
USE `tumap`;
CREATE  OR REPLACE VIEW `dbo_vListadoTodo` AS
	select distinct dbo_inscripcion.* 	
	from dbo_inscripcion
	inner join dbo_respuesta on dbo_respuesta.id = dbo_inscripcion.id
	inner join dbo_pregunta on dbo_pregunta.id = dbo_respuesta.id_pregunta
	inner join dbo_imagen on dbo_imagen.id= dbo_respuesta.id_imagen
	order by dbo_inscripcion.documento, dbo_pregunta.orden;

/*dbo_pregunta*/

INSERT INTO `tumap`.`dbo_pregunta` (`orden`, `pregunta`) VALUES ('1', 'pregunta1');
INSERT INTO `tumap`.`dbo_pregunta` (`orden`, `pregunta`) VALUES ('2', 'pregunta2');
INSERT INTO `tumap`.`dbo_pregunta` (`orden`, `pregunta`) VALUES ('3', 'pregunta3');
INSERT INTO `tumap`.`dbo_pregunta` (`orden`, `pregunta`) VALUES ('4', 'pregunta4');
INSERT INTO `tumap`.`dbo_pregunta` (`orden`, `pregunta`) VALUES ('5', 'pregunta5');

INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES (1, 1, 'imagen1', '\\imagen1.png');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('1', '2', 'imagen2', '\\imagen1.png');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('1', '3', 'imagen3', '\\imagen1.png');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('2', '1', 'imagen1', '\\imagen1.png');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('2', '2', 'imagen2', '\\imagen1.png');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('2', '3', 'imagen3', '\\imagen1.png');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('3', '1', 'imagen1', '\\imagen1.png');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('3', '2', 'imagen2', '\\imagen1.png');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('4', '1', 'imagen1', '\\imagen1.png');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('4', '2', 'imagen2', '\\imagen1.png');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('4', '3', 'imagen3', '\\imagen1.png');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('5', '1', 'imagen1', '\\imagen1.png');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('5', '2', 'imagen2', '\\imagen1.png');


INSERT INTO `tumap`.`dbo_inscripcion` (`documento`, `nombre`, `posicionamiento`, `departamento`, `munipio`, `fecha`) VALUES ('11', 'nombre1 apellido1', 'coordenadaXY', 'Cundinamarca', 'Soacha', CURDATE());
INSERT INTO `tumap`.`dbo_inscripcion` (`documento`, `nombre`, `posicionamiento`, `departamento`, `munipio`, `fecha`) VALUES ('22', 'nombre2 apellido2', 'coordenadaXY', 'Cundinamarca', 'Soacha', CURDATE());
INSERT INTO `tumap`.`dbo_inscripcion` (`documento`, `nombre`, `posicionamiento`, `departamento`, `munipio`, `fecha`) VALUES ('33', 'nombre3 apellido3', 'coordenadaXY', 'Cundinamarca', 'Soacha', CURDATE());
INSERT INTO `tumap`.`dbo_inscripcion` (`documento`, `nombre`, `posicionamiento`, `departamento`, `munipio`, `fecha`) VALUES ('44', 'nombre4 apellido4', 'coordenadaXY', 'Cundinamarca', 'Soacha', CURDATE());
INSERT INTO `tumap`.`dbo_inscripcion` (`documento`, `nombre`, `posicionamiento`, `departamento`, `munipio`, `fecha`) VALUES ('55', 'nombre5 apellido5', 'coordenadaXY', 'Cundinamarca', 'Soacha', CURDATE());

INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('1', '1', '1');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('1', '2', '4');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('1', '3', '7');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('1', '4', '11');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('1', '5', '12');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('2', '1', '1');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('2', '2', '6');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('2', '3', '7');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('2', '4', '9');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('2', '5', '13');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('3', '1', '3');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('3', '2', '5');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('3', '3', '8');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('3', '4', '10');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('3', '5', '12');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('4', '1', '1');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('4', '2', '4');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('4', '3', '8');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('4', '4', '11');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('4', '5', '13');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('5', '1', '2');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('5', '2', '6');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('5', '3', '8');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('5', '4', '10');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('5', '5', '12');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
--*********************************************************************************************************
-- fin DBO --
--*********************************************************************************************************


--*********************************************************************************************************
-- Tablas Inventarios Redes Secas --
--*********************************************************************************************************

CREATE TABLE IF NOT EXISTS `irs_estados_redes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `irs_inventarios_otros` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  `id_irs_estado_red` int(10) unsigned NOT NULL,
  `identificador` varchar(30) DEFAULT NULL,
  `id_irs_operador` int(10) unsigned DEFAULT NULL,
  `ubicacion` json NOT NULL,
  `imagen` varchar(150) DEFAULT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  `id_irs_operador_celular` int(10) unsigned DEFAULT NULL,
  `id_irs_estado_red_celular` int(10) unsigned DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `ip` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `irs_inventarios_postes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_irs_material` int(10) unsigned NOT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `id_irs_estado_red` int(10) unsigned NOT NULL,
  `tiene_lampara` varchar(1) NOT NULL,
  `tiene_transformador` varchar(1) NOT NULL,
  `tipo_red` varchar(10) NOT NULL,
  `ubicacion` json NOT NULL,
  `imagen` varchar(150) DEFAULT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  `id_irs_operador_celular` int(10) unsigned DEFAULT NULL,
  `id_irs_estado_red_celular` int(10) unsigned DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `ip` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `irs_materiales_postes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `irs_operadores_celulares` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `logotipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `irs_tipos_redes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `tipo` tinyint(1) unsigned NOT NULL,
  `icono` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `irs_estados_redes` (`nombre`) VALUES ('Bueno'), ('Regular'), ('Malo');
INSERT INTO `irs_materiales_postes` (`nombre`) VALUES ('Concreto'), ('Madera'), ('Metal');
INSERT INTO `irs_operadores_celulares` (`nombre`, `logotipo`) VALUES ('Claro', 'claro.svg'), ('Movistar', 'movistar.svg'), ('Tigo', 'tigo.svg'), ('Avantel', 'avantel.svg');
INSERT INTO `irs_tipos_redes` (`nombre`, `tipo`, `icono`) VALUES ('Postes', 1, 'irs-postes.svg'), ('Torres', 0, 'irs-torres.svg'), ('Antenas', 0, 'irs-antenas.svg'), ('Armarios', 0, 'irs-armarios.svg');

--*********************************************************************************************************
-- Fin Tablas Inventarios Redes Secas --
--*********************************************************************************************************

/*Crear tabla encuesta social*/
create table SEC_Encuesta_Social(
	id_Encuesta int not null auto_increment primary key, 
  Vinculo_Territorial varchar (10) not null,
	alimentacion int not null, 
	seguridad int not null, 
	servicios_publicos int not null, 
	transporte int not null
    );
    /*insertar datos en encuesta social*/
    INSERT INTO SEC_Encuesta_Social(vinculo_territorial, alimentacion, seguridad, servicios_publicos, transporte)
	    VALUES ('vivo',4,3,2,1);
	INSERT INTO SEC_Encuesta_Social(vinculo_territorial, alimentacion, seguridad, servicios_publicos, transporte)
	    VALUES ('trabajo',1,2,3,4);
	INSERT INTO SEC_Encuesta_Social(vinculo_territorial, alimentacion, seguridad, servicios_publicos, transporte)
	    VALUES ('ambos',4,2,3,1);
    
    
/*Crear tabla establecimiento comercial*/
create table SEC_Establecimiento_Comercial(
	id_CF int not null auto_increment primary key, 
    Nombre_Establecimiento varchar (50) not null,
    Productos_Servicios varchar (10) not null,
    Descripcion varchar (60) not null,
    N_Empleados int not null,
    Foto varchar (120) not null
    );    
    /*insertar datos en establecimiento comercial*/
    INSERT INTO SEC_Establecimiento_Comercial (Nombre_Establecimiento, Productos_Servicios, Descripcion , N_Empleados, Foto)
		VALUES ('doña segunda','producto','comida criolla','10','url'); 
	INSERT INTO SEC_Establecimiento_Comercial (Nombre_Establecimiento, Productos_Servicios, Descripcion , N_Empleados, Foto)
		VALUES ('gammer','servicios','video juegos','1','url'); 
	INSERT INTO SEC_Establecimiento_Comercial (Nombre_Establecimiento, Productos_Servicios, Descripcion , N_Empleados, Foto)
		VALUES ('norberta','ambos','salon de belleza','6','url'); 
    
    /*Crear tabla Comercio Informal*/
create table SEC_Comercio_Informal(
	id_CI int not null auto_increment primary key, 
    Productos_Servicios varchar (10) not null,
    Descripcion varchar (60) not null,
    Estatico_Movil varchar (10) not null,
    Periodicidad varchar (20) not null,
    Jornada varchar (20) not null,
    Foto varchar (120) not null
    );
     /*insertar datos en Comercio Informal*/  
    INSERT INTO SEC_Comercio_Informal (Productos_Servicios, Descripcion , Estatico_Movil, Periodicidad, Jornada, Foto)
		VALUES ('productos','videos','estatico','fin de semana','diurno','url'); 
	INSERT INTO SEC_Comercio_Informal (Productos_Servicios, Descripcion , Estatico_Movil, Periodicidad, Jornada, Foto)
		VALUES ('servicios','minutos','ambulante','entre semana','nocturno','url'); 
	INSERT INTO SEC_Comercio_Informal (Productos_Servicios, Descripcion , Estatico_Movil, Periodicidad, Jornada, Foto)
		VALUES ('ambos','dulceria y minutos','estatico','fin de semana','diurno y nocturno','url');

--*********************************************************************************************************
-- Fin Tablas Inventarios Redes Secas --
--********************************************************************************************************* 

CREATE TABLE IM_REGISTROS (
ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
NOMBRE_PROPIETARIO VARCHAR(45),
NOMBRE_PREDIO VARCHAR(45),
AREA VARCHAR(45) NOT NULL,
DIRECCION VARCHAR(45) NOT NULL
);
CREATE TABLE IM_PREDIO (
ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
PREDIO GEOMETRY NOT NULL,
ID_REGISTROS INT NOT NULL
);
CREATE TABLE IM_TIPO_USOS (
ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
DESCRIPCION VARCHAR(45) NOT NULL
);
CREATE TABLE IM_USOS_PREDIO (
ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
POLIGONO GEOMETRY NOT NULL,
ID_PREDIO INT NOT NULL,
ID_TIPO_USOS INT NOT NULL
);
ALTER TABLE IM_PREDIO ADD FOREIGN KEY (ID_REGISTROS) REFERENCES IM_REGISTROS(ID);
ALTER TABLE IM_USOS_PREDIO ADD FOREIGN KEY (ID_PREDIO) REFERENCES IM_PREDIO(ID);
ALTER TABLE IM_USOS_PREDIO ADD FOREIGN KEY (ID_TIPO_USOS) REFERENCES IM_TIPO_USOS(ID);

--*********************************************************************************************************
-- TABLAS SENALIZACION | MOBILIARIO URBANO --
--*********************************************************************************************************

-- -----------------------------------------------------
-- table categoria
-- -----------------------------------------------------
create table jyd_categoria (
  pk_id_categoria int not null auto_increment,
  descripcion varchar(45) not null,
  ruta varchar(45) not null,
  primary key (pk_id_categoria)
);

-- -----------------------------------------------------
-- table item
-- -----------------------------------------------------
create table jyd_item (
  pk_id_item int not null auto_increment,
  nombre varchar(45) not null,
  descripcion varchar(45) null,
  imagen varchar(45) null,
  fk_categoria int not null,
  primary key (pk_id_item, fk_categoria),
  index fk_item_categoria1_idx (fk_categoria asc),
  constraint fk_item_categoria1
    foreign key (fk_categoria)
    references jyd_categoria (pk_id_categoria)
);

-- -----------------------------------------------------
-- table estado
-- -----------------------------------------------------
create table jyd_estado (
  pk_id_estado int not null auto_increment,
  descripcion varchar(45) null,
  primary key (pk_id_estado)
);

-- -----------------------------------------------------
-- table registro
-- -----------------------------------------------------
create table jyd_registro (
  pk_id_registro int not null auto_increment,
  fk_users int not null,
  fecha_registro date null,
  primary key (pk_id_registro, fk_users),
  index fk_registro_users1_idx (fk_users asc),
  constraint fk_registro_users1
    foreign key (fk_users)
    references users (id)
);

-- -----------------------------------------------------
-- table registro_has_item
-- -----------------------------------------------------
create table jyd_registro_has_item (
  fk_id_registro int not null,
  fk_id_item int not null,
  latitud double null,
  longitud double null,
  imagen varchar(45) null,
  descripcion varchar(45) null,
  fk_estado int not null,
  primary key (fk_id_registro, fk_id_item),
  index fk_registro_has_item_item1_idx (fk_id_item asc),
  index fk_registro_has_item_registro1_idx (fk_id_registro asc),
  constraint fk_registro_has_item_registro1
    foreign key (fk_id_registro)
    references jyd_registro (pk_id_registro),
  constraint fk_registro_has_item_item1
    foreign key (fk_id_item)
    references jyd_item (pk_id_item)
);

/* jyd_categoria */
insert into jyd_categoria (descripcion, ruta) value ('señalizacion', '/senalizacion');
insert into jyd_categoria (descripcion, ruta) value ('mobiliario urbano', '/mobiliario');

/* jyd_item */
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('señal de transito', 'pare', 'assest/img_jyd/señal de transito', 1);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('semáforo', 'señales de control del tráfico', 'assest/img_jyd/semaforo', 1);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('postes de soportes para señales', 'elementos de fijación al suelo o sujeción ', 'assest/img_jyd/postes_senal.png', 1);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('porticos de soporte de señales', 'protección de seguridad', 'assest/img_jyd/porticos_de_senal.png', 1);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('hitos kilometricos', 'distancia de inicio de carretera', 'assest/img_jyd/hitos_kilometricos.png', 1);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('guardavia convencionales', 'barrera de seguridad metalica', 'assest/img_jyd/guardavia_convencional.png', 1);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('marcas sobre pavimento', 'señalizacion horizontal', 'assest/img_jyd/marcas_pavimento.png', 1);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('tachas retroreflectivas', 'marcación de carriles', 'assest/img_jyd/tachas_retroreflectivas.png', 1);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('tachones reflectivas', 'marcación ojo de gato en carriles', 'assest/img_jyd/tachones_reflectivos.png', 1);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('paradero', 'elemento urbano', 'assest/img_jyd/paradero.png', 2);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('panel publicitario', 'estructura de publicidad', 'assest/img_jyd/panel_publicitario.png', 2);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('banca de concreto', 'estructura de descanso urbano', 'assest/img_jyd/banca_concreto.png', 2);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('banca de madera', 'estructura de descanso urbano', 'assest/img_jyd/banca_madera.png', 2);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('baranda', 'accesibilidad de sujeción', 'assest/img_jyd/baranda.png', 2);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('protector de arbol', 'protección contra roedores', 'assest/img_jyd/protector_de_arbol.png', 2);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('ciclo parqueadero', 'estacionamiento de bicicletas', 'assest/img_jyd/ciclo_parqueadero.png', 2);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('bebedero', 'suministro de agua', 'assest/img_jyd/bebedero.png', 2);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('postes de alumbrado público ', 'suministro de iluminacion', 'assest/img_jyd/postes_alumbrado_publico.png', 2);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('módulo de ciclo estación', 'unidad de guardado', 'assest/img_jyd/modulo_ciclo_estacion.png', 2);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('módulo de servicio de sanitario', 'unidad humeda', 'assest/img_jyd/modulo_servisio_sanitario.png', 2);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('módulo de información', 'proporcion de ayuda', 'assest/img_jyd/modulo_informacion.png', 2);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('caneca basura', 'lugar de desechos', 'assest/img_jyd/caneca.png', 2);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('silla jardin', 'estructura para parque', 'assest/img_jyd/silla.png', 2);
insert into jyd_item (nombre, descripcion, imagen, fk_categoria) value ('captafaros', 'dispositivos de guia optica', 'assest/img_jyd/captfaros.png', 2);

/* jyd_estado */
insert into jyd_estado (descripcion) value ('nuevo');
insert into jyd_estado (descripcion) value ('en mal estado');

/* jyd_registro */
insert into jyd_registro (fk_users, fecha_registro) value (3, '2019-9-29');
insert into jyd_registro (fk_users, fecha_registro) value (3, '2019-9-29');
insert into jyd_registro (fk_users, fecha_registro) value (2, '2019-9-28');

/* jyd_registro_has_jyd_item */
insert into jyd_registro_has_item (fk_id_registro, fk_id_item, latitud, longitud, imagen, descripcion, fk_estado) 
            value (1, 1, 4.6579711999999995, -74.1122048, 'assest/img_jyd/captura_1234', 'señal en mal estado', 2);
insert into jyd_registro_has_item (fk_id_registro, fk_id_item, latitud, longitud, imagen, descripcion, fk_estado) 
            value (1, 2, 4.6579711999999995, -74.1122048, 'assest/img_jyd/captura_4321', 'semaforo nuevo', 1);
insert into jyd_registro_has_item (fk_id_registro, fk_id_item, latitud, longitud, imagen, descripcion, fk_estado) 
            value (1, 22, 4.6579711999999995, -74.1122048, 'assest/img_jyd/captura_2341', 'caneca nueva', 1);
insert into jyd_registro_has_item (fk_id_registro, fk_id_item, latitud, longitud, imagen, descripcion, fk_estado) 
            value (3, 22, 4.6579711999999995, -74.1122048, 'assest/img_jyd/captura_4231', 'caneca nueva', 1);

--*********************************************************************************************************
-- FIN TABLAS SENALIZACION | MOBILIARIO URBANO --
--*********************************************************************************************************        
/*BASE DE DATOS DE VIAS JF*/

CREATE table jf_detalle_via ( 
	id int not null auto_increment primary key,
    detalle varchar(200) not null
);
/*Creacion de tabla del estado*/
CREATE table jf_estado (
	id int not null auto_increment primary key,
    estado varchar(100) not null
);
/*Creacion de tabla de descripcion vial*/
CREATE table jf_descripcion_via(
	id int not null auto_increment primary key,
    ubicacion geometry not null,
    nombre_via varchar(200),
    detalle int not null,
		foreign key (id) references jf_detalle_via(id),
	imagen varchar(200),
    estado int not null,
		foreign key (id) references jf_estado(id)
);
/*DML*/
/*CRUD tabla jf_detalle_via*/
insert into jf_detalle_via (detalle)
	values ('hueco'),('mantenimiento'),('via cerrada');
/*CRUD tabla jf_estado*/
insert into jf_estado(estado)
	values ('en espera'),('aprobado'),('no aprobado');
/*CRUD tabla jf_descripcion_via*/
insert into jf_descripcion_via(ubicacion, nombre_via, detalle, imagen, estado)
	values (ST_GeomFromText('point(1 1)'), 'av 68', 2, '/imagen/av68', 1), (ST_GeomFromText('point(0 1)'), 'boyaca', 1, '/imagen/boyaca', 2), (ST_GeomFromText('point(1 0)'), 'cali', 3, '/imagen/cali', 3);


--*********************************************************************************************************
-- Creación tablas minas --
--*********************************************************************************************************
create table MP_EstadoActual_mina 
(id_estadomina int not null primary key auto_increment , 
nombre_estadomina varchar(20) not null);

create table MP_tipo_material 
(id_tipomaterial int not null primary key auto_increment , 
nombre_tipomaterial varchar(20) not null);

create table MP_Sistema_Explotacion 
(id_sistemaexplotacion int not null primary key auto_increment , 
nombre_sistemaexplotacion varchar(20) not null);

Create table MP_Registro_Mina
(id_registromina int not null primary key auto_increment , 
ubicacion POINT not null,
mineral varchar(40) not null,
trabajadores varchar(40) not null,
observacion varchar(40) not null,
id_sistemaexplotacion int not null,
id_tipomaterial int not null,
id_estadomina int not null,
FOREIGN KEY (id_sistemaexplotacion) REFERENCES MP_Sistema_Explotacion(id_sistemaexplotacion),
FOREIGN KEY (id_tipomaterial) REFERENCES MP_tipo_material(id_tipomaterial),
FOREIGN KEY (id_estadomina) REFERENCES MP_EstadoActual_mina(id_estadomina)
)

--*********************************************************************************************************
-- Fin Tablas Minas --
--*********************************************************************************************************

--*********************************************************************************************************
-- Creación tablas Hydrico --
--*********************************************************************************************************
CREATE TABLE IF NOT EXISTS `connections` (
  `id_Connections` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `Users_id_User` int(11) NOT NULL,
  PRIMARY KEY (`id_Connections`),
  KEY `fk_Conexiones_Users1_idx` (`Users_id_User`),
  CONSTRAINT `fk_Conexiones_Users1` FOREIGN KEY (`Users_id_User`) REFERENCES `users` (`id_User`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `coverages` (
  `id_Coverage` int(11) NOT NULL AUTO_INCREMENT,
  `color` enum('Café','Amarillo','blanca','Incoloro') DEFAULT NULL,
  `other_color` varchar(30) DEFAULT NULL,
  `pressure` enum('Alta','Media','Baja') DEFAULT NULL,
  `type` enum('Intermitente','Permanente') DEFAULT NULL,
  `Users_id_User` int(11) NOT NULL,
  PRIMARY KEY (`id_Coverage`),
  KEY `fk_Cobertura_Users1_idx` (`Users_id_User`),
  CONSTRAINT `fk_Cobertura_Users1` FOREIGN KEY (`Users_id_User`) REFERENCES `users` (`id_User`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB  DEFAULT CHARSET=latin1ethnobotany;

CREATE TABLE IF NOT EXISTS `ethnobotany` (
  `id_Ethnobotany` int(11) NOT NULL AUTO_INCREMENT,
  `common_name` varchar(50) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `use` enum('Medicinal','Alimenticia','Decorativa') DEFAULT NULL,
  `users_id_User` int(11) NOT NULL,
  PRIMARY KEY (`id_Ethnobotany`),
  KEY `fk_Ethnobotany_users1_idx` (`users_id_User`),
  CONSTRAINT `fk_Ethnobotany_users1` FOREIGN KEY (`users_id_User`) REFERENCES `users` (`id_User`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `grown` (
  `id_Grown` int(11) NOT NULL AUTO_INCREMENT,
  `level` enum('Nivel Media','Nivel alto') DEFAULT NULL,
  `Users_id_User` int(11) NOT NULL,
  PRIMARY KEY (`id_Grown`),
  KEY `fk_Crecidas_Users1_idx` (`Users_id_User`),
  CONSTRAINT `fk_Crecidas_Users1` FOREIGN KEY (`Users_id_User`) REFERENCES `users` (`id_User`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `rol` (
  `id_Rol` int(11) NOT NULL AUTO_INCREMENT,
  `name_description` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `sheddings` (
  `id_Sheddings` int(11) NOT NULL AUTO_INCREMENT,
  `liq_description` varchar(500) DEFAULT NULL,
  `img_liq` varchar(500) DEFAULT NULL,
  `solid_descripcion` varchar(500) DEFAULT NULL,
  `img_solid` varchar(500) DEFAULT NULL,
  `Users_id_User` int(11) NOT NULL,
  PRIMARY KEY (`id_Sheddings`),
  KEY `fk_Vertimientos_Users1_idx` (`Users_id_User`),
  CONSTRAINT `fk_Vertimientos_Users1` FOREIGN KEY (`Users_id_User`) REFERENCES `users` (`id_User`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `users` (
  `id_User` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `identification_card` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `Rol_idRol` int(11) NOT NULL,
  PRIMARY KEY (`id_User`),
  KEY `fk_Users_Rol_idx` (`Rol_idRol`),
  CONSTRAINT `fk_Users_Rol` FOREIGN KEY (`Rol_idRol`) REFERENCES `rol` (`id_Rol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `without_coverage` (
  `id_Without_coverage` int(11) NOT NULL AUTO_INCREMENT,
  `state` enum('Suspensión','Corte','Nunca he tenido el servicio') DEFAULT NULL,
  `Users_id_User` int(11) NOT NULL,
  PRIMARY KEY (`id_Without_coverage`),
  KEY `fk_Sin_cobertura_Users1_idx` (`Users_id_User`),
  CONSTRAINT `fk_Sin_cobertura_Users1` FOREIGN KEY (`Users_id_User`) REFERENCES `users` (`id_User`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;


--*********************************************************************************************************
-- Fin Tablas Hydrico --
--*********************************************************************************************************




























































































































































































































































































































































CREATE TABLE cav_Datos_Establecimiento (
    Foto VARCHAR(50) NOT NULL,
    Nit INT NOT NULL PRIMARY KEY,
    Nom_Establecimiento VARCHAR(50) NOT NULL,
    Direccion VARCHAR(20) NOT NULL,
    Id_dpto_ciudad INT NOT NULL,
    Id_Tipo_Entidad INT NOT NULL,
    Observaciones VARCHAR(60) NOT NULL,
    Id_Estado INT NOT NULL);

CREATE TABLE cav_Tipo_Entidad (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Entidad VARCHAR(30) NOT NULL);
alter table cav_Datos_Establecimiento add foreign key (Id_Tipo_Entidad) references cav_Tipo_Entidad (Id); 


CREATE TABLE cav_dpto_ciudad (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `id_ciudad` INT(10) NULL DEFAULT NULL,
  `tipo` VARCHAR(1) NOT NULL,
  `codigo_dane` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`));
alter table cav_Datos_Establecimiento add foreign key (Id_dpto_ciudad) references cav_dpto_ciudad (Id); 
alter table cav_dpto_ciudad add foreign key (id_ciudad) references cav_dpto_ciudad (Id); 

CREATE TABLE cav_Estado (
    Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nom_Estado VARCHAR(30) NOT NULL);
alter table cav_Datos_Establecimiento add foreign key (Id_Estado) references cav_Estado (Id); 

insert into cav_Estado (Nom_Estado) value ('Pendiente');
insert into cav_Estado (Nom_Estado) value ('Aprobado');
insert into cav_Estado (Nom_Estado) value ('Rechazado');

insert into cav_Tipo_Entidad (Entidad) value ('EPS');
insert into cav_Tipo_Entidad (Entidad) value ('IPS');
insert into cav_Tipo_Entidad (Entidad) value ('HOSPITAL');
insert into cav_Tipo_Entidad (Entidad) value ('UPA');
insert into cav_Tipo_Entidad (Entidad) value ('CAMI');
insert into cav_Tipo_Entidad (Entidad) value ('UBA');
insert into cav_Tipo_Entidad (Entidad) value ('OTRO');

INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1', 'ANTIOQUIA', NULL, 'D', '05');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('2', 'ATLANTICO', NULL, 'D', '08');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('3', 'BOGOTA', NULL, 'D', '11');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('4', 'BOLIVAR', NULL, 'D', '13');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('5', 'BOYACA', NULL, 'D', '15');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('6', 'CALDAS', NULL, 'D', '17');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('7', 'CAQUETA', NULL, 'D', '18');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('8', 'CAUCA', NULL, 'D', '19');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('9', 'CESAR', NULL, 'D', '20');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('10', 'CORDOBA', NULL, 'D', '23');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('11', 'CUNDINAMARCA', NULL, 'D', '25');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('12', 'CHOCO', NULL, 'D', '27');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('13', 'HUILA', NULL, 'D', '41');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('14', 'LA GUAJIRA', NULL, 'D', '44');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('15', 'MAGDALENA', NULL, 'D', '47');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('16', 'META', NULL, 'D', '50');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('17', 'NARIÑO', NULL, 'D', '52');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('18', 'N. DE SANTANDER', NULL, 'D', '54');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('19', 'QUINDIO', NULL, 'D', '63');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('20', 'RISARALDA', NULL, 'D', '66');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('21', 'SANTANDER', NULL, 'D', '68');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('22', 'SUCRE', NULL, 'D', '70');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('23', 'TOLIMA', NULL, 'D', '73');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('24', 'VALLE DEL CAUCA', NULL, 'D', '76');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('25', 'ARAUCA', NULL, 'D', '81');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('26', 'CASANARE', NULL, 'D', '85');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('27', 'PUTUMAYO', NULL, 'D', '86');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('28', 'SAN ANDRES', NULL, 'D', '88');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('29', 'AMAZONAS', NULL, 'D', '91');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('30', 'GUAINIA', NULL, 'D', '94');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('31', 'GUAVIARE', NULL, 'D', '95');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('32', 'VAUPES', NULL, 'D', '97');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('33', 'VICHADA', NULL, 'D', '99');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('34', 'MEDELLIN', '1', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('35', 'ABEJORRAL', '1', 'C', '002');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('36', 'ABRIAQUI', '1', 'C', '004');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('37', 'ALEJANDRIA', '1', 'C', '021');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('38', 'AMAGA', '1', 'C', '030');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('39', 'AMALFI', '1', 'C', '031');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('40', 'ANDES', '1', 'C', '034');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('41', 'ANGELOPOLIS', '1', 'C', '036');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('42', 'ANGOSTURA', '1', 'C', '038');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('43', 'ANORI', '1', 'C', '040');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('44', 'SANTAFE DE ANTIOQUIA', '1', 'C', '042');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('45', 'ANZA', '1', 'C', '044');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('46', 'APARTADO', '1', 'C', '045');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('47', 'ARBOLETES', '1', 'C', '051');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('48', 'ARGELIA', '1', 'C', '055');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('49', 'ARMENIA', '1', 'C', '059');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('50', 'BARBOSA', '1', 'C', '079');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('51', 'BELMIRA', '1', 'C', '086');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('52', 'BELLO', '1', 'C', '088');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('53', 'BETANIA', '1', 'C', '091');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('54', 'BETULIA', '1', 'C', '093');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('55', 'CIUDAD BOLIVAR', '1', 'C', '101');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('56', 'BRICEÑO', '1', 'C', '107');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('57', 'BURITICA', '1', 'C', '113');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('58', 'CACERES', '1', 'C', '120');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('59', 'CAICEDO', '1', 'C', '125');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('60', 'CALDAS', '1', 'C', '129');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('61', 'CAMPAMENTO', '1', 'C', '134');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('62', 'CAÑASGORDAS', '1', 'C', '138');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('63', 'CARACOLI', '1', 'C', '142');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('64', 'CARAMANTA', '1', 'C', '145');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('65', 'CAREPA', '1', 'C', '147');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('66', 'EL CARMEN DE VIBORAL', '1', 'C', '148');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('67', 'CAROLINA', '1', 'C', '150');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('68', 'CAUCASIA', '1', 'C', '154');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('69', 'CHIGORODO', '1', 'C', '172');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('70', 'CISNEROS', '1', 'C', '190');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('71', 'COCORNA', '1', 'C', '197');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('72', 'CONCEPCION', '1', 'C', '206');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('73', 'CONCORDIA', '1', 'C', '209');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('74', 'COPACABANA', '1', 'C', '212');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('75', 'DABEIBA', '1', 'C', '234');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('76', 'DON MATIAS', '1', 'C', '237');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('77', 'EBEJICO', '1', 'C', '240');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('78', 'EL BAGRE', '1', 'C', '250');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('79', 'ENTRERRIOS', '1', 'C', '264');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('80', 'ENVIGADO', '1', 'C', '266');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('81', 'FREDONIA', '1', 'C', '282');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('82', 'FRONTINO', '1', 'C', '284');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('83', 'GIRALDO', '1', 'C', '306');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('84', 'GIRARDOTA', '1', 'C', '308');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('85', 'GOMEZ PLATA', '1', 'C', '310');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('86', 'GRANADA', '1', 'C', '313');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('87', 'GUADALUPE', '1', 'C', '315');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('88', 'GUARNE', '1', 'C', '318');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('89', 'GUATAPE', '1', 'C', '321');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('90', 'HELICONIA', '1', 'C', '347');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('91', 'HISPANIA', '1', 'C', '353');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('92', 'ITAGUI', '1', 'C', '360');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('93', 'ITUANGO', '1', 'C', '361');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('94', 'JARDIN', '1', 'C', '364');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('95', 'JERICO', '1', 'C', '368');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('96', 'LA CEJA', '1', 'C', '376');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('97', 'LA ESTRELLA', '1', 'C', '380');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('98', 'LA PINTADA', '1', 'C', '390');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('99', 'LA UNION', '1', 'C', '400');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('100', 'LIBORINA', '1', 'C', '411');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('101', 'MACEO', '1', 'C', '425');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('102', 'MARINILLA', '1', 'C', '440');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('103', 'MONTEBELLO', '1', 'C', '467');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('104', 'MURINDO', '1', 'C', '475');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('105', 'MUTATA', '1', 'C', '480');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('106', 'NARIÑO', '1', 'C', '483');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('107', 'NECOCLI', '1', 'C', '490');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('108', 'NECHI', '1', 'C', '495');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('109', 'OLAYA', '1', 'C', '501');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('110', 'PEÐOL', '1', 'C', '541');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('111', 'PEQUE', '1', 'C', '543');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('112', 'PUEBLORRICO', '1', 'C', '576');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('113', 'PUERTO BERRIO', '1', 'C', '579');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('114', 'PUERTO NARE', '1', 'C', '585');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('115', 'PUERTO TRIUNFO', '1', 'C', '591');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('116', 'REMEDIOS', '1', 'C', '604');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('117', 'RETIRO', '1', 'C', '607');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('118', 'RIONEGRO', '1', 'C', '615');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('119', 'SABANALARGA', '1', 'C', '628');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('120', 'SABANETA', '1', 'C', '631');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('121', 'SALGAR', '1', 'C', '642');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('122', 'SAN ANDRES DE CUERQUIA', '1', 'C', '647');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('123', 'SAN CARLOS', '1', 'C', '649');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('124', 'SAN FRANCISCO', '1', 'C', '652');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('125', 'SAN JERONIMO', '1', 'C', '656');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('126', 'SAN JOSE DE LA MONTAÑA', '1', 'C', '658');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('127', 'SAN JUAN DE URABA', '1', 'C', '659');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('128', 'SAN LUIS', '1', 'C', '660');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('129', 'SAN PEDRO', '1', 'C', '664');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('130', 'SAN PEDRO DE URABA', '1', 'C', '665');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('131', 'SAN RAFAEL', '1', 'C', '667');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('132', 'SAN ROQUE', '1', 'C', '670');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('133', 'SAN VICENTE', '1', 'C', '674');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('134', 'SANTA BARBARA', '1', 'C', '679');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('135', 'SANTA ROSA DE OSOS', '1', 'C', '686');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('136', 'SANTO DOMINGO', '1', 'C', '690');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('137', 'EL SANTUARIO', '1', 'C', '697');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('138', 'SEGOVIA', '1', 'C', '736');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('139', 'SONSON', '1', 'C', '756');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('140', 'SOPETRAN', '1', 'C', '761');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('141', 'TAMESIS', '1', 'C', '789');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('142', 'TARAZA', '1', 'C', '790');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('143', 'TARSO', '1', 'C', '792');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('144', 'TITIRIBI', '1', 'C', '809');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('145', 'TOLEDO', '1', 'C', '819');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('146', 'TURBO', '1', 'C', '837');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('147', 'URAMITA', '1', 'C', '842');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('148', 'URRAO', '1', 'C', '847');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('149', 'VALDIVIA', '1', 'C', '854');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('150', 'VALPARAISO', '1', 'C', '856');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('151', 'VEGACHI', '1', 'C', '858');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('152', 'VENECIA', '1', 'C', '861');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('153', 'VIGIA DEL FUERTE', '1', 'C', '873');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('154', 'YALI', '1', 'C', '885');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('155', 'YARUMAL', '1', 'C', '887');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('156', 'YOLOMBO', '1', 'C', '890');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('157', 'YONDO', '1', 'C', '893');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('158', 'ZARAGOZA', '1', 'C', '895');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('159', 'BARRANQUILLA', '2', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('160', 'BARANOA', '2', 'C', '078');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('161', 'CAMPO DE LA CRUZ', '2', 'C', '137');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('162', 'CANDELARIA', '2', 'C', '141');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('163', 'GALAPA', '2', 'C', '296');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('164', 'JUAN DE ACOSTA', '2', 'C', '372');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('165', 'LURUACO', '2', 'C', '421');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('166', 'MALAMBO', '2', 'C', '433');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('167', 'MANATI', '2', 'C', '436');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('168', 'PALMAR DE VARELA', '2', 'C', '520');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('169', 'PIOJO', '2', 'C', '549');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('170', 'POLONUEVO', '2', 'C', '558');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('171', 'PONEDERA', '2', 'C', '560');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('172', 'PUERTO COLOMBIA', '2', 'C', '573');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('173', 'REPELON', '2', 'C', '606');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('174', 'SABANAGRANDE', '2', 'C', '634');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('175', 'SABANALARGA', '2', 'C', '638');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('176', 'SANTA LUCIA', '2', 'C', '675');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('177', 'SANTO TOMAS', '2', 'C', '685');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('178', 'SOLEDAD', '2', 'C', '758');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('179', 'SUAN', '2', 'C', '770');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('180', 'TUBARA', '2', 'C', '832');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('181', 'USIACURI', '2', 'C', '849');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('182', 'BOGOTA, D.C.', '3', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('183', 'CARTAGENA', '4', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('184', 'ACHI', '4', 'C', '006');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('185', 'ALTOS DEL ROSARIO', '4', 'C', '030');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('186', 'ARENAL', '4', 'C', '042');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('187', 'ARJONA', '4', 'C', '052');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('188', 'ARROYOHONDO', '4', 'C', '062');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('189', 'BARRANCO DE LOBA', '4', 'C', '074');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('190', 'CALAMAR', '4', 'C', '140');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('191', 'CANTAGALLO', '4', 'C', '160');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('192', 'CICUCO', '4', 'C', '188');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('193', 'CORDOBA', '4', 'C', '212');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('194', 'CLEMENCIA', '4', 'C', '222');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('195', 'EL CARMEN DE BOLIVAR', '4', 'C', '244');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('196', 'EL GUAMO', '4', 'C', '248');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('197', 'EL PEÑON', '4', 'C', '268');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('198', 'HATILLO DE LOBA', '4', 'C', '300');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('199', 'MAGANGUE', '4', 'C', '430');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('200', 'MAHATES', '4', 'C', '433');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('201', 'MARGARITA', '4', 'C', '440');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('202', 'MARIA LA BAJA', '4', 'C', '442');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('203', 'MONTECRISTO', '4', 'C', '458');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('204', 'MOMPOS', '4', 'C', '468');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('205', 'NOROSI', '4', 'C', '490');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('206', 'MORALES', '4', 'C', '473');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('207', 'PINILLOS', '4', 'C', '549');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('208', 'REGIDOR', '4', 'C', '580');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('209', 'RIO VIEJO', '4', 'C', '600');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('210', 'SAN CRISTOBAL', '4', 'C', '620');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('211', 'SAN ESTANISLAO', '4', 'C', '647');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('212', 'SAN FERNANDO', '4', 'C', '650');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('213', 'SAN JACINTO', '4', 'C', '654');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('214', 'SAN JACINTO DEL CAUCA', '4', 'C', '655');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('215', 'SAN JUAN NEPOMUCENO', '4', 'C', '657');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('216', 'SAN MARTIN DE LOBA', '4', 'C', '667');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('217', 'SAN PABLO', '4', 'C', '670');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('218', 'SANTA CATALINA', '4', 'C', '673');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('219', 'SANTA ROSA', '4', 'C', '683');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('220', 'SANTA ROSA DEL SUR', '4', 'C', '688');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('221', 'SIMITI', '4', 'C', '744');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('222', 'SOPLAVIENTO', '4', 'C', '760');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('223', 'TALAIGUA NUEVO', '4', 'C', '780');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('224', 'TIQUISIO', '4', 'C', '810');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('225', 'TURBACO', '4', 'C', '836');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('226', 'TURBANA', '4', 'C', '838');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('227', 'VILLANUEVA', '4', 'C', '873');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('228', 'ZAMBRANO', '4', 'C', '894');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('229', 'TUNJA', '5', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('230', 'ALMEIDA', '5', 'C', '022');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('231', 'AQUITANIA', '5', 'C', '047');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('232', 'ARCABUCO', '5', 'C', '051');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('233', 'BELEN', '5', 'C', '087');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('234', 'BERBEO', '5', 'C', '090');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('235', 'BETEITIVA', '5', 'C', '092');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('236', 'BOAVITA', '5', 'C', '097');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('237', 'BOYACA', '5', 'C', '104');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('238', 'BRICEÑO', '5', 'C', '106');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('239', 'BUENAVISTA', '5', 'C', '109');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('240', 'BUSBANZA', '5', 'C', '114');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('241', 'CALDAS', '5', 'C', '131');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('242', 'CAMPOHERMOSO', '5', 'C', '135');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('243', 'CERINZA', '5', 'C', '162');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('244', 'CHINAVITA', '5', 'C', '172');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('245', 'CHIQUINQUIRA', '5', 'C', '176');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('246', 'CHISCAS', '5', 'C', '180');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('247', 'CHITA', '5', 'C', '183');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('248', 'CHITARAQUE', '5', 'C', '185');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('249', 'CHIVATA', '5', 'C', '187');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('250', 'CIENEGA', '5', 'C', '189');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('251', 'COMBITA', '5', 'C', '204');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('252', 'COPER', '5', 'C', '212');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('253', 'CORRALES', '5', 'C', '215');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('254', 'COVARACHIA', '5', 'C', '218');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('255', 'CUBARA', '5', 'C', '223');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('256', 'CUCAITA', '5', 'C', '224');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('257', 'CUITIVA', '5', 'C', '226');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('258', 'CHIQUIZA', '5', 'C', '232');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('259', 'CHIVOR', '5', 'C', '236');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('260', 'DUITAMA', '5', 'C', '238');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('261', 'EL COCUY', '5', 'C', '244');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('262', 'EL ESPINO', '5', 'C', '248');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('263', 'FIRAVITOBA', '5', 'C', '272');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('264', 'FLORESTA', '5', 'C', '276');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('265', 'GACHANTIVA', '5', 'C', '293');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('266', 'GAMEZA', '5', 'C', '296');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('267', 'GARAGOA', '5', 'C', '299');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('268', 'GUACAMAYAS', '5', 'C', '317');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('269', 'GUATEQUE', '5', 'C', '322');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('270', 'GUAYATA', '5', 'C', '325');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('271', 'GsICAN', '5', 'C', '332');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('272', 'IZA', '5', 'C', '362');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('273', 'JENESANO', '5', 'C', '367');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('274', 'JERICO', '5', 'C', '368');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('275', 'LABRANZAGRANDE', '5', 'C', '377');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('276', 'LA CAPILLA', '5', 'C', '380');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('277', 'LA VICTORIA', '5', 'C', '401');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('278', 'LA UVITA', '5', 'C', '403');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('279', 'VILLA DE LEYVA', '5', 'C', '407');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('280', 'MACANAL', '5', 'C', '425');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('281', 'MARIPI', '5', 'C', '442');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('282', 'MIRAFLORES', '5', 'C', '455');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('283', 'MONGUA', '5', 'C', '464');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('284', 'MONGUI', '5', 'C', '466');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('285', 'MONIQUIRA', '5', 'C', '469');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('286', 'MOTAVITA', '5', 'C', '476');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('287', 'MUZO', '5', 'C', '480');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('288', 'NOBSA', '5', 'C', '491');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('289', 'NUEVO COLON', '5', 'C', '494');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('290', 'OICATA', '5', 'C', '500');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('291', 'OTANCHE', '5', 'C', '507');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('292', 'PACHAVITA', '5', 'C', '511');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('293', 'PAEZ', '5', 'C', '514');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('294', 'PAIPA', '5', 'C', '516');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('295', 'PAJARITO', '5', 'C', '518');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('296', 'PANQUEBA', '5', 'C', '522');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('297', 'PAUNA', '5', 'C', '531');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('298', 'PAYA', '5', 'C', '533');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('299', 'PAZ DE RIO', '5', 'C', '537');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('300', 'PESCA', '5', 'C', '542');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('301', 'PISBA', '5', 'C', '550');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('302', 'PUERTO BOYACA', '5', 'C', '572');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('303', 'QUIPAMA', '5', 'C', '580');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('304', 'RAMIRIQUI', '5', 'C', '599');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('305', 'RAQUIRA', '5', 'C', '600');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('306', 'RONDON', '5', 'C', '621');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('307', 'SABOYA', '5', 'C', '632');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('308', 'SACHICA', '5', 'C', '638');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('309', 'SAMACA', '5', 'C', '646');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('310', 'SAN EDUARDO', '5', 'C', '660');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('311', 'SAN JOSE DE PARE', '5', 'C', '664');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('312', 'SAN LUIS DE GACENO', '5', 'C', '667');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('313', 'SAN MATEO', '5', 'C', '673');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('314', 'SAN MIGUEL DE SEMA', '5', 'C', '676');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('315', 'SAN PABLO DE BORBUR', '5', 'C', '681');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('316', 'SANTANA', '5', 'C', '686');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('317', 'SANTA MARIA', '5', 'C', '690');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('318', 'SANTA ROSA DE VITERBO', '5', 'C', '693');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('319', 'SANTA SOFIA', '5', 'C', '696');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('320', 'SATIVANORTE', '5', 'C', '720');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('321', 'SATIVASUR', '5', 'C', '723');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('322', 'SIACHOQUE', '5', 'C', '740');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('323', 'SOATA', '5', 'C', '753');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('324', 'SOCOTA', '5', 'C', '755');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('325', 'SOCHA', '5', 'C', '757');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('326', 'SOGAMOSO', '5', 'C', '759');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('327', 'SOMONDOCO', '5', 'C', '761');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('328', 'SORA', '5', 'C', '762');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('329', 'SOTAQUIRA', '5', 'C', '763');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('330', 'SORACA', '5', 'C', '764');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('331', 'SUSACON', '5', 'C', '774');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('332', 'SUTAMARCHAN', '5', 'C', '776');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('333', 'SUTATENZA', '5', 'C', '778');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('334', 'TASCO', '5', 'C', '790');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('335', 'TENZA', '5', 'C', '798');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('336', 'TIBANA', '5', 'C', '804');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('337', 'TIBASOSA', '5', 'C', '806');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('338', 'TINJACA', '5', 'C', '808');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('339', 'TIPACOQUE', '5', 'C', '810');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('340', 'TOCA', '5', 'C', '814');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('341', 'TOGsI', '5', 'C', '816');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('342', 'TOPAGA', '5', 'C', '820');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('343', 'TOTA', '5', 'C', '822');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('344', 'TUNUNGUA', '5', 'C', '832');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('345', 'TURMEQUE', '5', 'C', '835');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('346', 'TUTA', '5', 'C', '837');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('347', 'TUTAZA', '5', 'C', '839');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('348', 'UMBITA', '5', 'C', '842');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('349', 'VENTAQUEMADA', '5', 'C', '861');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('350', 'VIRACACHA', '5', 'C', '879');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('351', 'ZETAQUIRA', '5', 'C', '897');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('352', 'MANIZALES', '6', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('353', 'AGUADAS', '6', 'C', '013');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('354', 'ANSERMA', '6', 'C', '042');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('355', 'ARANZAZU', '6', 'C', '050');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('356', 'BELALCAZAR', '6', 'C', '088');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('357', 'CHINCHINA', '6', 'C', '174');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('358', 'FILADELFIA', '6', 'C', '272');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('359', 'LA DORADA', '6', 'C', '380');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('360', 'LA MERCED', '6', 'C', '388');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('361', 'MANZANARES', '6', 'C', '433');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('362', 'MARMATO', '6', 'C', '442');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('363', 'MARQUETALIA', '6', 'C', '444');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('364', 'MARULANDA', '6', 'C', '446');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('365', 'NEIRA', '6', 'C', '486');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('366', 'NORCASIA', '6', 'C', '495');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('367', 'PACORA', '6', 'C', '513');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('368', 'PALESTINA', '6', 'C', '524');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('369', 'PENSILVANIA', '6', 'C', '541');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('370', 'RIOSUCIO', '6', 'C', '614');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('371', 'RISARALDA', '6', 'C', '616');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('372', 'SALAMINA', '6', 'C', '653');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('373', 'SAMANA', '6', 'C', '662');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('374', 'SAN JOSE', '6', 'C', '665');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('375', 'SUPIA', '6', 'C', '777');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('376', 'VICTORIA', '6', 'C', '867');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('377', 'VILLAMARIA', '6', 'C', '873');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('378', 'VITERBO', '6', 'C', '877');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('379', 'FLORENCIA', '7', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('380', 'ALBANIA', '7', 'C', '029');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('381', 'BELEN DE LOS ANDAQUIES', '7', 'C', '094');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('382', 'CARTAGENA DEL CHAIRA', '7', 'C', '150');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('383', 'CURILLO', '7', 'C', '205');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('384', 'EL DONCELLO', '7', 'C', '247');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('385', 'EL PAUJIL', '7', 'C', '256');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('386', 'LA MONTAÑITA', '7', 'C', '410');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('387', 'MILAN', '7', 'C', '460');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('388', 'MORELIA', '7', 'C', '479');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('389', 'PUERTO RICO', '7', 'C', '592');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('390', 'SAN JOSE DEL FRAGUA', '7', 'C', '610');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('391', 'SAN VICENTE DEL CAGUAN', '7', 'C', '753');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('392', 'SOLANO', '7', 'C', '756');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('393', 'SOLITA', '7', 'C', '785');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('394', 'VALPARAISO', '7', 'C', '860');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('395', 'POPAYAN', '8', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('396', 'ALMAGUER', '8', 'C', '022');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('397', 'ARGELIA', '8', 'C', '050');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('398', 'BALBOA', '8', 'C', '075');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('399', 'BOLIVAR', '8', 'C', '100');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('400', 'BUENOS AIRES', '8', 'C', '110');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('401', 'CAJIBIO', '8', 'C', '130');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('402', 'CALDONO', '8', 'C', '137');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('403', 'CALOTO', '8', 'C', '142');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('404', 'CORINTO', '8', 'C', '212');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('405', 'EL TAMBO', '8', 'C', '256');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('406', 'FLORENCIA', '8', 'C', '290');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('407', 'GUACHENE', '8', 'C', '300');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('408', 'GUAPI', '8', 'C', '318');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('409', 'INZA', '8', 'C', '355');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('410', 'JAMBALO', '8', 'C', '364');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('411', 'LA SIERRA', '8', 'C', '392');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('412', 'LA VEGA', '8', 'C', '397');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('413', 'LOPEZ', '8', 'C', '418');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('414', 'MERCADERES', '8', 'C', '450');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('415', 'MIRANDA', '8', 'C', '455');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('416', 'MORALES', '8', 'C', '473');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('417', 'PADILLA', '8', 'C', '513');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('418', 'PAEZ', '8', 'C', '517');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('419', 'PATIA', '8', 'C', '532');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('420', 'PIAMONTE', '8', 'C', '533');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('421', 'PIENDAMO', '8', 'C', '548');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('422', 'PUERTO TEJADA', '8', 'C', '573');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('423', 'PURACE', '8', 'C', '585');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('424', 'ROSAS', '8', 'C', '622');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('425', 'SAN SEBASTIAN', '8', 'C', '693');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('426', 'SANTANDER DE QUILICHAO', '8', 'C', '698');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('427', 'SANTA ROSA', '8', 'C', '701');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('428', 'SILVIA', '8', 'C', '743');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('429', 'SOTARA', '8', 'C', '760');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('430', 'SUAREZ', '8', 'C', '780');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('431', 'SUCRE', '8', 'C', '785');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('432', 'TIMBIO', '8', 'C', '807');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('433', 'TIMBIQUI', '8', 'C', '809');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('434', 'TORIBIO', '8', 'C', '821');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('435', 'TOTORO', '8', 'C', '824');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('436', 'VILLA RICA', '8', 'C', '845');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('437', 'VALLEDUPAR', '9', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('438', 'AGUACHICA', '9', 'C', '011');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('439', 'AGUSTIN CODAZZI', '9', 'C', '013');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('440', 'ASTREA', '9', 'C', '032');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('441', 'BECERRIL', '9', 'C', '045');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('442', 'BOSCONIA', '9', 'C', '060');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('443', 'CHIMICHAGUA', '9', 'C', '175');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('444', 'CHIRIGUANA', '9', 'C', '178');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('445', 'CURUMANI', '9', 'C', '228');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('446', 'EL COPEY', '9', 'C', '238');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('447', 'EL PASO', '9', 'C', '250');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('448', 'GAMARRA', '9', 'C', '295');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('449', 'GONZALEZ', '9', 'C', '310');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('450', 'LA GLORIA', '9', 'C', '383');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('451', 'LA JAGUA DE IBIRICO', '9', 'C', '400');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('452', 'MANAURE', '9', 'C', '443');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('453', 'PAILITAS', '9', 'C', '517');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('454', 'PELAYA', '9', 'C', '550');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('455', 'PUEBLO BELLO', '9', 'C', '570');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('456', 'RIO DE ORO', '9', 'C', '614');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('457', 'LA PAZ', '9', 'C', '621');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('458', 'SAN ALBERTO', '9', 'C', '710');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('459', 'SAN DIEGO', '9', 'C', '750');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('460', 'SAN MARTIN', '9', 'C', '770');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('461', 'TAMALAMEQUE', '9', 'C', '787');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('462', 'MONTERIA', '10', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('463', 'AYAPEL', '10', 'C', '068');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('464', 'BUENAVISTA', '10', 'C', '079');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('465', 'CANALETE', '10', 'C', '090');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('466', 'CERETE', '10', 'C', '162');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('467', 'CHIMA', '10', 'C', '168');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('468', 'CHINU', '10', 'C', '182');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('469', 'CIENAGA DE ORO', '10', 'C', '189');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('470', 'COTORRA', '10', 'C', '300');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('471', 'LA APARTADA', '10', 'C', '350');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('472', 'LORICA', '10', 'C', '417');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('473', 'LOS CORDOBAS', '10', 'C', '419');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('474', 'MOMIL', '10', 'C', '464');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('475', 'MONTELIBANO', '10', 'C', '466');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('476', 'MOÑITOS', '10', 'C', '500');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('477', 'PLANETA RICA', '10', 'C', '555');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('478', 'PUEBLO NUEVO', '10', 'C', '570');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('479', 'PUERTO ESCONDIDO', '10', 'C', '574');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('480', 'PUERTO LIBERTADOR', '10', 'C', '580');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('481', 'PURISIMA', '10', 'C', '586');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('482', 'SAHAGUN', '10', 'C', '660');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('483', 'SAN ANDRES SOTAVENTO', '10', 'C', '670');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('484', 'SAN ANTERO', '10', 'C', '672');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('485', 'SAN BERNARDO DEL VIENTO', '10', 'C', '675');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('486', 'SAN CARLOS', '10', 'C', '678');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('487', 'SAN PELAYO', '10', 'C', '686');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('488', 'TIERRALTA', '10', 'C', '807');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('489', 'VALENCIA', '10', 'C', '855');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('490', 'AGUA DE DIOS', '11', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('491', 'ALBAN', '11', 'C', '019');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('492', 'ANAPOIMA', '11', 'C', '035');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('493', 'ANOLAIMA', '11', 'C', '040');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('494', 'ARBELAEZ', '11', 'C', '053');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('495', 'BELTRAN', '11', 'C', '086');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('496', 'BITUIMA', '11', 'C', '095');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('497', 'BOJACA', '11', 'C', '099');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('498', 'CABRERA', '11', 'C', '120');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('499', 'CACHIPAY', '11', 'C', '123');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('500', 'CAJICA', '11', 'C', '126');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('501', 'CAPARRAPI', '11', 'C', '148');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('502', 'CAQUEZA', '11', 'C', '151');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('503', 'CARMEN DE CARUPA', '11', 'C', '154');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('504', 'CHAGUANI', '11', 'C', '168');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('505', 'CHIA', '11', 'C', '175');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('506', 'CHIPAQUE', '11', 'C', '178');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('507', 'CHOACHI', '11', 'C', '181');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('508', 'CHOCONTA', '11', 'C', '183');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('509', 'COGUA', '11', 'C', '200');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('510', 'COTA', '11', 'C', '214');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('511', 'CUCUNUBA', '11', 'C', '224');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('512', 'EL COLEGIO', '11', 'C', '245');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('513', 'EL PEÑON', '11', 'C', '258');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('514', 'EL ROSAL', '11', 'C', '260');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('515', 'FACATATIVA', '11', 'C', '269');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('516', 'FOMEQUE', '11', 'C', '279');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('517', 'FOSCA', '11', 'C', '281');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('518', 'FUNZA', '11', 'C', '286');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('519', 'FUQUENE', '11', 'C', '288');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('520', 'FUSAGASUGA', '11', 'C', '290');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('521', 'GACHALA', '11', 'C', '293');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('522', 'GACHANCIPA', '11', 'C', '295');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('523', 'GACHETA', '11', 'C', '297');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('524', 'GAMA', '11', 'C', '299');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('525', 'GIRARDOT', '11', 'C', '307');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('526', 'GRANADA', '11', 'C', '312');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('527', 'GUACHETA', '11', 'C', '317');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('528', 'GUADUAS', '11', 'C', '320');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('529', 'GUASCA', '11', 'C', '322');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('530', 'GUATAQUI', '11', 'C', '324');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('531', 'GUATAVITA', '11', 'C', '326');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('532', 'GUAYABAL DE SIQUIMA', '11', 'C', '328');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('533', 'GUAYABETAL', '11', 'C', '335');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('534', 'GUTIERREZ', '11', 'C', '339');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('535', 'JERUSALEN', '11', 'C', '368');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('536', 'JUNIN', '11', 'C', '372');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('537', 'LA CALERA', '11', 'C', '377');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('538', 'LA MESA', '11', 'C', '386');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('539', 'LA PALMA', '11', 'C', '394');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('540', 'LA PEÑA', '11', 'C', '398');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('541', 'LA VEGA', '11', 'C', '402');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('542', 'LENGUAZAQUE', '11', 'C', '407');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('543', 'MACHETA', '11', 'C', '426');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('544', 'MADRID', '11', 'C', '430');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('545', 'MANTA', '11', 'C', '436');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('546', 'MEDINA', '11', 'C', '438');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('547', 'MOSQUERA', '11', 'C', '473');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('548', 'NARIÑO', '11', 'C', '483');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('549', 'NEMOCON', '11', 'C', '486');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('550', 'NILO', '11', 'C', '488');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('551', 'NIMAIMA', '11', 'C', '489');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('552', 'NOCAIMA', '11', 'C', '491');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('553', 'VENECIA', '11', 'C', '506');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('554', 'PACHO', '11', 'C', '513');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('555', 'PAIME', '11', 'C', '518');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('556', 'PANDI', '11', 'C', '524');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('557', 'PARATEBUENO', '11', 'C', '530');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('558', 'PASCA', '11', 'C', '535');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('559', 'PUERTO SALGAR', '11', 'C', '572');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('560', 'PULI', '11', 'C', '580');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('561', 'QUEBRADANEGRA', '11', 'C', '592');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('562', 'QUETAME', '11', 'C', '594');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('563', 'QUIPILE', '11', 'C', '596');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('564', 'APULO', '11', 'C', '599');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('565', 'RICAURTE', '11', 'C', '612');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('566', 'SAN ANTONIO DEL TEQUENDAMA', '11', 'C', '645');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('567', 'SAN BERNARDO', '11', 'C', '649');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('568', 'SAN CAYETANO', '11', 'C', '653');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('569', 'SAN FRANCISCO', '11', 'C', '658');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('570', 'SAN JUAN DE RIO SECO', '11', 'C', '662');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('571', 'SASAIMA', '11', 'C', '718');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('572', 'SESQUILE', '11', 'C', '736');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('573', 'SIBATE', '11', 'C', '740');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('574', 'SILVANIA', '11', 'C', '743');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('575', 'SIMIJACA', '11', 'C', '745');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('576', 'SOACHA', '11', 'C', '754');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('577', 'SOPO', '11', 'C', '758');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('578', 'SUBACHOQUE', '11', 'C', '769');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('579', 'SUESCA', '11', 'C', '772');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('580', 'SUPATA', '11', 'C', '777');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('581', 'SUSA', '11', 'C', '779');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('582', 'SUTATAUSA', '11', 'C', '781');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('583', 'TABIO', '11', 'C', '785');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('584', 'TAUSA', '11', 'C', '793');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('585', 'TENA', '11', 'C', '797');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('586', 'TENJO', '11', 'C', '799');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('587', 'TIBACUY', '11', 'C', '805');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('588', 'TIBIRITA', '11', 'C', '807');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('589', 'TOCAIMA', '11', 'C', '815');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('590', 'TOCANCIPA', '11', 'C', '817');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('591', 'TOPAIPI', '11', 'C', '823');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('592', 'UBALA', '11', 'C', '839');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('593', 'UBAQUE', '11', 'C', '841');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('594', 'VILLA DE SAN DIEGO DE UBATE', '11', 'C', '843');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('595', 'UNE', '11', 'C', '845');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('596', 'UTICA', '11', 'C', '851');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('597', 'VERGARA', '11', 'C', '862');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('598', 'VIANI', '11', 'C', '867');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('599', 'VILLAGOMEZ', '11', 'C', '871');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('600', 'VILLAPINZON', '11', 'C', '873');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('601', 'VILLETA', '11', 'C', '875');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('602', 'VIOTA', '11', 'C', '878');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('603', 'YACOPI', '11', 'C', '885');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('604', 'ZIPACON', '11', 'C', '898');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('605', 'ZIPAQUIRA', '11', 'C', '899');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('606', 'QUIBDO', '12', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('607', 'ACANDI', '12', 'C', '006');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('608', 'ALTO BAUDO', '12', 'C', '025');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('609', 'ATRATO', '12', 'C', '050');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('610', 'BAGADO', '12', 'C', '073');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('611', 'BAHIA SOLANO', '12', 'C', '075');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('612', 'BAJO BAUDO', '12', 'C', '077');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('613', 'BOJAYA', '12', 'C', '099');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('614', 'EL CANTON DEL SAN PABLO', '12', 'C', '135');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('615', 'CARMEN DEL DARIEN', '12', 'C', '150');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('616', 'CERTEGUI', '12', 'C', '160');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('617', 'CONDOTO', '12', 'C', '205');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('618', 'EL CARMEN DE ATRATO', '12', 'C', '245');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('619', 'EL LITORAL DEL SAN JUAN', '12', 'C', '250');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('620', 'ISTMINA', '12', 'C', '361');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('621', 'JURADO', '12', 'C', '372');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('622', 'LLORO', '12', 'C', '413');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('623', 'MEDIO ATRATO', '12', 'C', '425');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('624', 'MEDIO BAUDO', '12', 'C', '430');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('625', 'MEDIO SAN JUAN', '12', 'C', '450');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('626', 'NOVITA', '12', 'C', '491');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('627', 'NUQUI', '12', 'C', '495');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('628', 'RIO IRO', '12', 'C', '580');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('629', 'RIO QUITO', '12', 'C', '600');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('630', 'RIOSUCIO', '12', 'C', '615');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('631', 'SAN JOSE DEL PALMAR', '12', 'C', '660');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('632', 'SIPI', '12', 'C', '745');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('633', 'TADO', '12', 'C', '787');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('634', 'UNGUIA', '12', 'C', '800');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('635', 'UNION PANAMERICANA', '12', 'C', '810');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('636', 'NEIVA', '13', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('637', 'ACEVEDO', '13', 'C', '006');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('638', 'AGRADO', '13', 'C', '013');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('639', 'AIPE', '13', 'C', '016');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('640', 'ALGECIRAS', '13', 'C', '020');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('641', 'ALTAMIRA', '13', 'C', '026');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('642', 'BARAYA', '13', 'C', '078');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('643', 'CAMPOALEGRE', '13', 'C', '132');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('644', 'COLOMBIA', '13', 'C', '206');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('645', 'ELIAS', '13', 'C', '244');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('646', 'GARZON', '13', 'C', '298');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('647', 'GIGANTE', '13', 'C', '306');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('648', 'GUADALUPE', '13', 'C', '319');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('649', 'HOBO', '13', 'C', '349');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('650', 'IQUIRA', '13', 'C', '357');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('651', 'ISNOS', '13', 'C', '359');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('652', 'LA ARGENTINA', '13', 'C', '378');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('653', 'LA PLATA', '13', 'C', '396');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('654', 'NATAGA', '13', 'C', '483');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('655', 'OPORAPA', '13', 'C', '503');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('656', 'PAICOL', '13', 'C', '518');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('657', 'PALERMO', '13', 'C', '524');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('658', 'PALESTINA', '13', 'C', '530');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('659', 'PITAL', '13', 'C', '548');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('660', 'PITALITO', '13', 'C', '551');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('661', 'RIVERA', '13', 'C', '615');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('662', 'SALADOBLANCO', '13', 'C', '660');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('663', 'SAN AGUSTIN', '13', 'C', '668');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('664', 'SANTA MARIA', '13', 'C', '676');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('665', 'SUAZA', '13', 'C', '770');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('666', 'TARQUI', '13', 'C', '791');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('667', 'TESALIA', '13', 'C', '797');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('668', 'TELLO', '13', 'C', '799');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('669', 'TERUEL', '13', 'C', '801');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('670', 'TIMANA', '13', 'C', '807');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('671', 'VILLAVIEJA', '13', 'C', '872');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('672', 'YAGUARA', '13', 'C', '885');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('673', 'RIOHACHA', '14', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('674', 'ALBANIA', '14', 'C', '035');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('675', 'BARRANCAS', '14', 'C', '078');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('676', 'DIBULLA', '14', 'C', '090');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('677', 'DISTRACCION', '14', 'C', '098');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('678', 'EL MOLINO', '14', 'C', '110');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('679', 'FONSECA', '14', 'C', '279');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('680', 'HATONUEVO', '14', 'C', '378');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('681', 'LA JAGUA DEL PILAR', '14', 'C', '420');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('682', 'MAICAO', '14', 'C', '430');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('683', 'MANAURE', '14', 'C', '560');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('684', 'SAN JUAN DEL CESAR', '14', 'C', '650');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('685', 'URIBIA', '14', 'C', '847');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('686', 'URUMITA', '14', 'C', '855');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('687', 'VILLANUEVA', '14', 'C', '874');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('688', 'SANTA MARTA', '15', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('689', 'ALGARROBO', '15', 'C', '030');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('690', 'ARACATACA', '15', 'C', '053');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('691', 'ARIGUANI', '15', 'C', '058');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('692', 'CERRO SAN ANTONIO', '15', 'C', '161');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('693', 'CHIBOLO', '15', 'C', '170');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('694', 'CIENAGA', '15', 'C', '189');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('695', 'CONCORDIA', '15', 'C', '205');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('696', 'EL BANCO', '15', 'C', '245');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('697', 'EL PIÑON', '15', 'C', '258');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('698', 'EL RETEN', '15', 'C', '268');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('699', 'FUNDACION', '15', 'C', '288');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('700', 'GUAMAL', '15', 'C', '318');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('701', 'NUEVA GRANADA', '15', 'C', '460');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('702', 'PEDRAZA', '15', 'C', '541');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('703', 'PIJIÑO DEL CARMEN', '15', 'C', '545');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('704', 'PIVIJAY', '15', 'C', '551');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('705', 'PLATO', '15', 'C', '555');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('706', 'PUEBLOVIEJO', '15', 'C', '570');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('707', 'REMOLINO', '15', 'C', '605');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('708', 'SABANAS DE SAN ANGEL', '15', 'C', '660');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('709', 'SALAMINA', '15', 'C', '675');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('710', 'SAN SEBASTIAN DE BUENAVISTA', '15', 'C', '692');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('711', 'SAN ZENON', '15', 'C', '703');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('712', 'SANTA ANA', '15', 'C', '707');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('713', 'SANTA BARBARA DE PINTO', '15', 'C', '720');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('714', 'SITIONUEVO', '15', 'C', '745');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('715', 'TENERIFE', '15', 'C', '798');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('716', 'ZAPAYAN', '15', 'C', '960');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('717', 'ZONA BANANERA', '15', 'C', '980');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('718', 'VILLAVICENCIO', '16', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('719', 'ACACIAS', '16', 'C', '006');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('720', 'BARRANCA DE UPIA', '16', 'C', '110');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('721', 'CABUYARO', '16', 'C', '124');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('722', 'CASTILLA LA NUEVA', '16', 'C', '150');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('723', 'CUBARRAL', '16', 'C', '223');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('724', 'CUMARAL', '16', 'C', '226');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('725', 'EL CALVARIO', '16', 'C', '245');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('726', 'EL CASTILLO', '16', 'C', '251');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('727', 'EL DORADO', '16', 'C', '270');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('728', 'FUENTE DE ORO', '16', 'C', '287');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('729', 'GRANADA', '16', 'C', '313');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('730', 'GUAMAL', '16', 'C', '318');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('731', 'MAPIRIPAN', '16', 'C', '325');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('732', 'MESETAS', '16', 'C', '330');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('733', 'LA MACARENA', '16', 'C', '350');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('734', 'URIBE', '16', 'C', '370');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('735', 'LEJANIAS', '16', 'C', '400');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('736', 'PUERTO CONCORDIA', '16', 'C', '450');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('737', 'PUERTO GAITAN', '16', 'C', '568');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('738', 'PUERTO LOPEZ', '16', 'C', '573');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('739', 'PUERTO LLERAS', '16', 'C', '577');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('740', 'PUERTO RICO', '16', 'C', '590');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('741', 'RESTREPO', '16', 'C', '606');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('742', 'SAN CARLOS DE GUAROA', '16', 'C', '680');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('743', 'SAN JUAN DE ARAMA', '16', 'C', '683');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('744', 'SAN JUANITO', '16', 'C', '686');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('745', 'SAN MARTIN', '16', 'C', '689');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('746', 'VISTAHERMOSA', '16', 'C', '711');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('747', 'PASTO', '17', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('748', 'ALBAN', '17', 'C', '019');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('749', 'ALDANA', '17', 'C', '022');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('750', 'ANCUYA', '17', 'C', '036');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('751', 'ARBOLEDA', '17', 'C', '051');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('752', 'BARBACOAS', '17', 'C', '079');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('753', 'BELEN', '17', 'C', '083');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('754', 'BUESACO', '17', 'C', '110');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('755', 'COLON', '17', 'C', '203');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('756', 'CONSACA', '17', 'C', '207');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('757', 'CONTADERO', '17', 'C', '210');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('758', 'CORDOBA', '17', 'C', '215');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('759', 'CUASPUD', '17', 'C', '224');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('760', 'CUMBAL', '17', 'C', '227');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('761', 'CUMBITARA', '17', 'C', '233');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('762', 'CHACHAGsI', '17', 'C', '240');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('763', 'EL CHARCO', '17', 'C', '250');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('764', 'EL PEÑOL', '17', 'C', '254');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('765', 'EL ROSARIO', '17', 'C', '256');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('766', 'EL TABLON DE GOMEZ', '17', 'C', '258');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('767', 'EL TAMBO', '17', 'C', '260');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('768', 'FUNES', '17', 'C', '287');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('769', 'GUACHUCAL', '17', 'C', '317');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('770', 'GUAITARILLA', '17', 'C', '320');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('771', 'GUALMATAN', '17', 'C', '323');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('772', 'ILES', '17', 'C', '352');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('773', 'IMUES', '17', 'C', '354');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('774', 'IPIALES', '17', 'C', '356');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('775', 'LA CRUZ', '17', 'C', '378');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('776', 'LA FLORIDA', '17', 'C', '381');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('777', 'LA LLANADA', '17', 'C', '385');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('778', 'LA TOLA', '17', 'C', '390');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('779', 'LA UNION', '17', 'C', '399');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('780', 'LEIVA', '17', 'C', '405');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('781', 'LINARES', '17', 'C', '411');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('782', 'LOS ANDES', '17', 'C', '418');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('783', 'MAGsI', '17', 'C', '427');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('784', 'MALLAMA', '17', 'C', '435');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('785', 'MOSQUERA', '17', 'C', '473');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('786', 'NARIÑO', '17', 'C', '480');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('787', 'OLAYA HERRERA', '17', 'C', '490');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('788', 'OSPINA', '17', 'C', '506');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('789', 'FRANCISCO PIZARRO', '17', 'C', '520');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('790', 'POLICARPA', '17', 'C', '540');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('791', 'POTOSI', '17', 'C', '560');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('792', 'PROVIDENCIA', '17', 'C', '565');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('793', 'PUERRES', '17', 'C', '573');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('794', 'PUPIALES', '17', 'C', '585');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('795', 'RICAURTE', '17', 'C', '612');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('796', 'ROBERTO PAYAN', '17', 'C', '621');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('797', 'SAMANIEGO', '17', 'C', '678');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('798', 'SANDONA', '17', 'C', '683');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('799', 'SAN BERNARDO', '17', 'C', '685');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('800', 'SAN LORENZO', '17', 'C', '687');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('801', 'SAN PABLO', '17', 'C', '693');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('802', 'SAN PEDRO DE CARTAGO', '17', 'C', '694');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('803', 'SANTA BARBARA', '17', 'C', '696');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('804', 'SANTACRUZ', '17', 'C', '699');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('805', 'SAPUYES', '17', 'C', '720');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('806', 'TAMINANGO', '17', 'C', '786');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('807', 'TANGUA', '17', 'C', '788');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('808', 'SAN ANDRES DE TUMACO', '17', 'C', '835');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('809', 'TUQUERRES', '17', 'C', '838');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('810', 'YACUANQUER', '17', 'C', '885');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('811', 'CUCUTA', '18', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('812', 'ABREGO', '18', 'C', '003');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('813', 'ARBOLEDAS', '18', 'C', '051');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('814', 'BOCHALEMA', '18', 'C', '099');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('815', 'BUCARASICA', '18', 'C', '109');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('816', 'CACOTA', '18', 'C', '125');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('817', 'CACHIRA', '18', 'C', '128');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('818', 'CHINACOTA', '18', 'C', '172');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('819', 'CHITAGA', '18', 'C', '174');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('820', 'CONVENCION', '18', 'C', '206');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('821', 'CUCUTILLA', '18', 'C', '223');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('822', 'DURANIA', '18', 'C', '239');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('823', 'EL CARMEN', '18', 'C', '245');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('824', 'EL TARRA', '18', 'C', '250');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('825', 'EL ZULIA', '18', 'C', '261');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('826', 'GRAMALOTE', '18', 'C', '313');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('827', 'HACARI', '18', 'C', '344');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('828', 'HERRAN', '18', 'C', '347');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('829', 'LABATECA', '18', 'C', '377');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('830', 'LA ESPERANZA', '18', 'C', '385');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('831', 'LA PLAYA', '18', 'C', '398');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('832', 'LOS PATIOS', '18', 'C', '405');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('833', 'LOURDES', '18', 'C', '418');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('834', 'MUTISCUA', '18', 'C', '480');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('835', 'OCAÑA', '18', 'C', '498');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('836', 'PAMPLONA', '18', 'C', '518');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('837', 'PAMPLONITA', '18', 'C', '520');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('838', 'PUERTO SANTANDER', '18', 'C', '553');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('839', 'RAGONVALIA', '18', 'C', '599');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('840', 'SALAZAR', '18', 'C', '660');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('841', 'SAN CALIXTO', '18', 'C', '670');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('842', 'SAN CAYETANO', '18', 'C', '673');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('843', 'SANTIAGO', '18', 'C', '680');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('844', 'SARDINATA', '18', 'C', '720');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('845', 'SILOS', '18', 'C', '743');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('846', 'TEORAMA', '18', 'C', '800');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('847', 'TIBU', '18', 'C', '810');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('848', 'TOLEDO', '18', 'C', '820');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('849', 'VILLA CARO', '18', 'C', '871');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('850', 'VILLA DEL ROSARIO', '18', 'C', '874');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('851', 'ARMENIA', '19', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('852', 'BUENAVISTA', '19', 'C', '111');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('853', 'CALARCA', '19', 'C', '130');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('854', 'CIRCASIA', '19', 'C', '190');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('855', 'CORDOBA', '19', 'C', '212');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('856', 'FILANDIA', '19', 'C', '272');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('857', 'GENOVA', '19', 'C', '302');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('858', 'LA TEBAIDA', '19', 'C', '401');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('859', 'MONTENEGRO', '19', 'C', '470');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('860', 'PIJAO', '19', 'C', '548');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('861', 'QUIMBAYA', '19', 'C', '594');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('862', 'SALENTO', '19', 'C', '690');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('863', 'PEREIRA', '20', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('864', 'APIA', '20', 'C', '045');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('865', 'BALBOA', '20', 'C', '075');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('866', 'BELEN DE UMBRIA', '20', 'C', '088');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('867', 'DOSQUEBRADAS', '20', 'C', '170');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('868', 'GUATICA', '20', 'C', '318');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('869', 'LA CELIA', '20', 'C', '383');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('870', 'LA VIRGINIA', '20', 'C', '400');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('871', 'MARSELLA', '20', 'C', '440');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('872', 'MISTRATO', '20', 'C', '456');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('873', 'PUEBLO RICO', '20', 'C', '572');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('874', 'QUINCHIA', '20', 'C', '594');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('875', 'SANTA ROSA DE CABAL', '20', 'C', '682');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('876', 'SANTUARIO', '20', 'C', '687');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('877', 'BUCARAMANGA', '21', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('878', 'AGUADA', '21', 'C', '013');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('879', 'ALBANIA', '21', 'C', '020');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('880', 'ARATOCA', '21', 'C', '051');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('881', 'BARBOSA', '21', 'C', '077');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('882', 'BARICHARA', '21', 'C', '079');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('883', 'BARRANCABERMEJA', '21', 'C', '081');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('884', 'BETULIA', '21', 'C', '092');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('885', 'BOLIVAR', '21', 'C', '101');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('886', 'CABRERA', '21', 'C', '121');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('887', 'CALIFORNIA', '21', 'C', '132');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('888', 'CAPITANEJO', '21', 'C', '147');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('889', 'CARCASI', '21', 'C', '152');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('890', 'CEPITA', '21', 'C', '160');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('891', 'CERRITO', '21', 'C', '162');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('892', 'CHARALA', '21', 'C', '167');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('893', 'CHARTA', '21', 'C', '169');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('894', 'CHIMA', '21', 'C', '176');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('895', 'CHIPATA', '21', 'C', '179');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('896', 'CIMITARRA', '21', 'C', '190');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('897', 'CONCEPCION', '21', 'C', '207');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('898', 'CONFINES', '21', 'C', '209');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('899', 'CONTRATACION', '21', 'C', '211');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('900', 'COROMORO', '21', 'C', '217');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('901', 'CURITI', '21', 'C', '229');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('902', 'EL CARMEN DE CHUCURI', '21', 'C', '235');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('903', 'EL GUACAMAYO', '21', 'C', '245');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('904', 'EL PEÑON', '21', 'C', '250');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('905', 'EL PLAYON', '21', 'C', '255');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('906', 'ENCINO', '21', 'C', '264');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('907', 'ENCISO', '21', 'C', '266');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('908', 'FLORIAN', '21', 'C', '271');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('909', 'FLORIDABLANCA', '21', 'C', '276');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('910', 'GALAN', '21', 'C', '296');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('911', 'GAMBITA', '21', 'C', '298');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('912', 'GIRON', '21', 'C', '307');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('913', 'GUACA', '21', 'C', '318');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('914', 'GUADALUPE', '21', 'C', '320');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('915', 'GUAPOTA', '21', 'C', '322');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('916', 'GUAVATA', '21', 'C', '324');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('917', 'GsEPSA', '21', 'C', '327');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('918', 'HATO', '21', 'C', '344');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('919', 'JESUS MARIA', '21', 'C', '368');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('920', 'JORDAN', '21', 'C', '370');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('921', 'LA BELLEZA', '21', 'C', '377');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('922', 'LANDAZURI', '21', 'C', '385');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('923', 'LA PAZ', '21', 'C', '397');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('924', 'LEBRIJA', '21', 'C', '406');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('925', 'LOS SANTOS', '21', 'C', '418');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('926', 'MACARAVITA', '21', 'C', '425');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('927', 'MALAGA', '21', 'C', '432');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('928', 'MATANZA', '21', 'C', '444');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('929', 'MOGOTES', '21', 'C', '464');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('930', 'MOLAGAVITA', '21', 'C', '468');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('931', 'OCAMONTE', '21', 'C', '498');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('932', 'OIBA', '21', 'C', '500');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('933', 'ONZAGA', '21', 'C', '502');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('934', 'PALMAR', '21', 'C', '522');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('935', 'PALMAS DEL SOCORRO', '21', 'C', '524');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('936', 'PARAMO', '21', 'C', '533');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('937', 'PIEDECUESTA', '21', 'C', '547');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('938', 'PINCHOTE', '21', 'C', '549');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('939', 'PUENTE NACIONAL', '21', 'C', '572');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('940', 'PUERTO PARRA', '21', 'C', '573');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('941', 'PUERTO WILCHES', '21', 'C', '575');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('942', 'RIONEGRO', '21', 'C', '615');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('943', 'SABANA DE TORRES', '21', 'C', '655');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('944', 'SAN ANDRES', '21', 'C', '669');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('945', 'SAN BENITO', '21', 'C', '673');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('946', 'SAN GIL', '21', 'C', '679');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('947', 'SAN JOAQUIN', '21', 'C', '682');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('948', 'SAN JOSE DE MIRANDA', '21', 'C', '684');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('949', 'SAN MIGUEL', '21', 'C', '686');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('950', 'SAN VICENTE DE CHUCURI', '21', 'C', '689');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('951', 'SANTA BARBARA', '21', 'C', '705');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('952', 'SANTA HELENA DEL OPON', '21', 'C', '720');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('953', 'SIMACOTA', '21', 'C', '745');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('954', 'SOCORRO', '21', 'C', '755');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('955', 'SUAITA', '21', 'C', '770');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('956', 'SUCRE', '21', 'C', '773');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('957', 'SURATA', '21', 'C', '780');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('958', 'TONA', '21', 'C', '820');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('959', 'VALLE DE SAN JOSE', '21', 'C', '855');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('960', 'VELEZ', '21', 'C', '861');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('961', 'VETAS', '21', 'C', '867');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('962', 'VILLANUEVA', '21', 'C', '872');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('963', 'ZAPATOCA', '21', 'C', '895');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('964', 'SINCELEJO', '22', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('965', 'BUENAVISTA', '22', 'C', '110');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('966', 'CAIMITO', '22', 'C', '124');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('967', 'COLOSO', '22', 'C', '204');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('968', 'COROZAL', '22', 'C', '215');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('969', 'COVEÑAS', '22', 'C', '221');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('970', 'CHALAN', '22', 'C', '230');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('971', 'EL ROBLE', '22', 'C', '233');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('972', 'GALERAS', '22', 'C', '235');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('973', 'GUARANDA', '22', 'C', '265');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('974', 'LA UNION', '22', 'C', '400');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('975', 'LOS PALMITOS', '22', 'C', '418');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('976', 'MAJAGUAL', '22', 'C', '429');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('977', 'MORROA', '22', 'C', '473');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('978', 'OVEJAS', '22', 'C', '508');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('979', 'PALMITO', '22', 'C', '523');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('980', 'SAMPUES', '22', 'C', '670');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('981', 'SAN BENITO ABAD', '22', 'C', '678');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('982', 'SAN JUAN DE BETULIA', '22', 'C', '702');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('983', 'SAN MARCOS', '22', 'C', '708');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('984', 'SAN ONOFRE', '22', 'C', '713');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('985', 'SAN PEDRO', '22', 'C', '717');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('986', 'SAN LUIS DE SINCE', '22', 'C', '742');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('987', 'SUCRE', '22', 'C', '771');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('988', 'SANTIAGO DE TOLU', '22', 'C', '820');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('989', 'TOLU VIEJO', '22', 'C', '823');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('990', 'IBAGUE', '23', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('991', 'ALPUJARRA', '23', 'C', '024');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('992', 'ALVARADO', '23', 'C', '026');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('993', 'AMBALEMA', '23', 'C', '030');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('994', 'ANZOATEGUI', '23', 'C', '043');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('995', 'ARMERO', '23', 'C', '055');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('996', 'ATACO', '23', 'C', '067');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('997', 'CAJAMARCA', '23', 'C', '124');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('998', 'CARMEN DE APICALA', '23', 'C', '148');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('999', 'CASABIANCA', '23', 'C', '152');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1000', 'CHAPARRAL', '23', 'C', '168');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1001', 'COELLO', '23', 'C', '200');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1002', 'COYAIMA', '23', 'C', '217');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1003', 'CUNDAY', '23', 'C', '226');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1004', 'DOLORES', '23', 'C', '236');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1005', 'ESPINAL', '23', 'C', '268');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1006', 'FALAN', '23', 'C', '270');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1007', 'FLANDES', '23', 'C', '275');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1008', 'FRESNO', '23', 'C', '283');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1009', 'GUAMO', '23', 'C', '319');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1010', 'HERVEO', '23', 'C', '347');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1011', 'HONDA', '23', 'C', '349');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1012', 'ICONONZO', '23', 'C', '352');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1013', 'LERIDA', '23', 'C', '408');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1014', 'LIBANO', '23', 'C', '411');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1015', 'MARIQUITA', '23', 'C', '443');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1016', 'MELGAR', '23', 'C', '449');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1017', 'MURILLO', '23', 'C', '461');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1018', 'NATAGAIMA', '23', 'C', '483');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1019', 'ORTEGA', '23', 'C', '504');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1020', 'PALOCABILDO', '23', 'C', '520');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1021', 'PIEDRAS', '23', 'C', '547');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1022', 'PLANADAS', '23', 'C', '555');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1023', 'PRADO', '23', 'C', '563');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1024', 'PURIFICACION', '23', 'C', '585');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1025', 'RIOBLANCO', '23', 'C', '616');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1026', 'RONCESVALLES', '23', 'C', '622');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1027', 'ROVIRA', '23', 'C', '624');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1028', 'SALDAÑA', '23', 'C', '671');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1029', 'SAN ANTONIO', '23', 'C', '675');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1030', 'SAN LUIS', '23', 'C', '678');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1031', 'SANTA ISABEL', '23', 'C', '686');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1032', 'SUAREZ', '23', 'C', '770');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1033', 'VALLE DE SAN JUAN', '23', 'C', '854');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1034', 'VENADILLO', '23', 'C', '861');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1035', 'VILLAHERMOSA', '23', 'C', '870');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1036', 'VILLARRICA', '23', 'C', '873');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1037', 'CALI', '24', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1038', 'ALCALA', '24', 'C', '020');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1039', 'ANDALUCIA', '24', 'C', '036');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1040', 'ANSERMANUEVO', '24', 'C', '041');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1041', 'ARGELIA', '24', 'C', '054');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1042', 'BOLIVAR', '24', 'C', '100');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1043', 'BUENAVENTURA', '24', 'C', '109');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1044', 'GUADALAJARA DE BUGA', '24', 'C', '111');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1045', 'BUGALAGRANDE', '24', 'C', '113');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1046', 'CAICEDONIA', '24', 'C', '122');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1047', 'CALIMA', '24', 'C', '126');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1048', 'CANDELARIA', '24', 'C', '130');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1049', 'CARTAGO', '24', 'C', '147');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1050', 'DAGUA', '24', 'C', '233');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1051', 'EL AGUILA', '24', 'C', '243');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1052', 'EL CAIRO', '24', 'C', '246');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1053', 'EL CERRITO', '24', 'C', '248');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1054', 'EL DOVIO', '24', 'C', '250');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1055', 'FLORIDA', '24', 'C', '275');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1056', 'GINEBRA', '24', 'C', '306');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1057', 'GUACARI', '24', 'C', '318');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1058', 'JAMUNDI', '24', 'C', '364');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1059', 'LA CUMBRE', '24', 'C', '377');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1060', 'LA UNION', '24', 'C', '400');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1061', 'LA VICTORIA', '24', 'C', '403');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1062', 'OBANDO', '24', 'C', '497');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1063', 'PALMIRA', '24', 'C', '520');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1064', 'PRADERA', '24', 'C', '563');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1065', 'RESTREPO', '24', 'C', '606');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1066', 'RIOFRIO', '24', 'C', '616');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1067', 'ROLDANILLO', '24', 'C', '622');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1068', 'SAN PEDRO', '24', 'C', '670');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1069', 'SEVILLA', '24', 'C', '736');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1070', 'TORO', '24', 'C', '823');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1071', 'TRUJILLO', '24', 'C', '828');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1072', 'TULUA', '24', 'C', '834');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1073', 'ULLOA', '24', 'C', '845');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1074', 'VERSALLES', '24', 'C', '863');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1075', 'VIJES', '24', 'C', '869');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1076', 'YOTOCO', '24', 'C', '890');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1077', 'YUMBO', '24', 'C', '892');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1078', 'ZARZAL', '24', 'C', '895');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1079', 'ARAUCA', '25', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1080', 'ARAUQUITA', '25', 'C', '065');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1081', 'CRAVO NORTE', '25', 'C', '220');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1082', 'FORTUL', '25', 'C', '300');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1083', 'PUERTO RONDON', '25', 'C', '591');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1084', 'SARAVENA', '25', 'C', '736');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1085', 'TAME', '25', 'C', '794');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1086', 'YOPAL', '26', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1087', 'AGUAZUL', '26', 'C', '010');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1088', 'CHAMEZA', '26', 'C', '015');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1089', 'HATO COROZAL', '26', 'C', '125');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1090', 'LA SALINA', '26', 'C', '136');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1091', 'MANI', '26', 'C', '139');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1092', 'MONTERREY', '26', 'C', '162');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1093', 'NUNCHIA', '26', 'C', '225');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1094', 'OROCUE', '26', 'C', '230');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1095', 'PAZ DE ARIPORO', '26', 'C', '250');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1096', 'PORE', '26', 'C', '263');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1097', 'RECETOR', '26', 'C', '279');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1098', 'SABANALARGA', '26', 'C', '300');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1099', 'SACAMA', '26', 'C', '315');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1100', 'SAN LUIS DE PALENQUE', '26', 'C', '325');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1101', 'TAMARA', '26', 'C', '400');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1102', 'TAURAMENA', '26', 'C', '410');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1103', 'TRINIDAD', '26', 'C', '430');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1104', 'VILLANUEVA', '26', 'C', '440');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1105', 'MOCOA', '27', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1106', 'COLON', '27', 'C', '219');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1107', 'ORITO', '27', 'C', '320');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1108', 'PUERTO ASIS', '27', 'C', '568');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1109', 'PUERTO CAICEDO', '27', 'C', '569');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1110', 'PUERTO GUZMAN', '27', 'C', '571');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1111', 'LEGUIZAMO', '27', 'C', '573');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1112', 'SIBUNDOY', '27', 'C', '749');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1113', 'SAN FRANCISCO', '27', 'C', '755');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1114', 'SAN MIGUEL', '27', 'C', '757');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1115', 'SANTIAGO', '27', 'C', '760');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1116', 'VALLE DEL GUAMUEZ', '27', 'C', '865');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1117', 'VILLAGARZON', '27', 'C', '885');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1118', 'SAN ANDRES', '28', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1119', 'PROVIDENCIA', '28', 'C', '564');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1120', 'LETICIA', '29', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1121', 'EL ENCANTO', '29', 'C', '263');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1122', 'LA CHORRERA', '29', 'C', '405');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1123', 'LA PEDRERA', '29', 'C', '407');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1124', 'LA VICTORIA', '29', 'C', '430');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1125', 'MIRITI - PARANA', '29', 'C', '460');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1126', 'PUERTO ALEGRIA', '29', 'C', '530');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1127', 'PUERTO ARICA', '29', 'C', '536');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1128', 'PUERTO NARIÑO', '29', 'C', '540');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1129', 'PUERTO SANTANDER', '29', 'C', '669');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1130', 'TARAPACA', '29', 'C', '798');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1131', 'INIRIDA', '30', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1132', 'BARRANCO MINAS', '30', 'C', '343');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1133', 'MAPIRIPANA', '30', 'C', '663');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1134', 'SAN FELIPE', '30', 'C', '883');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1135', 'PUERTO COLOMBIA', '30', 'C', '884');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1136', 'LA GUADALUPE', '30', 'C', '885');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1137', 'CACAHUAL', '30', 'C', '886');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1138', 'PANA PANA', '30', 'C', '887');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1139', 'MORICHAL', '30', 'C', '888');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1140', 'SAN JOSE DEL GUAVIARE', '31', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1141', 'CALAMAR', '31', 'C', '015');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1142', 'EL RETORNO', '31', 'C', '025');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1143', 'MIRAFLORES', '31', 'C', '200');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1144', 'MITU', '32', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1145', 'CARURU', '32', 'C', '161');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1146', 'PACOA', '32', 'C', '511');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1147', 'TARAIRA', '32', 'C', '666');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1148', 'PAPUNAUA', '32', 'C', '777');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1149', 'YAVARATE', '32', 'C', '889');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1150', 'PUERTO CARREÑO', '33', 'C', '001');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1151', 'LA PRIMAVERA', '33', 'C', '524');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1152', 'SANTA ROSALIA', '33', 'C', '624');
INSERT INTO cav_Dpto_Ciudad (`Id`, `nombre`, `id_ciudad`, `tipo`, `codigo_dane`) VALUES ('1153', 'CUMARIBO', '33', 'C', '773');