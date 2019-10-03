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
insert into users (nameuser, password, email, id_rol) values ('nrodriguez', '1234', 'nrodriguez@sena.edu.co', 1);
insert into users (nameuser, password, email, id_rol) values ('nrodriguez', '1234', 'nrodriguez@sena.edu.co', 2);

/*Código que deben correr en workbeanch 8*/
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345';  
  
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

select * from users;

select * from fys_registro_info;

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
  `fecha` date not NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `irs_inventarios_otros` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  `id_irs_estado_red` int(10) unsigned NOT NULL,
  `numero_empresa` varchar(30) DEFAULT NULL,
  `id_irs_operador` int(10) unsigned DEFAULT NULL,
  `ubicacion` json NOT NULL,
  `imagen` varchar(150) DEFAULT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  `id_irs_operador_celular` int(10) unsigned DEFAULT NULL,
  `id_irs_estado_red_celular` int(10) unsigned DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `ip` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `irs_materiales_postes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `irs_operadores_celulares` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `logotipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `irs_tipos_redes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `icono` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `irs_estados_redes` (`nombre`) VALUES ('Bueno'), ('Regular'), ('Malo');
INSERT INTO `irs_materiales_postes` (`nombre`) VALUES ('Concreto'), ('Madera'), ('Metal');
INSERT INTO `irs_operadores_celulares` (`nombre`, `logotipo`) VALUES ('Claro', 'claro.svg'), ('Movistar', 'movistar.svg'), ('Tigo', 'tigo.svg'), ('Avantel', 'avantel.svg');
INSERT INTO `irs_tipos_redes` (`nombre`, `icono`) VALUES ('Postes', 'postes.svg'), ('Torres', 'torres.svg'), ('Antenas', 'antenas.svg'), ('Armarios', 'armarios.svg');

--*********************************************************************************************************
-- Fin Tablas Inventarios Redes Secas --
--*********************************************************************************************************

/*Crear tabla encuesta social*/
create table SEC_Encuesta_Social(
	id_Encuesta int not null auto_increment primary key, 
    Vinculo_Territorial varchar (10) not null
   );
   /*insertar datos en encuesta social*/
INSERT INTO SEC_Encuesta_Social (Vinculo_Territorial)
	VALUES ('vivo');
	INSERT INTO SEC_Encuesta_Social (Vinculo_Territorial)
	VALUES ('trabajo');
    INSERT INTO SEC_Encuesta_Social (Vinculo_Territorial)
	VALUES ('ambos');

/*Crear tabla necesidades basicas*/
create table SEC_Necesidades_Basicas(
	id_Necesidades int not null auto_increment primary key, 
    Nombre_Necesidad varchar (20) not null
    );
/*insertar datos en necesidades basicas*/
INSERT INTO SEC_Necesidades_Basicas (Nombre_Necesidad)
	VALUES ('alimentacion');
    INSERT INTO SEC_Necesidades_Basicas (Nombre_Necesidad)
	VALUES ('seguridad');
    INSERT INTO SEC_Necesidades_Basicas (Nombre_Necesidad)
	VALUES ('servicios publicos');
    INSERT INTO SEC_Necesidades_Basicas (Nombre_Necesidad)
	VALUES ('transporte');
    
    /*Crear tabla encuesta necesidades*/
create table SEC_Encuesta_Necesidades(
	id_EN int not null auto_increment primary key,
    Importancia int not null,
    id_Encuesta int not null, foreign key (id_Encuesta) references SEC_Encuesta_Social(id_Encuesta),
    id_Necesidades int not null, foreign key (id_Necesidades) references SEC_Necesidades_Basicas(id_Necesidades)
    );
    /*insertar datos en encuesta necesidades*/
		/*Encuesta 1*/
        INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (1, 1, 4);
		INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (1, 2, 3);
		INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (1, 3, 2);
        INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (1, 4, 1);
        /*Encuesta 2*/
        INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (2, 1, 1);
		INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (2, 2, 2);
		INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (2, 3, 3);
        INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (2, 4, 4);
        /*Encuesta 3*/
        INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (3, 1, 2);
		INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (3, 2, 4);
		INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (3, 3, 1);
        INSERT INTO SEC_Encuesta_Necesidades (id_Encuesta, id_Necesidades, Importancia)
		VALUES (3, 4, 3);
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