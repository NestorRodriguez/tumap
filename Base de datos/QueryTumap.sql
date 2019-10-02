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

CREATE TABLE `irs_estados_redes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `irs_inventarios_otros` (
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

CREATE TABLE `irs_inventarios_postes` (
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

CREATE TABLE `irs_materiales_postes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `irs_operadores_celulares` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `logotipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `irs_tipos_redes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `icono` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
