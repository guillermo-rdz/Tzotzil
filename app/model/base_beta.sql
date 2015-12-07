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
  `rango` VARCHAR(45) NOT NULL ,
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
-- Table `base_tr`.`frases`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `base_tr`.`frases` (
  `id_frase_esp` INT NOT NULL AUTO_INCREMENT ,
  `frase_esp` VARCHAR(200) NOT NULL ,
  `frase_tzo` VARCHAR(200) NOT NULL ,
  `tipo_frase` CHAR(1) NOT NULL COMMENT 'Pregunta protocolaria(P), asculltación(A), diagnostico(D)' ,
  `areas_id_area` INT NOT NULL ,
  PRIMARY KEY (`id_frase_esp`) ,
  INDEX `fk_frases_esp_areas1_idx` (`areas_id_area` ASC) ,
  CONSTRAINT `fk_frases_esp_areas1`
    FOREIGN KEY (`areas_id_area` )
    REFERENCES `base_tr`.`areas` (`id_area` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `base_tr`.`frases_has_frases`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `base_tr`.`frases_has_frases` (
  `frases_id_frase_esp` INT NOT NULL ,
  `frases_id_frase_esp1` INT NOT NULL ,
  PRIMARY KEY (`frases_id_frase_esp`, `frases_id_frase_esp1`) ,
  INDEX `fk_frases_has_frases_frases2_idx` (`frases_id_frase_esp1` ASC) ,
  INDEX `fk_frases_has_frases_frases1_idx` (`frases_id_frase_esp` ASC) ,
  CONSTRAINT `fk_frases_has_frases_frases1`
    FOREIGN KEY (`frases_id_frase_esp` )
    REFERENCES `base_tr`.`frases` (`id_frase_esp` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_frases_has_frases_frases2`
    FOREIGN KEY (`frases_id_frase_esp1` )
    REFERENCES `base_tr`.`frases` (`id_frase_esp` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO areas VALUES (0, "Admin");
INSERT INTO areas VALUES (0, "Pediatría");
INSERT INTO areas VALUES (0, "Traumatología");

INSERT INTO usuarios VALUES (0, "admin", "qaz", 1, 1);
INSERT INTO usuarios VALUES (0, "Doctor_David", "qaz", 2, 2);
INSERT INTO usuarios VALUES (0, "Doctor_Memo", "qaz", 2, 3);


#Traumatología
INSERT INTO frases VALUES(0, "¿Cuándo inicio con el problema?", "K’usi k’ak’alil ti lik ipajané", "p", 2);

