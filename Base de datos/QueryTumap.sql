CREATE DATABASE IF NOT EXISTS tumap ;

USE tumap ;

-- -----------------------------------------------------
-- Table `tumap`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tumap`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NULL,
  `edad` INT NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `nivel_educativo` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `tumap`.`registro_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tumap`.`registro_info` (
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
    REFERENCES `tumap`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `tumap`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tumap`.`administrador` (
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
CREATE TABLE IF NOT EXISTS `tumap`.`validar_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `validado` BOOLEAN,
  `fecha_validacion` DATE NOT NULL,
  `id_registro_info` INT NOT NULL,
  `id_administrador` INT NOT NULL,
  PRIMARY KEY (`id`, `id_registro_info`, `id_administrador`),
  CONSTRAINT `fk_validar_info_registro_info1`
    FOREIGN KEY (`id_registro_info`)
    REFERENCES `tumap`.`registro_info` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_validar_info_administrador1`
    FOREIGN KEY (`id_administrador`)
    REFERENCES `tumap`.`administrador` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



select * from validar_info;

INSERT INTO usuarios (nombres,apellidos,edad,sexo,nivel_educativo,correo,clave)
values ('Sara','Camacho Albarracin','20','F','Tecnologo','saritacamachoa77@gmail.com','12345');

INSERT INTO usuarios (nombres,apellidos,edad,sexo,nivel_educativo,correo,clave)
values ('Fredy','Sanchez','24','M','Tecnologo','tareastrabajos@hotmail.com','78910');

select * from usuarios;





set @g = 'POINT(4.474022 -74.087073)';
INSERT INTO registro_info (nombre_institucion,ubicacion,foto,referencias_aledanas,tipos_formacion,especificacion,pagina_web,telefonos,id_usuario)
values ('SENA',ST_PointFromText(@g),'imagenes/sena','cerca al rio','Educación Superior','Tecnicos,Tecnologos,Especializaciones y Cursos Cortos','www.sena.com','0314451114',1);

set @e = 'POINT(4.477934 -74.104971)';
INSERT INTO registro_info (nombre_institucion,ubicacion,foto,referencias_aledanas,tipos_formacion,especificacion,pagina_web,telefonos,id_usuario)
values ('Colegio Rural El Uval',ST_PointFromText(@e),'imagenes/coelgio','cerca a la planta de tratamiento','Educación Basica','Desde transición hasta grado noveno','www.colegioeluval.com','0317614733',2);

INSERT INTO administrador (nombres,apellidos,celular,usuario,clave)
values ('Pepito','Perez','3105623415','AdminUno','12345');

INSERT INTO administrador (nombres,apellidos,celular,usuario,clave)
values ('Juanita','Gomez','3105685963','AdminDos','78910');

INSERT INTO validar_info (validado,fecha_validacion,id_registro_info,id_administrador)
values (1,'2019-09-29',1,1);

INSERT INTO validar_info (validado,fecha_validacion,id_registro_info,id_administrador)
values (2,'2019-09-29',2,2);

select * from usuarios;

select * from registro_info;

select * from administrador;

select * from validar_info;


