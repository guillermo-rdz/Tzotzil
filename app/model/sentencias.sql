#NO HE PUESTO NADA EN TRAUMATOLOGÍA PERO DIME SI QUEDA BIEN ASÍ

INSERT INTO areas VALUES (default, "Admin", "a");
INSERT INTO areas VALUES (default, "Pediatría", "n");
INSERT INTO areas VALUES (default, "Traumatología", "n");

INSERT INTO usuarios VALUES (default, "admin", "qaz", 1, 1);
INSERT INTO usuarios VALUES (default, "Doctor_David", "qaz", 2, 2);
INSERT INTO usuarios VALUES (default, "Doctor_Memo", "qaz", 2, 3);


#Pediatría preguntas protocolarias
INSERT INTO frases VALUES(default, "Nombre del paciente", "Sbi li jchamelé", "p", 2);
INSERT INTO frases VALUES(default, "Edad", "Avilal", "p", 2);
INSERT INTO frases VALUES(default, "Sexo", "Vinik o ants", "p", 2);
INSERT INTO frases VALUES(default, "Región de procedencia", "A lumal", "p", 2);

#Pediatría Auscultación
INSERT INTO frases VALUES(default, "Vomito", "xenel", "a", 2);#Nivel 1
INSERT INTO frases VALUES(default, "Diarrea", "tso'", "a", 2);#Nivel 1

INSERT INTO frases2 VALUES(default, "¿Cuántas veces ha vomitado", "ya' yim velta la xen'", "a", 5);#Nivel 2

INSERT INTO frases3 VALUES(default, "1 vez", "jun velta", "a", 2);#Nivel 3
INSERT INTO frases3 VALUES(default, "2 veces", "chib velta", "a", 2);#Nivel 3

#Pediatría diagnostico
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

#Consulta para Auscultación de Pediatría
SELECT id_frase, frase_esp, frase_tzo FROM frases WHERE tipo_frase="a" AND areas_id_area=2;

#Consulta para Auscultación 2 de Pediatría
SELECT frase2_esp, frase2_tzo FROM frases2 WHERE tipo_frase2="a" AND frases_id_frase=5;

#Consulta para Auscultación 3 de Pediatría
SELECT frase3_esp, frase3_tzo FROM frases3 WHERE tipo_frase3="a" AND frases2_id_frase2=2;