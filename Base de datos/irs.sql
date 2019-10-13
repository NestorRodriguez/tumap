/*
=======================================================================
TABLAS PARA INVENTARIO DE REDES SECAS
=======================================================================
*/

/* Creación de las tablas */
CREATE TABLE `irs_estados_redes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `irs_inventarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` varchar(10) NOT NULL,
  `clase_poste` VARCHAR(10) NULL DEFAULT NULL,
  `id_irs_material` int(10) unsigned NOT NULL,
  `identificador` varchar(20) DEFAULT NULL,
  `tiene_lampara` varchar(1) DEFAULT NULL,
  `tiene_transformador` varchar(1) DEFAULT NULL,
  `id_irs_operador` int(10) unsigned DEFAULT NULL,
  `id_irs_estado_red` int(10) unsigned NOT NULL,
  `ubicacion` json NOT NULL,
  `imagen` text NOT NULL,
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
  `tipo` varchar(10) NOT NULL,
  `icono` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* Datos de las tablas */
INSERT INTO irs_estados_redes (nombre) VALUES ('Bueno'), ('Regular'), ('Malo');
INSERT INTO irs_materiales_postes (nombre) VALUES ('Concreto'), ('Madera'), ('Metal');
INSERT INTO irs_operadores_celulares (nombre) VALUES ('Claro'), ('Movistar'), ('Tigo'), ('Avantel'), ('ETB'), ('Virgin'), ('UFF');
INSERT INTO irs_tipos_redes (nombre, tipo, icono) VALUES ('Postes', 'POSTE', 'irs-postes.svg'), ('Torres', 'TORRE', 'irs-torres.svg'), ('Antenas', 'ANTENA', 'irs-antenas.svg'), ('Armarios', 'ARMARIO', 'irs-armarios.svg');

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

/*
=======================================================================
FIN TABLAS PARA INVENTARIO DE REDES SECAS
=======================================================================
*/