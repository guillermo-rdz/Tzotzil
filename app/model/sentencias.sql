#NO HE PUESTO NADA EN TRAUMATOLOGÍA PERO DIME SI QUEDA BIEN ASÍ
# auto_increment,nombre de area, rango a=admin n=normal
/*
*/
INSERT INTO areas VALUES (default, "Admin", "a");
INSERT INTO areas VALUES (default, "Pediatría", "n");
INSERT INTO areas VALUES (default, "Traumatología", "n");
# id, usuario, pass, rango, id_area
INSERT INTO usuarios VALUES (default, "admin", "qaz", 1, 1);
INSERT INTO usuarios VALUES (default, "Doctor_David", "qaz", 2, 2);
INSERT INTO usuarios VALUES (default, "Doctor_Memo", "qaz", 2, 3);


#Pediatría preguntas protocolarias
INSERT INTO frases VALUES(default, "Nombre del paciente", "Sbi li jchamelé", "p", 2, NULL);
INSERT INTO frases VALUES(default, "Edad", "Avilal", "p", 2, NULL);
INSERT INTO frases VALUES(default, "Sexo", "Vinik o ants", "p", 2, NULL);
INSERT INTO frases VALUES(default, "Región de procedencia", "A lumal", "p", 2, NULL);


#Pediatría Auscultación
INSERT INTO frases VALUES(default, "Vomito", "xenel", "a", 2, 0);#Nivel 1
INSERT INTO frases VALUES(default, "Diarrea", "tso'", "a", 2, 0);#Nivel 1

INSERT INTO frases VALUES(default, "Cuántas veces ha vomitado", "ya' yim velta la xen'", "a", 2, 5);#Nivel 2 vomito
INSERT INTO frases VALUES(default, "desde hace cuantos días", "ja'yim xa k'ak'al", "a", 2, 6);#Nivel 2 diarrea

INSERT INTO frases VALUES(default, "1 vez", "jun velta", "a", 2, 7);#Nivel 3 vomito
INSERT INTO frases VALUES(default, "2 veces", "chib velta", "a", 2, 7);#Nivel 3 vomito

INSERT INTO frases VALUES(default, "1 día", "jun k'ak'al", "a", 2, 8);#Nivel 3 vomito
INSERT INTO frases VALUES(default, "2 día", "chib k'ak'al", "a", 2, 8);#Nivel 3 vomito

#Pediatría diagnostico--------------Pendiente-------------------------------------
#INSERT INTO frases VALUES(default, "Diarrea", "Tsó", "d", 2);



#Traumatología preguntas protocolarias
INSERT INTO frases VALUES(default, "Nombre del paciente", "Sbi li jchamelé", "p", 3, NULL);
INSERT INTO frases VALUES(default, "Edad", "Avilal", "p", 3, NULL);
INSERT INTO frases VALUES(default, "Sexo", "Vinik o ants", "p", 3, NULL);
INSERT INTO frases VALUES(default, "Motivo de la consulta", "Ja yoon sventa li consulta", "p", 3, NULL);
#Traumatología Auscultación
INSERT INTO frases VALUES(default, "Le duele la espalda", "mi ip'xabai la pate'", "a", 3, NULL);#Nivel 1
INSERT INTO frases VALUES(default, "Le duele la rodilla", "mi ip'xabai lisjol a bakan", "a", 3, NULL);#Nivel 1

INSERT INTO frases VALUES(default, "Cuál", "bu junukal", "a", 3, 18);#Nivel 2 Rodrilla

INSERT INTO frases VALUES(default, "Izquierda", "ta tse't", "a", 3, 19);#Nivel 3 rodilla
INSERT INTO frases VALUES(default, "Derecha", "batsi' bakan", "a", 3, 19);#Nivel 3 rodilla
INSERT INTO frases VALUES(default, "Ambas", "xchibal", "a", 3, 19);#Nivel 3 rodilla


#Traumatología diagnostico
#INSERT INTO frases VALUES(default, "Reposo", "Kuxel", "d", 3);

/*

###################################################CONSULTAS################################################

#Consulta preguntas protocolarias de Pediatría
SELECT frase_esp, frase_tzo FROM frases WHERE tipo_frase="p" AND areas_id_area=2;

#Consulta para Auscultación 1 de Pediatría
SELECT id_frase, frase_esp, frase_tzo FROM frases WHERE tipo_frase="a" AND areas_id_area=2 AND frases_id_frase IS NULL;

#Consulta para Auscultación 2 de Pediatría
SELECT frase_esp, frase_tzo FROM frases WHERE tipo_frase="a"; #AND frases_id_frase=5 el id del nivel 2

#Consulta para Auscultación 3 de Pediatría
SELECT frase_esp, frase_tzo FROM frases WHERE tipo_frase="a" AND frases_id_frase=7;

#Consulta para el dropdown--------------------------No sé si te sirva XD solo esta con frases en español, pero pues se puede adaptar-----------------------------
SELECT f.frase_esp, fh.frase_esp, fhh.frase_esp
FROM frases f
INNER JOIN frases fh 
ON f.id_frase = fh.frases_id_frase
INNER JOIN frases fhh
ON fh.id_frase = fhh.frases_id_frase;
*/