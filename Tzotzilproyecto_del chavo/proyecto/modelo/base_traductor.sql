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
  `area` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_area`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_tr`.`usuarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `base_tr`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT ,
  `usuario` VARCHAR(45) NOT NULL ,
  `pass` VARCHAR(45) NOT NULL ,
  `area_id_area` INT NOT NULL ,
  PRIMARY KEY (`id_usuario`) ,
  INDEX `fk_usuarios_area1_idx` (`area_id_area` ASC) ,
  CONSTRAINT `fk_usuarios_area1`
    FOREIGN KEY (`area_id_area` )
    REFERENCES `base_tr`.`areas` (`id_area` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_tr`.`frases_esp`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `base_tr`.`frases_esp` (
  `id_frase_esp` INT NOT NULL AUTO_INCREMENT ,
  `frase_esp` VARCHAR(200) NOT NULL ,
  PRIMARY KEY (`id_frase_esp`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_tr`.`frases_tzo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `base_tr`.`frases_tzo` (
  `id_frase_tzo` INT NOT NULL AUTO_INCREMENT ,
  `frase_tzo` VARCHAR(200) NOT NULL ,
  `frases_esp_id_frase_esp` INT NOT NULL ,
  PRIMARY KEY (`id_frase_tzo`) ,
  INDEX `fk_frases_tzo_frases_esp1_idx` (`frases_esp_id_frase_esp` ASC) ,
  CONSTRAINT `fk_frases_tzo_frases_esp1`
    FOREIGN KEY (`frases_esp_id_frase_esp` )
    REFERENCES `base_tr`.`frases_esp` (`id_frase_esp` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_tr`.`palabras_esp`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `base_tr`.`palabras_esp` (
  `id_palabras_eso` INT NOT NULL AUTO_INCREMENT ,
  `palabra_esp` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id_palabras_eso`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_tr`.`palabras_tzo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `base_tr`.`palabras_tzo` (
  `id_palabras_tzo` INT NOT NULL AUTO_INCREMENT ,
  `palabra_tzo` VARCHAR(100) NOT NULL ,
  `palabras_esp_id_palabras_eso` INT NOT NULL ,
  PRIMARY KEY (`id_palabras_tzo`) ,
  INDEX `fk_palabras_tzo_palabras_esp1_idx` (`palabras_esp_id_palabras_eso` ASC) ,
  CONSTRAINT `fk_palabras_tzo_palabras_esp1`
    FOREIGN KEY (`palabras_esp_id_palabras_eso` )
    REFERENCES `base_tr`.`palabras_esp` (`id_palabras_eso` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_tr`.`frases_por_area`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `base_tr`.`frases_por_area` (
  `frases_esp_id_frase_esp` INT NOT NULL ,
  `area_id_area` INT NOT NULL ,
  PRIMARY KEY (`frases_esp_id_frase_esp`, `area_id_area`) ,
  INDEX `fk_frases_esp_has_area_area1_idx` (`area_id_area` ASC) ,
  INDEX `fk_frases_esp_has_area_frases_esp1_idx` (`frases_esp_id_frase_esp` ASC) ,
  CONSTRAINT `fk_frases_esp_has_area_frases_esp1`
    FOREIGN KEY (`frases_esp_id_frase_esp` )
    REFERENCES `base_tr`.`frases_esp` (`id_frase_esp` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_frases_esp_has_area_area1`
    FOREIGN KEY (`area_id_area` )
    REFERENCES `base_tr`.`areas` (`id_area` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_tr`.`admin`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `base_tr`.`admin` (
  `id_admin` INT NOT NULL AUTO_INCREMENT ,
  `usuario_admin` VARCHAR(45) NOT NULL ,
  `pass_admin` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_admin`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



INSERT INTO areas VALUES (0, "Pediatría");
INSERT INTO areas VALUES (0, "Traumatología");

INSERT INTO usuarios VALUES (0, "Doctor David", "qaz", 1);
INSERT INTO usuarios VALUES (0, "Doctor Memo", "qaz", 2);

INSERT INTO admin VALUES (0, "admin", "qaz");