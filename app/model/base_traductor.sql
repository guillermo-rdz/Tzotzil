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


#Traumatología
INSERT INTO frases_esp VALUES(0, "¿Cuándo inicio con el problema?", 1);
INSERT INTO frases_esp VALUES(0, "¿Qué tiempo tiene? (hrs)", 1);
INSERT INTO frases_esp VALUES(0, "¿Qué tratamiento ya le dieron?", 1);
INSERT INTO frases_esp VALUES(0, "¿Con qué médicos ha ido/o asistido?", 1);

INSERT INTO frases_tzo VALUES(0, "K’usi k’ak’alil ti lik ipajané", 1);
INSERT INTO frases_tzo VALUES(0, "Jayim xa k’ak’al ti ipoté", 2);
INSERT INTO frases_tzo VALUES(0, "K’usi poxilal laj yakboxuk", 3);
INSERT INTO frases_tzo VALUES(0, "Buch’u las k’eloxuk", 4);


#Pediatría
INSERT INTO frases_esp VALUES(0, "¿Qué le paso?", 2);
INSERT INTO frases_esp VALUES(0, "¿Qué paso? (se puede decir que es lo mismo ¿Qué le pasó?)", 2);
INSERT INTO frases_esp VALUES(0, "¿A qué horas sucedió?", 2);
INSERT INTO frases_esp VALUES(0, "¿Cuántos días lleva?", 2);
INSERT INTO frases_esp VALUES(0, "¿Acudió ya aun curandero o sobandero?", 2);
INSERT INTO frases_esp VALUES(0, "¿Le han medido la temperatura? Si / no", 2);
INSERT INTO frases_esp VALUES(0, "¿Cuánto de temperatura tiene?", 2);
INSERT INTO frases_esp VALUES(0, "¿Siente dolor? Si / no", 2);
INSERT INTO frases_esp VALUES(0, "¿Qué tan intenso es el dolor?", 2);
INSERT INTO frases_esp VALUES(0, "¿Nivel o región donde le duele?", 2);
INSERT INTO frases_esp VALUES(0, "¿Qué tiempo tiene?", 2);
INSERT INTO frases_esp VALUES(0, "¿Ya le dieron algún tratamiento?", 2);

INSERT INTO frases_tzo VALUES(0, "Kúsi la pas", 5);
INSERT INTO frases_tzo VALUES(0, "K’usi la pas", 6);
INSERT INTO frases_tzo VALUES(0, "Jayim ora ech’", 7);
INSERT INTO frases_tzo VALUES(0, "Jayim xa sk’ak’alil jechot", 8);
INSERT INTO frases_tzo VALUES(0, "La vak’ xa aba ta k’elel yu’un jun ilvanej o jpich’ vanej", 9);
INSERT INTO frases_tzo VALUES(0, "Laj xa sk’elboxuk mi tsanemot", 10);
INSERT INTO frases_tzo VALUES(0, "Jayim a k’ak’al", 11);
INSERT INTO frases_tzo VALUES(0, "Oy bú ip cha vaé", 12);
INSERT INTO frases_tzo VALUES(0, "K’uyelan yipal cha vaí", 13);
INSERT INTO frases_tzo VALUES(0, "Bú ip cha vaé", 14);
INSERT INTO frases_tzo VALUES(0, "Jayim xa k’ak’al ti ipoté", 15);
INSERT INTO frases_tzo VALUES(0, "Laj yak’ boxuk xa a poxil", 16);



#Consulta para frases

SELECT area FROM areas WHERE id_area=1;
SELECT area FROM areas WHERE id_area=2;

#Consular de prueba no le hagas caso
#SELECT frases_esp.frase_esp AS Español, frases_tzo.frase_tzo AS Tzotzil, areas.area
#FROM frases_esp, frases_tzo, areas
#WHERE id_frase_esp = frases_esp_id_frase_esp AND areas_id_area = 1 AND areas.id_area=1;

SELECT frases_esp.frase_esp, frases_tzo.frase_tzo
FROM frases_esp, frases_tzo
WHERE id_frase_esp = frases_esp_id_frase_esp AND areas_id_area = 1;


#SELECT frases_esp.frase_esp AS Español, frases_tzo.frase_tzo AS Tzotzil, areas.area
#FROM frases_esp, frases_tzo, areas
#WHERE id_frase_esp = frases_esp_id_frase_esp AND areas_id_area = 2 AND areas.id_area=2;

SELECT frases_esp.frase_esp, frases_tzo.frase_tzo
FROM frases_esp, frases_tzo
WHERE id_frase_esp = frases_esp_id_frase_esp AND areas_id_area = 2;