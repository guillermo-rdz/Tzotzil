#NO HE PUESTO NADA EN TRAUMATOLOGÍA PERO DIME SI QUEDA BIEN ASÍ

INSERT INTO areas VALUES (default, "Admin", "a");
INSERT INTO areas VALUES (default, "Pediatría", "n");
INSERT INTO areas VALUES (default, "Traumatología", "n");

INSERT INTO usuarios VALUES (default, "admin", "qaz", 1, 1);
INSERT INTO usuarios VALUES (default, "Doctor_David", "qaz", 2, 2);
INSERT INTO usuarios VALUES (default, "Doctor_Memo", "qaz", 2, 3);


#Pediatría preguntas protocolarias
INSERT INTO frases VALUES(default, "Nombre del paciente", "Sbi li jchamelé", "p", 2, NULL);
INSERT INTO frases VALUES(default, "Edad", "Avilal", "p", 2, NULL);
INSERT INTO frases VALUES(default, "Sexo", "Vinik o ants", "p", 2, NULL);
INSERT INTO frases VALUES(default, "Región de procedencia", "A lumal", "p", 2, NULL);

#Pediatría Auscultación
INSERT INTO frases VALUES(default, "Vomito", "xenel", "a", 2, NULL);#Nivel 1
INSERT INTO frases VALUES(default, "Diarrea", "tso'", "a", 2, NULL);#Nivel 1

INSERT INTO frases VALUES(default, "¿Cuántas veces ha vomitado", "ya' yim velta la xen'", "a", 2, 5);#Nivel 2

INSERT INTO frases VALUES(default, "1 vez", "jun velta", "a", 2, 7);#Nivel 3
INSERT INTO frases VALUES(default, "2 veces", "chib velta", "a", 2, 7);#Nivel 3

#Pediatría diagnostico--------------Pendiente-------------------------------------
INSERT INTO frases VALUES(default, "Diarrea", "Tsó", "d", 2);



#Traumatología preguntas protocolarias
#INSERT INTO frases VALUES(default, "Nombre del paciente", "Sbi li jchamelé", "p", 3);
#INSERT INTO frases VALUES(default, "Edad", "Avilal", "p", 3);
#INSERT INTO frases VALUES(default, "Sexo", "Vinik o ants", "p", 3);
#INSERT INTO frases VALUES(default, "Motivo de la consulta", "Ja yoon sventa li consulta", "p", 3);
#Traumatología Auscultación
#INSERT INTO frases VALUES(default, "¿Cuándo inicio con el problema?", "K’usi k’ak’alil ti lik ipajané", "a", 3);
#INSERT INTO frases VALUES(default, "¿Qué tiempo tiene (hrs)?", "Jayim xa k’ak’al ti ipoté", "a", 3);
#INSERT INTO frases VALUES(default, "¿Qué tratamiento ya le dieron?", "K’usi poxilal laj yakboxuk", "a", 3);
#INSERT INTO frases VALUES(default, "¿Con qué médicos ha ido/o asistido?", "Buch’u las k’eloxuk", "a", 3);

#Traumatología diagnostico
INSERT INTO frases VALUES(default, "Reposo", "Kuxel", "d", 3);



###################################################CONSULTAS################################################

#Consulta preguntas protocolarias de Pediatría
SELECT frase_esp, frase_tzo FROM frases WHERE tipo_frase="p" AND areas_id_area=2;

#Consulta para Auscultación 1 de Pediatría
SELECT id_frase, frase_esp, frase_tzo FROM frases WHERE tipo_frase="a" AND areas_id_area=2 AND frases_id_frase IS NULL;

#Consulta para Auscultación 2 de Pediatría
SELECT frase_esp, frase_tzo FROM frases WHERE tipo_frase="a" AND frases_id_frase=5;

#Consulta para Auscultación 3 de Pediatría
SELECT frase_esp, frase_tzo FROM frases WHERE tipo_frase="a" AND frases_id_frase=7;

CREATE  TABLE IF NOT EXISTS `base_tr`.`frases` (
  `id_frase` INT NOT NULL AUTO_INCREMENT ,
  `frase_esp` VARCHAR(200) NOT NULL ,
  `frase_tzo` VARCHAR(200) NOT NULL ,
  `tipo_frase` CHAR(2) NOT NULL COMMENT 'Pregunta protocolaria(P), asculltación(A), diagnostico(D), Ascultacion2(A2) Ascultacion3(A3)' ,
  `areas_id_area` INT NOT NULL ,
  `frases_id_frase` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`id_frase`) ,
  INDEX `fk_frases_esp_areas1_idx` (`areas_id_area` ASC) ,
  INDEX `fk_frases_frases1_idx` (`frases_id_frase` ASC) ,
  CONSTRAINT `fk_frases_esp_areas1`
    FOREIGN KEY (`areas_id_area` )
    REFERENCES `base_tr`.`areas` (`id_area` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_frases_frases1`
    FOREIGN KEY (`frases_id_frase` )
    REFERENCES `base_tr`.`frases` (`id_frase` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB