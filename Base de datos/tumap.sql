/* CREACION DE LA BASE DE DATOS */

CREATE SCHEMA `tumap` DEFAULT CHARACTER SET utf8;
USE `tumap`;

/*Código que deben correr en workbeanch 8*/
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '12345';


/*************************************************************
    TABLAS DE USUARIOS Y ROL
**************************************************************/

/*Crear tabla rol*/
create table rol (id int not null primary key auto_increment , namerol varchar(20) not null );
insert into rol (namerol) values ('usuario');
insert into rol (namerol) values ('admin');

/*Crear usuarios*/
create table users (id int not null primary key auto_increment , nameuser varchar(20) not null,
password varchar(20) not null , email varchar(60) not null, id_rol int not null, foreign key (id_rol) references rol (id)
 );

 /*Insertar datos*/
insert into users (nameuser, password, email, id_rol) values ('nrodriguez', '1234', 'nrodriguez@sena.edu.co', 1);
insert into users (nameuser, password, email, id_rol) values ('cvergara', '1234', 'nrodriguez@sena.edu.co', 2);
insert into users (nameuser, password, email, id_rol) values ('juanherrera', '1234', 'jcherreraa@sena.edu.co', 1);
insert into users (nameuser, password, email, id_rol) values ('davidr', '1234', 'davidreyes@sena.edu.co', 1);
insert into users (nameuser, password, email, id_rol) values ('scamacho', '1234', 'secamacho5@misena.edu.co', 1);
insert into users (nameuser, password, email, id_rol) values ('fsanchez', '1234', 'fsanchez@misena.edu.co', 1);

/*************************************************************
    FIN TABLAS INVENTARIO DE USUARIOS Y ROL
**************************************************************/

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

/***********************************************************************
    TABLAS DBO
************************************************************************/
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

/*************************************************************
    FIN TABLAS DB0
**************************************************************/

/*************************************************************
    INICIO TABLAS EDUCACION
**************************************************************/
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
-- Table `tumap`.`fys_registro_info`
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
-- Table `tumap`.`fys_administrador`
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
-- Table `tumap`.`fys_validar_info`
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

/*************************************************************
    FIN TABLAS EDUCACION
**************************************************************/

/*************************************************************
    BASE DE DATOS DE VIAS JF
**************************************************************/

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

/*************************************************************
    FIN BASE DE DATOS DE VIAS JF
**************************************************************/

/*************************************************************
    TABLAS INVENTARIO DE SUELOS
**************************************************************/

CREATE TABLE IM_REGISTROS (
ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
NOMBRE_PROPIETARIO VARCHAR(45),
NOMBRE_PREDIO VARCHAR(45),
AREA VARCHAR(45) NOT NULL,
DIRECCION VARCHAR(45) NOT NULL
);

CREATE TABLE IM_TIPO_USOS (
ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
DESCRIPCION VARCHAR(45) NOT NULL,
HEX VARCHAR(10) NOT NULL
);
CREATE TABLE IM_USOS_PREDIO (
ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
POLIGONO JSON NOT NULL,
ID_REGISTRO INT NOT NULL
);
ALTER TABLE IM_USOS_PREDIO ADD FOREIGN KEY (ID_REGISTRO) REFERENCES IM_REGISTROS(ID);

insert into im_tipo_usos (DESCRIPCION, HEX) values('Construida', '#F56E04'),('Cultivo','#20B000'),('Ganadería','#B00000'),
('Reserva','#E7EE05'),('Común','#BABABA');

/*************************************************************
    FIN TABLAS INVENTARIO DE SUELOS
**************************************************************/

