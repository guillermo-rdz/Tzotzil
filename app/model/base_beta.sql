DROP DATABASE IF EXISTS base_tr;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `base_tr` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `base_tr` ;

-- -----------------------------------------------------
-- Table `base_tr`.`areas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `base_tr`.`areas` (
  `id_area` INT NOT NULL AUTO_INCREMENT ,
  `area` VARCHAR(45) NOT NULL COMMENT 'admin(a), normal(n)' ,
  `rango` VARCHAR(1) NOT NULL ,
  PRIMARY KEY (`id_area`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_tr`.`usuarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `base_tr`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT ,
  `usuario` VARCHAR(45) NOT NULL ,
  `pass` VARCHAR(45) NOT NULL ,
  `rango` VARCHAR(45) NOT NULL ,
  `area_id_area` INT NOT NULL ,
  PRIMARY KEY (`id_usuario`) ,
  INDEX `fk_usuarios_area1_idx` (`area_id_area` ASC) ,
  CONSTRAINT `fk_usuarios_area1`
    FOREIGN KEY (`area_id_area` )
    REFERENCES `base_tr`.`areas` (`id_area` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_tr`.`frases`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `base_tr`.`frases` (
  `id_frase` INT NOT NULL AUTO_INCREMENT ,
  `frase_esp` VARCHAR(200) NOT NULL ,
  `frase_tzo` VARCHAR(200) NOT NULL ,
  `tipo_frase` CHAR(2) NOT NULL COMMENT 'Pregunta protocolaria(P), asculltación(A), diagnostico(D), Ascultacion2(A2) Ascultacion3(A3)' ,
  `areas_id_area` INT NOT NULL ,
  `frases_id_frase` INT NULL DEFAULT NULL ,
  PRIMARY KEY (`id_frase`) ,
  INDEX `fk_frases_esp_areas1_idx` (`areas_id_area` ASC) ,
  INDEX `fk_frases_frases1_idx` (`frases_id_frase` ASC) ,
  CONSTRAINT `fk_frases_esp_areas1`
    FOREIGN KEY (`areas_id_area` )
    REFERENCES `base_tr`.`areas` (`id_area` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_frases_frases1`
    FOREIGN KEY (`frases_id_frase` )
    REFERENCES `base_tr`.`frases` (`id_frase` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
