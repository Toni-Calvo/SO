USE bd;



CREATE TABLE partidas (IDPartida int(10),IDJugador1 int(10),IDJugador2 int(10) ,IDJugador3 int(10),IDJugador4 int (10),FechayHoraFinal datetime not NULL ,Duracion int(3),ganador int(10));



CREATE TABLE RelacionIDsPartidas (IDJugador int(10),IDPartida int(10));



CREATE TABLE jugador ( ID int(10) ,username varchar (25),Correo varchar(25) ,Contrasenya varchar(12) ,FechaDeNacimiento DATE not NULL );



INSERT INTO partidas (IDPartida,IDJugador1,IDJugador2,IDJugador3, IDJugador4,FechayHoraFinal,Duracion,ganador) VALUES (145678902,1,2,3,4,'2024-8-26 14:33:56', 175,1);


INSERT INTO partidas (IDPartida,IDJugador1,IDJugador2,IDJugador3, IDJugador4,FechayHoraFinal,Duracion,ganador) VALUES (1110,1,2,3,4, '2024-8-26 14:12:04', 200,2);

INSERT INTO partidas (IDPartida,IDJugador1,IDJugador2,IDJugador3, IDJugador4,FechayHoraFinal,Duracion,ganador) VALUES (1111,1,2,3,4,'2024-8-26 14:40:56', 100,2);

INSERT INTO partidas (IDPartida,IDJugador1,IDJugador2,IDJugador3, IDJugador4,FechayHoraFinal,Duracion,ganador) VALUES (1222,1,2,3,4,'2024-8-25 15:33:55', 200,2);

INSERT INTO jugador (ID,Username,Correo,Contrasenya,FechaDeNacimiento) VALUES (1,'Toni','toni@gmail.com','hola','2004-8-21');

INSERT INTO jugador (ID,Username,Correo,Contrasenya,FechaDeNacimiento) VALUES (2,'Uzair','uzair@gmail.com','hola','2004-12-08');

INSERT INTO jugador (ID,Username,Correo,Contrasenya,FechaDeNacimiento) VALUES (3,'Queralt','queralt@gmail.com','hola','2004-1-03');

INSERT INTO jugador (ID,Username,Correo,Contrasenya,FechaDeNacimiento) VALUES (4,'Paula','paula@gmail.com','hola','2004-1-04');



INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (1,1110);
INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (2,1110);
INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (3,1110);
INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (4,1110);
INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (1,1111);
INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (2,1111);
INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (3,1111);
INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (4,1111);
INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (1,145678902);
INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (2,145678902);
INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (3,145678902);
INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (4,145678902);
INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (1,1222);
INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (2,1222);
INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (3,1222);
INSERT INTO RelacionIDsPartidas (IDJugador,IDPartida) VALUES (4,1222);