/*************************************************************
    BASE DE DATOS DE HYDRICO/ETNOBOTANICO
**************************************************************/
CREATE TABLE IF NOT EXISTS `tumap`.`users_hidrico` (
  `id_User` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL,
  `lastname` VARCHAR(40) NOT NULL,
  `identification_card` INT(11) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  `Rol_idRol` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_User`),
  INDEX `fk_Users_Rol_idx` (`Rol_idRol` ASC) ,
  CONSTRAINT `fk_Users_Rol`
    FOREIGN KEY (`Rol_idRol`)
    REFERENCES `tumap`.`rol` (`id_Rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tumap`.`connections`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tumap`.`connections` (
  `id_Connections` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(500) NULL DEFAULT NULL,
  `image` VARCHAR(500) NULL DEFAULT NULL,
  `Users_id_User` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Connections`),
  INDEX `fk_Conexiones_Users1_idx` (`Users_id_User` ASC) ,
  CONSTRAINT `fk_Conexiones_Users1`
    FOREIGN KEY (`Users_id_User`)
    REFERENCES `tumap`.`users_hidrico` (`id_User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tumap`.`coverages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tumap`.`coverages` (
  `id_Coverage` INT(11) NOT NULL AUTO_INCREMENT,
  `color` ENUM('Café', 'Amarillo', 'blanca', 'Incoloro') NULL DEFAULT NULL,
  `pressure` ENUM('Alta', 'Media', 'Baja') NULL DEFAULT NULL,
  `type` ENUM('Intermitente', 'Permanente') NULL DEFAULT NULL,
  `Users_id_User` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Coverage`),
  INDEX `fk_Cobertura_Users1_idx` (`Users_id_User` ASC) ,
  CONSTRAINT `fk_Cobertura_Users1`
    FOREIGN KEY (`Users_id_User`)
    REFERENCES `tumap`.`users_hidrico` (`id_User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tumap`.`ethnobotany`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tumap`.`ethnobotany` (
  `id_Ethnobotany` INT(11) NOT NULL AUTO_INCREMENT,
  `common_name` VARCHAR(50) NOT NULL,
  `image` VARCHAR(500) NULL DEFAULT NULL,
  `use` ENUM('Medicinal', 'Alimenticia', 'Decorativa') NULL DEFAULT NULL,
  `users_id_User` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Ethnobotany`),
  INDEX `fk_Ethnobotany_users1_idx` (`users_id_User` ASC) ,
  CONSTRAINT `fk_Ethnobotany_users1`
    FOREIGN KEY (`users_id_User`)
    REFERENCES `tumap`.`users_hidrico` (`id_User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tumap`.`grown`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tumap`.`grown` (
  `id_Grown` INT(11) NOT NULL AUTO_INCREMENT,
  `level` ENUM('Nivel Media', 'Nivel alto') NULL DEFAULT NULL,
  `Users_id_User` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Grown`),
  INDEX `fk_Crecidas_Users1_idx` (`Users_id_User` ASC) ,
  CONSTRAINT `fk_Crecidas_Users1`
    FOREIGN KEY (`Users_id_User`)
    REFERENCES `tumap`.`users_hidrico` (`id_User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tumap`.`location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tumap`.`location` (
  `id_Location` INT(11) NOT NULL AUTO_INCREMENT,
  `ubicacion` LONGTEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_bin' NULL DEFAULT NULL,
  `users_id_User` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Location`),
  INDEX `fk_location_users1_idx` (`users_id_User` ASC) ,
  CONSTRAINT `fk_location_users1`
    FOREIGN KEY (`users_id_User`)
    REFERENCES `tumap`.`users_hidrico` (`id_User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tumap`.`sheddings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tumap`.`sheddings` (
  `id_Sheddings` INT(11) NOT NULL AUTO_INCREMENT,
  `liq_description` VARCHAR(500) NULL DEFAULT NULL,
  `img_liq` VARCHAR(500) NULL DEFAULT NULL,
  `solid_descripcion` VARCHAR(500) NULL DEFAULT NULL,
  `img_solid` VARCHAR(500) NULL DEFAULT NULL,
  `Users_id_User` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Sheddings`),
  INDEX `fk_Vertimientos_Users1_idx` (`Users_id_User` ASC) ,
  CONSTRAINT `fk_Vertimientos_Users1`
    FOREIGN KEY (`Users_id_User`)
    REFERENCES `tumap`.`users_hidrico` (`id_User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `tumap`.`without_coverage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tumap`.`without_coverage` (
  `id_Without_coverage` INT(11) NOT NULL AUTO_INCREMENT,
  `state` ENUM('Suspensión', 'Corte', 'Nunca he tenido el servicio') NULL DEFAULT NULL,
  `Users_id_User` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Without_coverage`),
  INDEX `fk_Sin_cobertura_Users1_idx` (`Users_id_User` ASC) ,
  CONSTRAINT `fk_Sin_cobertura_Users1`
    FOREIGN KEY (`Users_id_User`)
    REFERENCES `tumap`.`users_hidrico` (`id_User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


INSERT INTO `tumap`.`rol` (`name_description`) VALUES ('Administrador');
INSERT INTO `tumap`.`rol` (`name_description`) VALUES ('Usuario');

INSERT INTO `tumap`.`users_hidrico` (`name`, `lastname`, `identification_card`, `email`, `Rol_idRol`) VALUES ('Usuario 1', 'ApellidoUser4', '10120291', 'asdas@gmail.com', '2');
INSERT INTO `tumap`.`users_hidrico` (`name`, `lastname`, `identification_card`, `email`, `Rol_idRol`) VALUES ('Usuario 2', 'ApellidoUser5', '1092019210', 'kgkgfl@gmail.com', '2');
INSERT INTO `tumap`.`users_hidrico` (`name`, `lastname`, `identification_card`, `email`, `Rol_idRol`) VALUES ('Usuario 3', 'ApellidoUser6', '109201921', 'kgkgfl@gmail.com', '2');

INSERT INTO `tumap`.`connections` (`description`, `image`, `Users_id_User`) VALUES ('cualquierDescriocion va en este lado', 'jansdjansdjImage', '1');
INSERT INTO `tumap`.`connections` (`description`, `image`, `Users_id_User`) VALUES ('cualquierDescriocion2 va en este lado', 'jansdjansdjImage', '2');

INSERT INTO `tumap`.`coverages` (`color`, `pressure`, `type`, `Users_id_User`) VALUES ('blanca', 'Media', 'Permanente', '1');
INSERT INTO `tumap`.`coverages` (`color`, `pressure`, `type`, `Users_id_User`) VALUES ('Amarillo', 'Alta', 'Intermitente', '2');

INSERT INTO `tumap`.`ethnobotany` (`common_name`, `image`, `use`, `users_id_User`) VALUES ('Yerbas Frescas', 'asdasdasd', 'Alimenticia', '1');
INSERT INTO `tumap`.`ethnobotany` (`common_name`, `image`, `use`, `users_id_User`) VALUES ('Yerbas Frescas2', 'asdasdasdsd', 'Medicinal', '2');

INSERT INTO `tumap`.`grown` (`level`, `Users_id_User`) VALUES ('Nivel alto', '1');
INSERT INTO `tumap`.`grown` (`level`, `Users_id_User`) VALUES ('Nivel Media', '2');

INSERT INTO `tumap`.`sheddings` (`liq_description`, `img_liq`, `solid_descripcion`, `img_solid`, `Users_id_User`) VALUES ('Descripcion Liquida2', 'asdasdasdasd', 'Solido Descripcion 2', 'asdasdasd', '1');
INSERT INTO `tumap`.`sheddings` (`liq_description`, `img_liq`, `solid_descripcion`, `img_solid`, `Users_id_User`) VALUES ('Descriocion Liquida3', 'asdasds', 'Solido Descripcion 3', 'asdasdasd', '2');

INSERT INTO `tumap`.`location` (`ubicacion`, `users_id_User`) VALUES ('Location Lat, Long', '1');
INSERT INTO `tumap`.`location` (`ubicacion`, `users_id_User`) VALUES ('Location Lat, Long', '2');

INSERT INTO `tumap`.`without_coverage` (`state`, `Users_id_User`) VALUES ('Nunca he tenido el servicio', '1');
INSERT INTO `tumap`.`without_coverage` (`state`, `Users_id_User`) VALUES ('Suspensión', '2');


/*************************************************************
    FIN TABLAS HYDRICO/ETNOBOTANICO
**************************************************************/