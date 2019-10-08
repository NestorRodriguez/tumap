-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hidrico
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hidrico
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hidrico` DEFAULT CHARACTER SET latin1 ;
USE `hidrico` ;

-- -----------------------------------------------------
-- Table `hidrico`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hidrico`.`rol` (
  `id_Rol` INT(11) NOT NULL AUTO_INCREMENT,
  `name_description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Rol`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hidrico`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hidrico`.`users` (
  `id_User` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL,
  `lastname` VARCHAR(40) NOT NULL,
  `identification_card` INT(11) NOT NULL,
  `email` VARCHAR(40) NOT NULL,
  `Rol_idRol` INT(11) NOT NULL,
  PRIMARY KEY (`id_User`),
  INDEX `fk_Users_Rol_idx` (`Rol_idRol` ASC) VISIBLE,
  CONSTRAINT `fk_Users_Rol`
    FOREIGN KEY (`Rol_idRol`)
    REFERENCES `hidrico`.`rol` (`id_Rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hidrico`.`connections`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hidrico`.`connections` (
  `id_Connections` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(500) NULL DEFAULT NULL,
  `image` VARCHAR(500) NULL DEFAULT NULL,
  `Users_id_User` INT(11) NOT NULL,
  PRIMARY KEY (`id_Connections`),
  INDEX `fk_Conexiones_Users1_idx` (`Users_id_User` ASC) VISIBLE,
  CONSTRAINT `fk_Conexiones_Users1`
    FOREIGN KEY (`Users_id_User`)
    REFERENCES `hidrico`.`users` (`id_User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hidrico`.`coverages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hidrico`.`coverages` (
  `id_Coverage` INT(11) NOT NULL AUTO_INCREMENT,
  `color` ENUM('Café', 'Amarillo', 'blanca', 'Incoloro') NULL DEFAULT NULL,
  `other_color` VARCHAR(30) NULL DEFAULT NULL,
  `pressure` ENUM('Alta', 'Media', 'Baja') NULL DEFAULT NULL,
  `type` ENUM('Intermitente', 'Permanente') NULL DEFAULT NULL,
  `Users_id_User` INT(11) NOT NULL,
  PRIMARY KEY (`id_Coverage`),
  INDEX `fk_Cobertura_Users1_idx` (`Users_id_User` ASC) VISIBLE,
  CONSTRAINT `fk_Cobertura_Users1`
    FOREIGN KEY (`Users_id_User`)
    REFERENCES `hidrico`.`users` (`id_User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hidrico`.`ethnobotany`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hidrico`.`ethnobotany` (
  `id_Ethnobotany` INT(11) NOT NULL AUTO_INCREMENT,
  `common_name` VARCHAR(50) NOT NULL,
  `image` VARCHAR(500) NULL DEFAULT NULL,
  `use` ENUM('Medicinal', 'Alimenticia', 'Decorativa') NULL DEFAULT NULL,
  `users_id_User` INT(11) NOT NULL,
  PRIMARY KEY (`id_Ethnobotany`),
  INDEX `fk_Ethnobotany_users1_idx` (`users_id_User` ASC) VISIBLE,
  CONSTRAINT `fk_Ethnobotany_users1`
    FOREIGN KEY (`users_id_User`)
    REFERENCES `hidrico`.`users` (`id_User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hidrico`.`grown`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hidrico`.`grown` (
  `id_Grown` INT(11) NOT NULL AUTO_INCREMENT,
  `level` ENUM('Nivel Media', 'Nivel alto') NULL DEFAULT NULL,
  `Users_id_User` INT(11) NOT NULL,
  PRIMARY KEY (`id_Grown`),
  INDEX `fk_Crecidas_Users1_idx` (`Users_id_User` ASC) VISIBLE,
  CONSTRAINT `fk_Crecidas_Users1`
    FOREIGN KEY (`Users_id_User`)
    REFERENCES `hidrico`.`users` (`id_User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hidrico`.`sheddings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hidrico`.`sheddings` (
  `id_Sheddings` INT(11) NOT NULL AUTO_INCREMENT,
  `liq_description` VARCHAR(500) NULL DEFAULT NULL,
  `img_liq` VARCHAR(500) NULL DEFAULT NULL,
  `solid_descripcion` VARCHAR(500) NULL DEFAULT NULL,
  `img_solid` VARCHAR(500) NULL DEFAULT NULL,
  `Users_id_User` INT(11) NOT NULL,
  PRIMARY KEY (`id_Sheddings`),
  INDEX `fk_Vertimientos_Users1_idx` (`Users_id_User` ASC) VISIBLE,
  CONSTRAINT `fk_Vertimientos_Users1`
    FOREIGN KEY (`Users_id_User`)
    REFERENCES `hidrico`.`users` (`id_User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hidrico`.`without_coverage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hidrico`.`without_coverage` (
  `id_Without_coverage` INT(11) NOT NULL AUTO_INCREMENT,
  `state` ENUM('Suspensión', 'Corte', 'Nunca he tenido el servicio') NULL DEFAULT NULL,
  `Users_id_User` INT(11) NOT NULL,
  PRIMARY KEY (`id_Without_coverage`),
  INDEX `fk_Sin_cobertura_Users1_idx` (`Users_id_User` ASC) VISIBLE,
  CONSTRAINT `fk_Sin_cobertura_Users1`
    FOREIGN KEY (`Users_id_User`)
    REFERENCES `hidrico`.`users` (`id_User`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
