/* CREACION DE LA BASE DE DATOS */

CREATE SCHEMA `tumap` DEFAULT CHARACTER SET utf8;
USE `tumap`;

/*************************************************************
    TABLAS INVENTARIO DE REDES SECAS
**************************************************************/

CREATE TABLE `irs_estados_redes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `irs_inventarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(10) NOT NULL,
  `clase_poste` varchar(10) DEFAULT NULL,
  `id_irs_material` int(10) unsigned DEFAULT NULL,
  `identificador` varchar(20) DEFAULT NULL,
  `tiene_lampara` varchar(1) DEFAULT NULL,
  `tiene_transformador` varchar(1) DEFAULT NULL,
  `id_irs_operador` int(10) unsigned DEFAULT NULL,
  `id_irs_estado_red` int(10) unsigned NOT NULL,
  `ubicacion` json NOT NULL,
  `imagen` longtext NOT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `id_irs_operador_celular` int(10) unsigned DEFAULT NULL,
  `id_irs_estado_red_celular` int(10) unsigned DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `ip` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `irs_materiales_postes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `irs_operadores_celulares` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `logotipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `irs_tipos_redes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `icono` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE VIEW `irs_inventarios_totales` AS
SELECT
	i.id,
    i.tipo,
    i.clase_poste,
    ma.nombre AS material,
    i.identificador,
    i.tiene_lampara AS lampara,
    i.tiene_transformador AS transformador,
    oc.nombre AS operador,
    er.nombre AS estado,
    i.ubicacion,
    i.imagen,
    i.id_usuario,
    eo.nombre AS encuesta_operador,
    sr.nombre AS encuesta_estado,
    i.fecha,
    i.ip
FROM irs_inventarios i
LEFT JOIN irs_materiales_postes ma ON i.id_irs_material = ma.id
LEFT JOIN irs_operadores_celulares oc ON i.id_irs_operador = oc.id
LEFT JOIN irs_estados_redes er ON i.id_irs_estado_red = er.id
LEFT JOIN irs_operadores_celulares eo ON i.id_irs_operador_celular = eo.id
LEFT JOIN irs_estados_redes sr ON i.id_irs_estado_red_celular = sr.id;


/* DATOS DE LAS TABLAS */
INSERT INTO irs_estados_redes (nombre) VALUES ('Bueno'), ('Regular'), ('Malo');
INSERT INTO irs_materiales_postes (nombre) VALUES ('Concreto'), ('Madera'), ('Metal');
INSERT INTO irs_operadores_celulares (nombre) VALUES ('Claro'), ('Movistar'), ('Tigo'), ('Avantel'), ('ETB'), ('Virgin'), ('UFF');
INSERT INTO irs_tipos_redes (nombre, icono) VALUES ('Postes', 'irs-postes.svg'), ('Torres', 'irs-torres.svg'), ('Antenas', 'irs-antenas.svg'), ('Armarios', 'irs-armarios.svg');



/*************************************************************
    FIN TABLAS INVENTARIO DE REDES SECAS
**************************************************************/


-- ***********************************************************************
-- inicio DBO 
-- Generated: 2019-09-29 10:59
-- Project: suelos
-- Author: Divier Castaneda -- Diego Duarte
-- ***********************************************************************
-- **********Se puede copiar completa y ejecutar en sql*******************
-- ************************************************************************
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `tumap` DEFAULT CHARACTER SET utf8 ;
use tumap;

DROP TABLE IF EXISTS `tumap`.`dbo_incripcionPregunta`;
DROP TABLE IF EXISTS `tumap`.`dbo_respuesta`;
DROP TABLE IF EXISTS `tumap`.`dbo_pregunta` ;
DROP TABLE IF EXISTS `tumap`.`dbo_inscripcion`; 
DROP TABLE IF EXISTS `tumap`.`dbo_imagen`;


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
  `departamento` VARCHAR(45) NULL DEFAULT NULL,
  `municipio` VARCHAR(45) NULL DEFAULT NULL,
   `lat` VARCHAR(45) NULL DEFAULT NULL,
   `lng` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(80) NULL DEFAULT NULL,
  `usuario` VARCHAR(45) NULL DEFAULT NULL,
  `fecha` timestamp default current_timestamp ,
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
	dbo_inscripcion.lat,
  dbo_inscripcion.lng,
	dbo_inscripcion.departamento,  
	dbo_inscripcion.municipio, 
	dbo_inscripcion.fecha,
	dbo_pregunta.pregunta,
	dbo_imagen.nombre as imagen
	from dbo_inscripcion
	inner join dbo_respuesta on dbo_respuesta.id_inscripcion = dbo_inscripcion.id
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

/* dbo_pregunta*/
INSERT INTO `tumap`.`dbo_pregunta` (`orden`, `pregunta`) VALUES ('1', '¿Hay presencia de cobertura vegetal en la zona?');
INSERT INTO `tumap`.`dbo_pregunta` (`orden`, `pregunta`) VALUES ('2', '¿Qué tipo de vegetación se encuentra en el terreno?');
INSERT INTO `tumap`.`dbo_pregunta` (`orden`, `pregunta`) VALUES ('3', '¿Qué se puede observar en la superficie del suelo?');
INSERT INTO `tumap`.`dbo_pregunta` (`orden`, `pregunta`) VALUES ('4', '¿Cuál es el color del suelo?');

INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES (1, 1, '', 'assets/dbo_img/imagen11.jpg');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('1', '2', '', 'assets/dbo_img/imagen12.jpg');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('2', '1', 'Pasto y maleza', 'assets/dbo_img/imagen21.jpg');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('2', '2', 'Muchos arbustos', 'assets/dbo_img/imagen22.jpg');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('2', '3', 'Presencia de arboles', 'assets/dbo_img/imagen23.jpg');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('3', '1', 'Tierra oscura', 'assets/dbo_img/imagen31.jpg');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('3', '2', 'Suelo arcilloso o arenoso', 'assets/dbo_img/imagen32.jpg');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('3', '3', 'Roca', 'assets/dbo_img/imagen33.jpg');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('4', '1', 'Colores claros', 'assets/dbo_img/imagen41.jpg');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('4', '2', 'Negra o oscura', 'assets/dbo_img/imagen42.jpg');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('4', '3', 'Rojiza', 'assets/dbo_img/imagen43.jpg');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('4', '4', 'Amarillento', 'assets/dbo_img/imagen44.jpg');
INSERT INTO `tumap`.`dbo_imagen` (`id_pregunta`, `orden`, `nombre`, `ruta`) VALUES ('4', '5', 'Grisaceo', 'assets/dbo_img/imagen45.jpg');

INSERT INTO `tumap`.`dbo_inscripcion` (`documento`, `nombre`, `lat`,`lng`, `direccion`, `departamento`, `municipio`, `fecha`) VALUES ('11', 'nombre1 apellido1', '4.60972222222', '-74.0816666667','CL 1 CXRA XXX', 'Cundinamarca', 'Soacha', CURDATE());

INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('1', '1', '1');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('1', '2', '3');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('1', '3', '6');
INSERT INTO `tumap`.`dbo_respuesta` (`id_inscripcion`, `id_pregunta`, `id_imagen`) VALUES ('1', '4', '13');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- *********************************************************************************************************
-- fin DBO --
-- *********************************************************************************************************

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
    id_detalle_via int not null,
		foreign key (id_detalle_via) references jf_detalle_via(id),
	imagen varchar(200),
    id_estado int not null,
		foreign key (id_estado) references jf_estado(id)
);
/*DML*/
/*CRUD tabla jf_detalle_via*/
insert into jf_detalle_via (detalle)
	values ('Mal estado'),('Mantenimiento'),('Via cerrada');
/*CRUD tabla jf_estado*/
insert into jf_estado(estado)
	values ('En espera'),('Aprobado'),('No aprobado');
