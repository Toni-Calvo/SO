USE bd;


DROP TABLE IF EXISTS partidas;
DROP TABLE IF EXISTS RelacionIDsPartidas;
DROP TABLE IF EXISTS jugador;
DROP TABLE IF EXISTS conectados;
DROP TABLE IF EXISTS PreguntasHistoria;
DROP TABLE IF EXISTS PreguntasArte;
DROP TABLE IF EXISTS PreguntasCiencia;
DROP TABLE IF EXISTS PreguntasEntretenimiento;
DROP TABLE IF EXISTS PreguntasGeografia;

CREATE TABLE partidas (IDPartida int(10),IDJugador1 int(10),IDJugador2 int(10) ,IDJugador3 int(10),IDJugador4 int (10),FechayHoraFinal datetime not NULL ,Duracion int(3),ganador int(10), p1 int(3), p2 int(3), p3 int(3), p4 int(3));

CREATE TABLE RelacionIDsPartidas (IDJugador int(10),IDPartida int(10));

CREATE TABLE jugador (ID int(10) ,username varchar (25),Correo varchar(25) ,Contrasenya varchar(12) ,FechaDeNacimiento DATE not NULL);

CREATE TABLE conectados(nombre VARCHAR(25), socket INT(10));


INSERT INTO jugador (ID,Username,Correo,Contrasenya,FechaDeNacimiento) VALUES (1,'Toni','toni@gmail.com','hola','2004-8-21');

INSERT INTO jugador (ID,Username,Correo,Contrasenya,FechaDeNacimiento) VALUES (2,'Uzair','uzair@gmail.com','hola','2004-12-08');

INSERT INTO jugador (ID,Username,Correo,Contrasenya,FechaDeNacimiento) VALUES (3,'Queralt','queralt@gmail.com','hola','2004-1-03');

INSERT INTO jugador (ID,Username,Correo,Contrasenya,FechaDeNacimiento) VALUES (4,'Paula','paula@gmail.com','hola','2004-1-04');


CREATE TABLE PreguntasHistoria(Pregunta varchar(200), respuesta1 varchar(100), respuesta2 varchar(100), respuesta3 varchar(100), respuesta4 varchar(100));

CREATE TABLE PreguntasArte(Pregunta varchar(200), respuesta1 varchar(100), respuesta2 varchar(100), respuesta3 varchar(100), respuesta4 varchar(100));

CREATE TABLE PreguntasCiencia(Pregunta varchar(200), respuesta1 varchar(100), respuesta2 varchar(100), respuesta3 varchar(100), respuesta4 varchar(100));

CREATE TABLE PreguntasGeografia(Pregunta varchar(200), respuesta1 varchar(100), respuesta2 varchar(100), respuesta3 varchar(100), respuesta4 varchar(100));

CREATE TABLE PreguntasEntretenimiento(Pregunta varchar(200), respuesta1 varchar(100), respuesta2 varchar(100), respuesta3 varchar(100), respuesta4 varchar(100));

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el primer presidente de los Estados Unidos?', 'George Washington', 'Abraham Lincoln', 'Thomas Jefferson', 'Benjamin Franklin');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año cayó el Muro de Berlín?', '1989', '1991', '1985', '1979');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país se inició la Revolución Industrial?', 'Inglaterra', 'Francia', 'Alemania', 'Estados Unidos');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién escribió "El Quijote"?', 'Miguel de Cervantes', 'Federico García Lorca', 'Gabriel García Márquez', 'Julio Cortázar');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el líder de los nazis durante la Segunda Guerra Mundial?', 'Adolf Hitler', 'Winston Churchill', 'Joseph Stalin', 'Benito Mussolini');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál fue el imperio que construyó la Gran Muralla China?', 'Imperio Chino', 'Imperio Mongol', 'Imperio Persa', 'Imperio Bizantino');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién descubrió América?', 'Cristóbal Colón', 'Fernando de Magallanes', 'Marco Polo', 'Américo Vespucio');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál fue el conflicto bélico más extenso del siglo XX?', 'Segunda Guerra Mundial', 'Primera Guerra Mundial', 'Guerra de Vietnam', 'Guerra Fría');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año comenzó la Primera Guerra Mundial?', '1914', '1920', '1918', '1939');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué emperador romano legalizó el cristianismo?', 'Constantino', 'Nerón', 'Augusto', 'Julio César');
INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién pintó "La Última Cena"?', 'Leonardo da Vinci', 'Miguel Ángel', 'Rafael', 'Tiziano');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la obra más famosa de William Shakespeare?', 'Hamlet', 'La Odisea', 'El Principito', 'Don Quijote');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué artista es famoso por pintar girasoles?', 'Vincent van Gogh', 'Pablo Picasso', 'Salvador Dalí', 'Claude Monet');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién es el autor de "Cien años de soledad"?', 'Gabriel García Márquez', 'Mario Vargas Llosa', 'Isabel Allende', 'Jorge Luis Borges');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué estilo artístico desarrolló Picasso?', 'Cubismo', 'Impresionismo', 'Surrealismo', 'Realismo');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién pintó "La persistencia de la memoria"?', 'Salvador Dalí', 'Pablo Picasso', 'Claude Monet', 'Francisco de Goya');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál de estos es un pintor impresionista?', 'Claude Monet', 'Vincent van Gogh', 'Andy Warhol', 'Leonardo da Vinci');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país nació Frida Kahlo?', 'México', 'España', 'Argentina', 'Chile');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre de la famosa estatua sin brazos que se encuentra en el Louvre?', 'Venus de Milo', 'David de Miguel Ángel', 'Victoria de Samotracia', 'Diana de Versalles');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién pintó "La noche estrellada"?', 'Vincent van Gogh', 'Salvador Dalí', 'Edvard Munch', 'Henri Matisse');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el planeta más grande del sistema solar?', 'Júpiter', 'Marte', 'Tierra', 'Venus');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué tipo de animal es un ornitorrinco?', 'Mamífero', 'Ave', 'Reptil', 'Anfibio');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el elemento químico con el símbolo "O"?', 'Oxígeno', 'Oro', 'Osmio', 'Óxido');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el animal terrestre más rápido?', 'Guepardo', 'León', 'Tigre', 'Antílope');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué científico propuso la teoría de la relatividad?', 'Albert Einstein', 'Isaac Newton', 'Galileo Galilei', 'Nikola Tesla');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la unidad básica de la vida?', 'Célula', 'Molécula', 'Átomo', 'Organelo');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué planeta es conocido como el "Planeta Rojo"?', 'Marte', 'Saturno', 'Venus', 'Júpiter');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué partícula tiene una carga negativa?', 'Electrón', 'Protones', 'Neutrones', 'Iones');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el metal más ligero?', 'Litio', 'Mercurio', 'Oro', 'Plata');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la molécula que transporta la información genética?', 'ADN', 'ARN', 'Proteína', 'Carbohidrato');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el país más grande de África en términos de superficie?', 'Argelia', 'Sudán', 'República Democrática del Congo', 'Libia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Mongolia?', 'Ulán Bator', 'Almaty', 'Bakú', 'Dushanbe');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país se encuentra el desierto de Atacama?', 'Chile', 'Argentina', 'Perú', 'Bolivia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el país con más islas en el mundo?', 'Suecia', 'Filipinas', 'Indonesia', 'Noruega');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el río más largo de Europa?', 'Volga', 'Danubio', 'Rin', 'Elba');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la ciudad más poblada de África?', 'Lagos', 'El Cairo', 'Kinshasa', 'Johannesburgo');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país se encuentra la Cordillera de los Pirineos?', 'España y Francia', 'Italia y Suiza', 'Portugal y España', 'Alemania y Francia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el país más montañoso del mundo?', 'Nepal', 'Suiza', 'Chile', 'Canadá');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país se encuentra la ciudad de San Petersburgo?', 'Rusia', 'Polonia', 'Finlandia', 'Estonia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el archipiélago más grande del mundo en términos de área?', 'Indonesia', 'Filipinas', 'Maldivas', 'Japón');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el país sin litoral más grande en términos de superficie?', 'Kazajistán', 'Mongolia', 'Afganistán', 'Níger');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué país tiene frontera con el mayor número de otros países?', 'China', 'Brasil', 'Rusia', 'India');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país se encuentra el Lago Baikal, el lago de agua dulce más profundo del mundo?', 'Rusia', 'Canadá', 'China', 'Finlandia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el volcán más alto del mundo?', 'Ojos del Salado', 'Monte Etna', 'Monte Fuji', 'Mauna Kea');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Bután?', 'Thimphu', 'Katmandú', 'Islamabad', 'Yakarta');
INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién dirigió la película "2001: Una odisea del espacio"?', 'Stanley Kubrick', 'Steven Spielberg', 'Francis Ford Coppola', 'George Lucas');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué videojuego popular de 1980 presenta a un personaje que debe comerse puntos en un laberinto mientras evita fantasmas?', 'Pac-Man', 'Donkey Kong', 'Galaga', 'Asteroids');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año se lanzó el álbum "Thriller" de Michael Jackson?', '1982', '1979', '1985', '1990');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué película ganó el primer premio Óscar a Mejor Película en 1929?', 'Wings', 'Sunrise', 'The Broadway Melody', 'All Quiet on the Western Front');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién escribió la novela "Crimen y castigo"?', 'Fiódor Dostoyevski', 'León Tolstói', 'Vladimir Nabokov', 'Antón Chéjov');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la serie de televisión de mayor duración en la historia?', 'Los Simpson', 'Doctor Who', 'Law & Order', 'Friends');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué banda de rock lanzó el álbum "The Dark Side of the Moon"?', 'Pink Floyd', 'Led Zeppelin', 'The Rolling Stones', 'Queen');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el verdadero nombre del personaje "El Hombre Araña" en los cómics?', 'Peter Parker', 'Clark Kent', 'Bruce Wayne', 'Barry Allen');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país se originó el baile conocido como tango?', 'Argentina', 'Brasil', 'Cuba', 'España');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué director de cine es conocido por sus películas surrealistas como "Eraserhead" y "Mulholland Drive"?', 'David Lynch', 'Quentin Tarantino', 'Tim Burton', 'Martin Scorsese');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál fue la primera película animada en ganar un Óscar a Mejor Película Animada?', 'Shrek', 'Toy Story', 'Blancanieves y los siete enanitos', 'La bella y la bestia');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué compositor clásico compuso la famosa obra "Las Cuatro Estaciones"?', 'Antonio Vivaldi', 'Wolfgang Amadeus Mozart', 'Ludwig van Beethoven', 'Johann Sebastian Bach');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre del planeta natal de Superman?', 'Krypton', 'Omega', 'Vulcano', 'Ego');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué famoso cuadro fue robado del Museo del Louvre en 1911?', 'La Mona Lisa', 'La última cena', 'El nacimiento de Venus', 'La joven de la perla');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué banda de los años 60 fue conocida como "Los Cuatro Fabulosos"?', 'The Beatles', 'The Rolling Stones', 'The Beach Boys', 'The Who');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué videojuego aparece un personaje llamado Solid Snake?', 'Metal Gear', 'Final Fantasy', 'Resident Evil', 'Street Fighter');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año se lanzó el primer iPhone?', '2007', '2005', '2008', '2010');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién es el autor de la obra "La Metamorfosis"?', 'Franz Kafka', 'Oscar Wilde', 'Fiódor Dostoyevski', 'Gabriel García Márquez');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué personaje de cine pronunció la famosa frase "Aquí tienes mirando a ti, chico"?', 'Rick Blaine en Casablanca', 'Michael Corleone en El Padrino', 'Forrest Gump en Forrest Gump', 'Indiana Jones en En busca del arca perdida');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué emperador romano hizo del cristianismo la religión oficial del Imperio Romano?', 'Teodosio I', 'Constantino', 'Juliano', 'Augusto');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál fue la dinastía que gobernó China durante la construcción de la Gran Muralla?', 'Dinastía Qin', 'Dinastía Ming', 'Dinastía Tang', 'Dinastía Han');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año cayó Constantinopla en manos del Imperio Otomano?', '1453', '1492', '1517', '1410');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el primer presidente de Estados Unidos en ser asesinado en el cargo?', 'Abraham Lincoln', 'James Garfield', 'William McKinley', 'John F. Kennedy');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué rey de Inglaterra fue ejecutado durante la Guerra Civil Inglesa?', 'Carlos I', 'Enrique VIII', 'Ricardo III', 'Jacobo I');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué civilización antigua es conocida por sus "Líneas de Nazca" en el desierto peruano?', 'Nazca', 'Maya', 'Inca', 'Tolteca');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué general cartaginés cruzó los Alpes para enfrentarse a Roma?', 'Aníbal', 'Escipión', 'Mario', 'Julio César');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el fundador de la dinastía Yuan en China?', 'Kublai Kan', 'Genghis Kan', 'Ogedai Kan', 'Timur');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál fue la última dinastía imperial de Rusia antes de la revolución de 1917?', 'Dinastía Romanov', 'Dinastía Rurik', 'Dinastía Vasa', 'Dinastía Pruska');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué tratado puso fin a la Primera Guerra Mundial?', 'Tratado de Versalles', 'Tratado de París', 'Tratado de Tordesillas', 'Tratado de Brest-Litovsk');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la ciudad más antigua continuamente habitada del mundo?', 'Damasco', 'Jerusalén', 'Roma', 'Atenas');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el líder militar conocido como "El Zorro del Desierto" durante la Segunda Guerra Mundial?', 'Erwin Rommel', 'Bernard Montgomery', 'George Patton', 'Dwight D. Eisenhower');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál fue la civilización precolombina que construyó Machu Picchu?', 'Inca', 'Maya', 'Azteca', 'Olmeca');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el rey de los francos coronado como Emperador del Sacro Imperio Romano en el año 800?', 'Carlomagno', 'Luis el Piadoso', 'Carlos Martel', 'Clodoveo I');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué emperador japonés fue el último en tener un estatus divino reconocido?', 'Hirohito', 'Meiji', 'Taisho', 'Akihito');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué nación europea fue conocida como "La Gran Serbia" en el siglo XIX?', 'Serbia', 'Montenegro', 'Croacia', 'Bosnia');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país tuvo lugar la revolución de los "Camisas Negras"?', 'Italia', 'España', 'Alemania', 'Grecia');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre de la batalla en la que Napoleón Bonaparte fue derrotado definitivamente?', 'Waterloo', 'Austerlitz', 'Trafalgar', 'Leipzig');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál fue el nombre de la operación alemana para invadir la Unión Soviética en 1941?', 'Operación Barbarroja', 'Operación León Marino', 'Operación Overlord', 'Operación Market Garden');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué evento se considera el detonante de la Primera Guerra Mundial?', 'Asesinato del archiduque Francisco Fernando', 'Invasión de Polonia', 'Hundimiento del Lusitania', 'Incidente de Mukden');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el país más grande del mundo por superficie?', 'Rusia', 'Canadá', 'China', 'Estados Unidos');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué montaña es la más alta del continente africano?', 'Kilimanjaro', 'Monte Kenia', 'Monte Atlas', 'Monte Toubkal');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país se encuentra el Lago Baikal, el lago de agua dulce más profundo del mundo?', 'Rusia', 'Canadá', 'China', 'Kazajistán');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Australia?', 'Canberra', 'Sídney', 'Melbourne', 'Adelaida');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué continente se encuentra el desierto de Atacama?', 'América del Sur', 'África', 'Asia', 'Oceanía');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué país tiene el mayor número de islas en el mundo?', 'Suecia', 'Noruega', 'Grecia', 'Indonesia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la ciudad más poblada de Brasil?', 'São Paulo', 'Río de Janeiro', 'Brasilia', 'Salvador');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el río más largo de África?', 'Nilo', 'Níger', 'Zambeze', 'Congo');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país se encuentra la montaña conocida como "El Matterhorn"?', 'Suiza', 'Italia', 'Francia', 'Austria');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué océano se encuentra al este de África?', 'Océano Índico', 'Océano Atlántico', 'Océano Pacífico', 'Océano Ártico');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué país tiene la mayor extensión territorial de América Latina?', 'Brasil', 'Argentina', 'México', 'Colombia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el único país en el mundo que tiene la misma bandera que el Reino Unido?', 'Australia', 'Canadá', 'Nueva Zelanda', 'Fiji');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país se encuentra el Monte Everest, la montaña más alta del mundo?', 'Nepal', 'Tíbet', 'India', 'China');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país se encuentra la famosa ciudad antigua de Petra?', 'Jordania', 'Egipto', 'Turquía', 'Irak');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre del estrecho que separa España de Marruecos?', 'Estrecho de Gibraltar', 'Estrecho de Magallanes', 'Estrecho de Bering', 'Estrecho de Dardanelos');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Bután?', 'Thimphu', 'Katmandú', 'Lhasa', 'Paro');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país se encuentra el desierto de Kalahari?', 'Botsuana', 'Sudáfrica', 'Namibia', 'Mozambique');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la isla más grande del Caribe?', 'Cuba', 'Hispaniola', 'Jamaica', 'Puerto Rico');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el país con la mayor cantidad de población musulmana?', 'Indonesia', 'Pakistán', 'India', 'Irán');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el único país sin ejército en el mundo?', 'Costa Rica', 'Suiza', 'Japón', 'Panamá');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué paradoja en "Dark" está asociada con la figura de "el viajero del tiempo"?', 'La paradoja del abuelo', 'La paradoja de Fermi', 'La paradoja de Schrödinger', 'La paradoja de los gemelos');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cómo se llama la organización secreta que se oculta en las sombras en "Dark"?', 'Sic Mundus', 'La Resistencia', 'El Sindicato', 'La Sociedad de los Secretos');
INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué serie de TV aparece el personaje de "Walter White"?', 'Breaking Bad', 'Better Call Saul', 'The Sopranos', 'Mad Men');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién es el director de la película "El Gran Lebowski"?', 'Joel Coen', 'Martin Scorsese', 'Stanley Kubrick', 'Wes Anderson');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué película de 1999 aparece la famosa frase "Me han dado un golpe en la cabeza"?', 'The Matrix', 'Fight Club', 'American Beauty', 'El Club de la Pelea');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre del primer superhéroe creado por Marvel Comics en 1939?', 'Namor el Submarino', 'Capitán América', 'Spider-Man', 'Iron Man');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué película de animación fue la primera en ser nominada al Óscar a Mejor Película?', 'La Bella y la Bestia', 'El Rey León', 'Shrek', 'Frozen');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién interpretó a "Hannibal Lecter" en la película "El Silencio de los Corderos"?', 'Anthony Hopkins', 'Jack Nicholson', 'Marlon Brando', 'Johnny Depp');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué videojuego popular fue lanzado originalmente en 1996 por la empresa Nintendo?', 'Super Mario 64', 'The Legend of Zelda: Ocarina of Time', 'Pokémon Rojo', 'Final Fantasy VII');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué banda lanzó el famoso álbum "Abbey Road" en 1969?', 'The Beatles', 'The Rolling Stones', 'Led Zeppelin', 'Pink Floyd');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué serie de televisión se presenta el concepto de "la Zona Fantasma"?', 'Superman', 'Smallville', 'Arrow', 'The Flash');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién dirigió la película "La naranja mecánica"?', 'Stanley Kubrick', 'Francis Ford Coppola', 'Quentin Tarantino', 'David Lynch');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre del principio físico que afirma que no se puede conocer con precisión la posición y la velocidad de una partícula al mismo tiempo?', 'Principio de incertidumbre de Heisenberg', 'Ley de la gravitación universal', 'Teoría de cuerdas', 'Principio de superposición cuántica');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el primero en postular la teoría heliocéntrica, que afirma que el Sol está en el centro del sistema solar?', 'Nicolás Copérnico', 'Galileo Galilei', 'Johannes Kepler', 'Isaac Newton');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre de la partícula subatómica que tiene carga negativa?', 'Electrón', 'Protón', 'Neutrón', 'Quark');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué descubrimiento llevó a la formulación de la teoría de la relatividad de Albert Einstein?', 'La constancia de la velocidad de la luz', 'La ley de la gravitación universal', 'La expansión del universo', 'El efecto fotoeléctrico');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cómo se llama el genoma completo de una especie?', 'Genoma', 'Cromosoma', 'Alelo', 'Proteoma');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre del primer animal que se clonó en 1996?', 'Dolly la oveja', 'Albert el mono', 'Einstein la vaca', 'Clyde el ratón');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién descubrió la penicilina?', 'Alexander Fleming', 'Marie Curie', 'Louis Pasteur', 'Robert Koch');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué elemento químico tiene el símbolo "Fe"?', 'Hierro', 'Fósforo', 'Flúor', 'Francio');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre de la capa más externa de la Tierra?', 'Corteza', 'Manto', 'Núcleo externo', 'Núcleo interno');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué teorema establece que no se puede conocer simultáneamente el momento y la posición de una partícula con precisión infinita?', 'Teorema de Heisenberg', 'Teorema de Pitágoras', 'Teorema de Euler', 'Teorema de Gauss');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cómo se llama la ecuación fundamental de la mecánica de fluidos que describe el movimiento de un fluido incomprensible y viscoso?', 'Ecuación de Navier-Stokes', 'Ecuación de Euler', 'Teorema de Bernoulli', 'Ley de Poiseuille');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el principio físico que explica la sustentación en las alas de un avión?', 'Principio de Bernoulli', 'Ley de la conservación de la masa', 'Teoría de la elasticidad', 'Teoría de la relatividad');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cómo se llama el parámetro que describe la viscosidad dinámica en la mecánica de fluidos?', 'Coeficiente de viscosidad', 'Número de Reynolds', 'Presión de vaporización', 'Coeficiente de difusión');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué fenómeno explica el comportamiento de los gases ideales según la ley de Boyle?', 'La compresión de un gas a temperatura constante', 'La expansión de un gas a volumen constante', 'El aumento de temperatura a volumen constante', 'La energía cinética de las moléculas de gas');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En aerodinámica, ¿qué significa el "número de Mach"?', 'La relación de la velocidad de un objeto con la velocidad del sonido', 'La relación entre la densidad y la velocidad de un fluido', 'La proporción entre la presión y la temperatura de un gas', 'La diferencia de presiones en las alas de un avión');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la ley que describe el comportamiento de un fluido ideal que se mueve a través de una tubería con diferentes áreas de sección transversal?', 'Ley de continuidad', 'Ley de Bernoulli', 'Ley de Poiseuille', 'Ecuación de Navier-Stokes');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué es la "tensión superficial" en mecánica de fluidos?', 'La fuerza que actúa en la superficie de un líquido, creando una capa resistente', 'La velocidad máxima a la que puede fluir un fluido', 'La cantidad de energía cinética de un fluido en movimiento', 'El comportamiento de un fluido viscoso que fluye por una superficie rugosa');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué significa el "número de Reynolds" en mecánica de fluidos?', 'Indica el régimen de flujo de un fluido (laminar o turbulento)', 'La cantidad de energía que pierde un fluido debido a la fricción', 'La velocidad crítica de un fluido en movimiento', 'El coeficiente de arrastre de un objeto en movimiento');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué ley en aerodinámica se utiliza para calcular la fuerza de sustentación de un avión en vuelo?', 'Ley de Bernoulli', 'Ley de Pascal', 'Ley de Boyle', 'Teoría de la elasticidad');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el principio que explica la aceleración de un fluido cuando su velocidad aumenta al pasar por un estrechamiento en una tubería?', 'Principio de Bernoulli', 'Ley de Boyle', 'Ecuación de Navier-Stokes', 'Teorema de la energía cinética');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la ecuación fundamental que describe el movimiento de un avión en el aire teniendo en cuenta las fuerzas de sustentación, resistencia, empuje y peso?', 'Ecuación de la mecánica del vuelo', 'Ecuación de Navier-Stokes', 'Ecuación de Euler', 'Ecuación de Bernoulli');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cómo se denomina la velocidad crítica a la que el flujo de aire en torno a un avión comienza a volverse turbulento, causando pérdida de sustentación?', 'Velocidad de pérdida', 'Velocidad de Mach 1', 'Velocidad terminal', 'Velocidad de ascenso');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué efecto explica el cambio de presión sobre el ala de un avión debido a la variación de la velocidad del aire por encima y por debajo del ala?', 'Efecto Bernoulli', 'Efecto Magnus', 'Efecto Venturi', 'Efecto Doppler');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la teoría de la aerodinámica, ¿qué es el "ángulo de ataque" en un avión?', 'El ángulo entre el eje longitudinal del avión y la dirección del viento relativo', 'El ángulo entre el fuselaje y la superficie del ala', 'El ángulo de inclinación de las alas respecto al suelo', 'El ángulo entre el fuselaje y el viento de cola');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el término que describe la cantidad de aire que pasa a través de un motor a reacción en un tiempo determinado?', 'Caudal de masa de aire', 'Coeficiente de arrastre', 'Potencia específica', 'Índice de presión dinámica');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la mecánica de vuelo, ¿qué describe el "número de Mach"?', 'La relación entre la velocidad del avión y la velocidad del sonido en el aire', 'La relación entre la sustentación y la resistencia de un avión', 'La velocidad a la que el avión alcanza su máxima eficiencia aerodinámica', 'La cantidad de aire que un motor succiona por segundo');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cómo se denomina el fenómeno cuando el flujo de aire sobre un ala se separa, causando una pérdida repentina de sustentación?', 'Pérdida aerodinámica', 'Despegue asistido', 'Arrastre inducido', 'Inestabilidad transitoria');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué principio aerodinámico describe el aumento de la sustentación al incrementar la velocidad del flujo de aire por encima del ala?', 'Principio de Bernoulli', 'Ley de la conservación de la masa', 'Teoría de los vórtices', 'Teoría de la expansión de los gases');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cómo se llama el fenómeno que ocurre cuando un avión pasa de una velocidad subsónica a transónica, causando una compresión del aire frente a las alas?', 'Compresión transónica', 'Pico de shock', 'Inestabilidad de onda', 'Zona de máxima sustentación');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En aerodinámica, ¿qué se entiende por "arrastre parasitario" de un avión?', 'La resistencia al avance debido a la fricción del aire con la superficie del avión', 'La resistencia causada por las perturbaciones de aire en las alas', 'La resistencia causada por la compresión del aire en el cono de choque', 'La resistencia a la presión del aire por debajo del fuselaje');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año se estrenó la primera película de "Blade Runner" dirigida por Ridley Scott?', '1982', '1980', '1984', '1986');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cómo se llama el actor que interpretó a Doctor Emmett Brown en la saga de "Volver al Futuro"?', 'Christopher Lloyd', 'Michael J. Fox', 'Jeff Goldblum', 'Bill Murray');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué serie de televisión aparece un personaje llamado "Cersei Lannister"?', 'Juego de Tronos', 'Los 100', 'The Witcher', 'The Mandalorian');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la serie "Rick and Morty", ¿cómo se llama el universo paralelo en el que Morty tiene una versión malvada?', 'Universo C-137', 'Universo 1-2-3', 'Universo 69', 'Universo X');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué actor da vida a Tony Stark/Iron Man en el Universo Cinematográfico de Marvel?', 'Robert Downey Jr.', 'Chris Hemsworth', 'Mark Ruffalo', 'Chris Evans');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año se estrenó la serie "Stranger Things" en Netflix?', '2016', '2017', '2015', '2018');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En la película "The Matrix", cuál es el nombre real del personaje interpretado por Keanu Reeves?', 'Thomas Anderson', 'John Wick', 'Neo Skywalker', 'Agent Smith');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué anime cuenta la historia de un adolescente llamado Shinji Ikari y su lucha con gigantescos robots llamados "Eva"?', 'Neon Genesis Evangelion', 'Attack on Titan', 'Cowboy Bebop', 'Fullmetal Alchemist');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué serie de ciencia ficción se desarrolla en una nave espacial llamada "Discovery One"?', '2001: Una odisea del espacio', 'Star Trek: The Next Generation', 'Battlestar Galactica', 'Firefly');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué director es conocido por sus películas de culto como "Donnie Darko" y "Southland Tales"?', 'Richard Kelly', 'David Lynch', 'Stanley Kubrick', 'Quentin Tarantino');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la película "Inception", ¿qué objeto se utiliza como "tótem" para saber si el protagonista está soñando?', 'Un trompo', 'Una peonza', 'Un reloj de bolsillo', 'Una anillo de bodas');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué película de ciencia ficción aparece el personaje de HAL 9000?', '2001: Una odisea del espacio', 'Interestelar', 'Alien', 'Solaris');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cómo se llama la civilización alienígena en la serie "Star Trek: The Next Generation"?', 'Los Vulcanos', 'Los Klingon', 'Los Borg', 'Los Romulanos');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué serie de anime está basada en un manga de Yoshihiro Togashi sobre un grupo de cazadores y su lucha contra poderosos enemigos?', 'Hunter x Hunter', 'Dragon Ball Z', 'Naruto', 'Bleach');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre del protagonista en la serie de televisión "The Mandalorian"?', 'Din Djarin', 'Boba Fett', 'Han Solo', 'Mace Windu');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién escribió la saga de novelas "Dune", que posteriormente fue adaptada al cine y la televisión?', 'Frank Herbert', 'Isaac Asimov', 'Arthur C. Clarke', 'Philip K. Dick');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué universo cinematográfico se encuentra el personaje "Thanos"?', 'Marvel', 'DC Comics', 'Star Wars', 'Transformers');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre de la organización secreta en la película "Men in Black"?', 'MIB', 'CIA', 'FBI', 'SHIELD');
INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién pintó "El jardín de las delicias"?', 'Hieronymus Bosch', 'El Greco', 'Pieter Bruegel el Viejo', 'Jan van Eyck');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué movimiento artístico se enmarca la obra "La persistencia de la memoria" de Salvador Dalí?', 'Surrealismo', 'Cubismo', 'Impresionismo', 'Expresionismo');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el pintor de "La escuela de Atenas", una obra maestra del Renacimiento italiano?', 'Rafael Sanzio', 'Leonardo da Vinci', 'Michelangelo Buonarroti', 'Donatello');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué pintor se caracteriza por el uso del "dripping" o goteo en sus obras, como en "No. 5, 1948"?', 'Jackson Pollock', 'Mark Rothko', 'Willem de Kooning', 'Andy Warhol');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué ciudad se encuentra la "Galería Uffizi", famosa por su colección de arte renacentista?', 'Florencia', 'Roma', 'Venecia', 'Milán');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué artista fue el principal representante del estilo de pintura conocido como "cubismo"?', 'Pablo Picasso', 'Henri Matisse', 'Georges Braque', 'Juan Gris');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál de las siguientes obras fue pintada por Edvard Munch?', 'El grito', 'La joven de la perla', 'Las meninas', 'Guernica');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué artista famoso se asoció con el Movimiento de Arte Pop y fue conocido por sus retratos de celebridades y latas de sopa Campbell?', 'Andy Warhol', 'Roy Lichtenstein', 'Keith Haring', 'Robert Rauschenberg');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año se pintó "La última cena" de Leonardo da Vinci?', '1495-1498', '1505-1510', '1480-1485', '1520-1525');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué ciudad se encuentra la famosa obra "La noche estrellada" de Vincent van Gogh?', 'Nueva York', 'París', 'Ámsterdam', 'Londres');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué pintor barroco es famoso por su uso del claroscuro y obras como "La rendición de Breda"?', 'Diego Velázquez', 'Caravaggio', 'Rembrandt', 'Peter Paul Rubens');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién pintó el "Guernica", una obra emblemática del cubismo y el arte moderno?', 'Pablo Picasso', 'Juan Gris', 'Georges Braque', 'Fernand Léger');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué estilo artístico se caracteriza por un enfoque en el color y la luz, y fue popularizado por artistas como Claude Monet y Pierre-Auguste Renoir?', 'Impresionismo', 'Expresionismo', 'Surrealismo', 'Realismo');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué pintor del Renacimiento italiano creó la famosa obra "El nacimiento de Venus"?', 'Sandro Botticelli', 'Leonardo da Vinci', 'Michelangelo Buonarroti', 'Rafael Sanzio');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué famoso escultor italiano es conocido por sus esculturas de mármol, como "David" y "La piedad"?', 'Michelangelo Buonarroti', 'Donatello', 'Gian Lorenzo Bernini', 'Alberto Giacometti');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién es conocido como el "Padre del Impresionismo" en la pintura?', 'Édouard Manet', 'Claude Monet', 'Pierre-Auguste Renoir', 'Camille Pissarro');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué técnica de pintura se utiliza en las obras de "fresco" en las que los pigmentos se aplican sobre una capa de yeso fresco?', 'Frescos', 'Acuarelas', 'Óleo', 'Acrílico');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué pintor renacentista es conocido por sus retratos realistas y fue autor de "La Virgen de las rocas"?', 'Leonardo da Vinci', 'Rafael Sanzio', 'Giovanni Bellini', 'Botticelli');
INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el director de la película de culto "The Big Lebowski"?', 'Joel Coen', 'Quentin Tarantino', 'Martin Scorsese', 'David Lynch');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál fue el primer largometraje de Studio Ghibli?', 'Nausicaä del Valle del Viento', 'Mi vecino Totoro', 'El castillo en el cielo', 'La princesa Mononoke');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la serie "Breaking Bad", ¿qué tipo de cáncer padece Walter White?', 'Cáncer de pulmón', 'Leucemia', 'Cáncer de colon', 'Linfoma');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué banda sonora compuso John Williams para la película "Jurassic Park"?', 'Jurassic Park', 'E.T. el Extraterrestre', 'Star Wars: Una Nueva Esperanza', 'Indiana Jones');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año se estrenó la película "Donnie Darko"?', '2001', '1999', '2002', '2000');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué serie de televisión se mencionan por primera vez los "Osos Mowgli"?', 'Doctor Who', 'Sherlock', 'The Big Bang Theory', 'Lost');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre del personaje interpretado por Matt Damon en "El caso Bourne"?', 'Jason Bourne', 'Max DeCosta', 'Tommy Lee', 'Jack Ryan');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué escritor es conocido por crear la saga de "El Señor de los Anillos"?', 'J.R.R. Tolkien', 'C.S. Lewis', 'George R.R. Martin', 'J.K. Rowling');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué película dirigida por Stanley Kubrick es famosa por su tratamiento visual de la violencia y la cultura juvenil?', 'La naranja mecánica', '2001: Una odisea del espacio', 'El resplandor', 'Barry Lyndon');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En la película "Matrix", cuál es el nombre del mentor de Neo?', 'Morpheus', 'Trinity', 'Agent Smith', 'The Oracle');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué serie de televisión gira en torno a un instituto para jóvenes con habilidades especiales, creado por el profesor Charles Xavier?', 'X-Men: La serie animada', 'The Boys', 'Umbrella Academy', 'Titans');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién interpretó a Joker en "The Dark Knight" (2008)?', 'Heath Ledger', 'Jared Leto', 'Jack Nicholson', 'Mark Hamill');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año se estrenó la serie "Twin Peaks" dirigida por David Lynch?', '1990', '1992', '1989', '1994');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué actriz ganó el Óscar a la Mejor Actriz por su papel en "Reina Cristina de Suecia" (1933)?', 'Greta Garbo', 'Meryl Streep', 'Bette Davis', 'Jodie Foster');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la película "Inception", ¿quién interpreta al personaje de Cobb?', 'Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Tom Hardy', 'Cillian Murphy');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué serie de culto aparece el personaje "Don Draper"?', 'Mad Men', 'The Sopranos', 'The Wire', 'Breaking Bad');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre del personaje principal en la película "American Psycho"?', 'Patrick Bateman', 'Don Draper', 'Tyler Durden', 'Jack Torrance');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En la película "The Truman Show", qué actor interpreta a Truman Burbank?', 'Jim Carrey', 'Steve Carell', 'Will Ferrell', 'Adam Sandler');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué escritor es el autor de "Fahrenheit 451"?', 'Ray Bradbury', 'George Orwell', 'Aldous Huxley', 'Margaret Atwood');
INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué zar ruso fue conocido por su reforma de la administración y su modernización de Rusia en el siglo XVIII, incluida la fundación de San Petersburgo?', 'Pedro el Grande', 'Iván IV el Terrible', 'Alejandro II', 'Catalina la Grande');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué evento histórico desencadenó la Revolución Rusa de 1917?', 'La Revolución de Febrero', 'La guerra ruso-japonesa', 'La Revolución de Octubre', 'La masacre de Bloody Sunday');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el líder de la Revolución de Octubre y primer líder de la Unión Soviética?', 'Vladimir Lenin', 'León Trotsky', 'José Stalin', 'Mijaíl Gorbachov');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué tratado puso fin a la participación de Rusia en la Primera Guerra Mundial?', 'Tratado de Brest-Litovsk', 'Tratado de Versalles', 'Tratado de Trianon', 'Tratado de Saint-Germain');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué líder ruso fue responsable de la purga política conocida como el "Gran Terror" durante la década de 1930?', 'José Stalin', 'León Trotsky', 'Nikita Jrushchov', 'Vladimir Lenin');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año se fundó la Unión Soviética?', '1922', '1917', '1939', '1945');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué zar ruso abdicó durante la Revolución de Febrero en 1917?', 'Nicolás II', 'Alejandro II', 'Pedro III', 'Iván IV');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el principal rival de Stalin durante los primeros años del régimen soviético antes de ser exiliado?', 'León Trotsky', 'Nikita Jrushchov', 'Andréi Zhdánov', 'Vladimir Lenin');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué evento marcó el fin de la Guerra Fría?', 'La caída del Muro de Berlín', 'La Revolución Rusa', 'La invasión de Afganistán por la URSS', 'La crisis de los misiles en Cuba');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál fue el principal resultado de la Revolución Rusa de 1917 en términos de organización política?', 'El derrocamiento del zarismo y la creación de un gobierno bolchevique', 'La instauración de la dictadura de Stalin', 'La firma de la paz con Alemania', 'La derrota de los Mencheviques y el establecimiento de una monarquía constitucional');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué líder soviético introdujo el programa de reformas conocido como "glasnost" y "perestroika" durante la década de 1980?', 'Mijaíl Gorbachov', 'Leonid Brézhnev', 'Nikita Jrushchov', 'Yuri Andrópov');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué ciudad fue el centro de la resistencia a la invasión nazi durante el Sitio de Leningrado en la Segunda Guerra Mundial?', 'Leningrado (San Petersburgo)', 'Moscú', 'Stalingrado', 'Kiev');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año se disolvió oficialmente la Unión Soviética?', '1991', '1989', '1993', '1985');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál fue el objetivo del "Gulag" soviético?', 'Sistema de campos de trabajo forzado', 'Sistema de educación política', 'Centro de investigación científica', 'Red de hospitales psiquiátricos');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué evento marcó la "Crisis de los Misiles en Cuba" de 1962?', 'El descubrimiento de misiles nucleares soviéticos en Cuba', 'El derrocamiento de Nikita Jrushchov', 'El lanzamiento del primer satélite Sputnik', 'La invasión soviética de Afganistán');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué tratado internacional de 1975 buscaba reducir las tensiones entre el bloque soviético y el bloque occidental?', 'Acuerdos de Helsinki', 'Tratado de París', 'Pacto de Varsovia', 'Tratado de no proliferación nuclear');
INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el determinante de una matriz 2x2 con elementos a, b, c, d?', 'ad - bc', 'a + b + c + d', 'ac - bd', 'ab - cd');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el rango de una matriz de 3x3 con filas linealmente dependientes?', 'Menor que 3', 'Igual a 3', 'Igual a 2', 'Igual a 1');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cómo se llama el proceso mediante el cual una matriz cuadrada se descompone en una multiplicación de una matriz triangular superior y una matriz triangular inferior?', 'Descomposición LU', 'Descomposición QR', 'Descomposición SVD', 'Descomposición Eigen');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Si una matriz tiene un determinante igual a 0, ¿qué se puede decir sobre sus columnas?', 'Son linealmente dependientes', 'Son ortogonales', 'Son linealmente independientes', 'Forman una base ortonormal');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué es una matriz ortogonal?', 'Una matriz cuya inversa es igual a su transpuesta', 'Una matriz con todos sus elementos positivos', 'Una matriz cuya determinante es igual a 1', 'Una matriz cuadrada con eigenvalores reales');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué es un valor propio (eigenvalor) de una matriz A?', 'Un escalar \(\lambda\) tal que Av = \(\lambda v\)', 'Una constante que representa la diagonal de la matriz', 'Un número que multiplica el determinante de la matriz', 'Una transformación de la matriz en una forma diagonal');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la condición para que una matriz cuadrada sea diagonalizable?', 'Debe tener un número suficiente de vectores propios linealmente independientes', 'Debe tener determinante igual a 1', 'Debe ser una matriz ortogonal', 'Debe ser invertible');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Si una matriz tiene un valor propio de 0, ¿qué se puede decir sobre la matriz?', 'Es singular', 'Es invertible', 'Es ortogonal', 'Es una matriz de rotación');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En álgebra lineal, ¿cuál es la definición de una transformación lineal?', 'Una función que preserva la adición y la multiplicación por escalares', 'Una función que transforma vectores en otros vectores con la misma magnitud', 'Una función que preserva solo la adición de vectores', 'Una función que no tiene valores propios');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la dimensión del espacio nulo de una matriz de 3x3 si su rango es 2?', '1', '2', '0', '3');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué representa el producto cruzado de dos vectores en el espacio tridimensional?', 'Un vector perpendicular a los dos vectores originales', 'El área de un paralelogramo definido por los dos vectores', 'La magnitud del ángulo entre los dos vectores', 'La longitud del vector resultante');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cómo se denomina el proceso de descomposición de una matriz cuadrada en una matriz diagonal y una matriz de eigenvectores?', 'Descomposición espectral', 'Descomposición LU', 'Descomposición QR', 'Descomposición SVD');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué es una matriz simétrica?', 'Una matriz que es igual a su transpuesta', 'Una matriz cuyo determinante es igual a 1', 'Una matriz con todas las filas iguales', 'Una matriz cuyo rango es igual a su orden');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué propiedad tiene el determinante de una matriz producto de dos matrices A y B?', 'Es el producto de los determinantes de A y B', 'Es la suma de los determinantes de A y B', 'Es el determinante de la transpuesta de A multiplicado por el determinante de B', 'Es igual al determinante de A si B es la inversa de A');
INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué tipo de enlace químico es característico de los materiales cerámicos?', 'Enlace iónico', 'Enlace covalente', 'Enlace metálico', 'Enlace dativo');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el principio fundamental detrás de la fabricación de materiales compuestos?', 'La combinación de dos o más materiales con propiedades distintas para obtener un material con mejores propiedades', 'La aleación de metales para mejorar la conductividad', 'La utilización de polímeros como matrices plásticas', 'El recubrimiento de materiales con sustancias más resistentes');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la teoría de bandas de sólidos, ¿qué distingue a los conductores de los aislantes?', 'La banda de conducción está parcialmente ocupada en los conductores, mientras que en los aislantes está completamente vacía', 'Los conductores tienen una alta densidad de átomos, mientras que los aislantes tienen una baja densidad de átomos', 'Los conductores tienen un mayor número de electrones libres en la capa de valencia', 'Los conductores tienen átomos con alta electronegatividad');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué material es conocido por su excelente conductividad eléctrica y se utiliza comúnmente en cables eléctricos?', 'Cobre', 'Silicio', 'Aluminio', 'Oro');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la principal ventaja de los materiales poliméricos frente a los metálicos en la industria?', 'Ligereza y facilidad de conformado', 'Alta conductividad térmica', 'Alta resistencia a la tracción', 'Resistencia a la corrosión');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En términos de estructura cristalina, ¿qué tipo de empacamiento tienen los cristales de un material metálico con la estructura FCC (cúbica centrada en las caras)?', 'Cerrado y denso', 'Alineación en filas rectas', 'Estructura hexagonal', 'Estructura aleatoria');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué proceso de fabricación de materiales involucra el enfriamiento rápido de un metal fundido para obtener una estructura amorfa?', 'Solidificación rápida (metal amorfo)', 'Horno de inducción', 'Sinterización', 'Fundición en arena');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué es un polímero termoplástico?', 'Un polímero que se puede moldear y remoldear repetidamente con calor', 'Un polímero que no se puede derretir', 'Un polímero que se descompone a temperaturas muy altas', 'Un polímero con enlaces covalentes muy fuertes');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el principio de funcionamiento de una batería de iones de litio?', 'La transferencia de iones de litio entre los electrodos durante la carga y descarga', 'La conversión de energía térmica en energía eléctrica', 'La generación de energía mediante reacciones nucleares', 'La liberación de electrones a través de un proceso de oxidación');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál de las siguientes propiedades es más importante para los materiales superconductores?', 'La capacidad de conducir electricidad sin resistencia a temperaturas extremadamente bajas', 'La alta resistencia al impacto', 'La alta capacidad de absorción de radiación', 'La capacidad de cambiar de forma bajo esfuerzo');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué tipo de material se utiliza comúnmente como semiconductor en la industria electrónica?', 'Silicio', 'Oro', 'Cobre', 'Titanio');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué proceso es utilizado para producir acero de alta calidad a partir de chatarra reciclada?', 'Horno eléctrico de arco', 'Forja en caliente', 'Sinterización', 'Colada continua');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué material es conocido por su alta resistencia a la corrosión y es utilizado comúnmente en ambientes marinos?', 'Acero inoxidable', 'Cobre', 'Titanio', 'Aluminio');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En términos de ciencia de materiales, ¿qué significa el término “sinterización”?', 'El proceso de compactar y calentar polvos metálicos o cerámicos hasta que se fusionan parcialmente', 'El proceso de fundir metales y permitir que se enfríen lentamente', 'La formación de materiales cristalinos mediante enfriamiento rápido', 'El proceso de adición de impurezas para cambiar las propiedades mecánicas de un material');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué es un material piezoeléctrico?', 'Un material que genera una carga eléctrica cuando se le somete a una tensión mecánica', 'Un material que cambia su color al recibir luz ultravioleta', 'Un material que mejora la eficiencia de los motores eléctricos', 'Un material que es insensible a las variaciones térmicas');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el tipo de enlace predominante en los materiales cerámicos?', 'Enlace iónico y covalente', 'Enlace metálico', 'Enlace covalente', 'Enlace iónico');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En química de materiales, ¿qué significa el término “ductilidad”?', 'La capacidad de un material para estirarse sin romperse', 'La capacidad de un material para resistir la compresión', 'La capacidad de un material para soportar temperaturas extremas', 'La capacidad de un material para ser moldeado sin perder su forma');
INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Somalia?', 'Mogadiscio', 'Addis Abeba', 'Nairobi', 'Dakar');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Burkina Faso?', 'Uagadugú', 'Bamako', 'Ouagadougou', 'Accra');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué ciudad es la capital de Guinea Ecuatorial?', 'Malabo', 'Libreville', 'Banjul', 'Yaoundé');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Cabo Verde?', 'Praia', 'Bissau', 'Dakar', 'Conakry');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué ciudad es la capital de Tanzania?', 'Dodoma', 'Dar es Salaam', 'Kigali', 'Maputo');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Malaui?', 'Lilongüe', 'Lusaka', 'Harare', 'Addis Abeba');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Namibia?', 'Windhoek', 'Gaborone', 'Lusaka', 'Maputo');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Chad?', 'N’Djamena', 'Douala', 'Kinshasa', 'Brazzaville');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué ciudad es la capital de Burundi?', 'Gitega', 'Bujumbura', 'Kigali', 'Lomé');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de la República Democrática del Congo?', 'Kinshasa', 'Brazzaville', 'Luanda', 'Harare');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué ciudad es la capital de Uganda?', 'Kampala', 'Nairobi', 'Kigali', 'Addis Abeba');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Liberia?', 'Monrovia', 'Accra', 'Freetown', 'Abuja');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué ciudad es la capital de Zimbabue?', 'Harare', 'Lusaka', 'Maputo', 'Lilongüe');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Egipto?', 'El Cairo', 'Rabat', 'Túnez', 'Argel');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué ciudad es la capital de Angola?', 'Luanda', 'Maputo', 'Windhoek', 'Addis Abeba');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Seychelles?', 'Victoria', 'Port Louis', 'Antananarivo', 'Banjul');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Eritrea?', 'Asmara', 'Khartum', 'Addis Abeba', 'Bujumbura');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué ciudad es la capital de Malawi?', 'Lilongüe', 'Lusaka', 'Kigali', 'Harare');
INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el último zar de Rusia?', 'Nicolás II', 'Alejandro III', 'Pedro el Grande', 'Iván el Terrible');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué batalla decisiva se libró el enfrentamiento final entre los aliados y las fuerzas del Tercer Reich en 1944?', 'Batalla de Normandía', 'Batalla de Berlín', 'Batalla de Stalingrado', 'Batalla de las Ardenas');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el primer emperador de China?', 'Qin Shi Huang', 'Han Wudi', 'Liu Bang', 'Zhao Tuo');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué tratado puso fin a la Primera Guerra Mundial?', 'Tratado de Versalles', 'Tratado de París', 'Tratado de Ginebra', 'Tratado de Tordesillas');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año cayó Constantinopla ante el Imperio Otomano?', '1453', '1492', '1204', '1521');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué dinastía china gobernó desde 1368 hasta 1644?', 'Ming', 'Qing', 'Tang', 'Song');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué rey de Inglaterra fue conocido por su ruptura con la Iglesia Católica y su creación de la Iglesia de Inglaterra?', 'Enrique VIII', 'Ricardo III', 'Eduardo III', 'Carlos I');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el líder militar carismático de la Revolución Francesa que llegó a ser emperador de Francia?', 'Napoleón Bonaparte', 'Robespierre', 'Danton', 'Marat');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué imperio sufrió la invasión de los mongoles en el siglo XIII?', 'Imperio Rumano', 'Imperio del Sacro Imperio Romano Germánico', 'Imperio Bizantino', 'Imperio Persa');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué batalla fue derrotado Napoleón Bonaparte en 1815?', 'Batalla de Waterloo', 'Batalla de Leipzig', 'Batalla de Austerlitz', 'Batalla de Trafalgar');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué país fue el primer en conceder el voto a las mujeres en 1893?', 'Nueva Zelanda', 'Finlandia', 'Estados Unidos', 'Australia');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué país fue invadido por los nazis en 1940 en una de las primeras etapas de la Segunda Guerra Mundial?', 'Dinamarca', 'Francia', 'Polonia', 'Bélgica');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué antigua ciudad fue destruida por una erupción volcánica en el año 79 d.C.?', 'Pompeya', 'Roma', 'Atenas', 'Carthago');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué batalla histórica se libró la primera gran victoria naval de la flota estadounidense durante la Guerra de Independencia?', 'Batalla de Saratoga', 'Batalla de Yorktown', 'Batalla de Bunker Hill', 'Batalla de la Bahía de Chesapeake');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el presidente de los Estados Unidos durante la Guerra Civil?', 'Abraham Lincoln', 'George Washington', 'Thomas Jefferson', 'Andrew Johnson');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué civilización precolombina construyó las famosas líneas de Nazca en Perú?', 'Nazca', 'Azteca', 'Maya', 'Inca');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué famoso filósofo griego fundó la escuela de pensamiento conocida como el "Estoicismo"?', 'Zenón de Citio', 'Platón', 'Aristóteles', 'Epicurio');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué imperio del antiguo Medio Oriente fue derrotado por Alejandro Magno en la Batalla de Gaugamela?', 'Imperio Persa', 'Imperio Romano', 'Imperio Egipcio', 'Imperio Macedonio');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año se estrenó la película "Blade Runner 2049"?', '2017', '2015', '2018', '2016');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién escribió el guion original de la película "Pulp Fiction"?', 'Quentin Tarantino', 'Martin Scorsese', 'Francis Ford Coppola', 'Steven Spielberg');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué famosa serie de televisión de ciencia ficción tiene un episodio titulado "San Junipero"?', 'Black Mirror', 'Stranger Things', 'The Twilight Zone', 'The X-Files');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué ciudad se desarrolla la mayor parte de la serie "Breaking Bad"?', 'Albuquerque', 'Los Ángeles', 'Chicago', 'Dallas');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el director de la película "El Laberinto del Fauno"?', 'Guillermo del Toro', 'Alejandro González Iñárritu', 'Alfonso Cuarón', 'Pedro Almodóvar');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué banda de rock lanzó el álbum "Abbey Road" en 1969?', 'The Beatles', 'The Rolling Stones', 'Led Zeppelin', 'Pink Floyd');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año se lanzó la serie de televisión "Friends"?', '1994', '1992', '1996', '1998');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el creador de la serie de televisión "The Simpsons"?', 'Matt Groening', 'Seth MacFarlane', 'Dan Harmon', 'Trey Parker');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué actor interpretó a "The Joker" en la película "The Dark Knight" de 2008?', 'Heath Ledger', 'Jared Leto', 'Jack Nicholson', 'Tom Hardy');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué videojuego popular fue creado por el estudio Blizzard Entertainment en 1998?', 'StarCraft', 'Warcraft', 'Diablo', 'Overwatch');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué película de Disney se estrenó en 1994 y presenta a un joven león llamado Simba?', 'El Rey León', 'La Bella y la Bestia', 'Aladdín', 'Cenicienta');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué banda de música fue fundada por Freddie Mercury en 1970?', 'Queen', 'Led Zeppelin', 'The Rolling Stones', 'The Who');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año se estrenó el primer episodio de la serie "Stranger Things"?', '2016', '2015', '2017', '2018');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el compositor de la famosa banda sonora de la película "Star Wars"?', 'John Williams', 'Hans Zimmer', 'Danny Elfman', 'Ennio Morricone');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué famosa película de ciencia ficción fue dirigida por Ridley Scott en 1982?', 'Blade Runner', 'Alien', 'The Terminator', '2001: A Space Odyssey');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué serie de televisión popular está ambientada en la ciudad ficticia de Hawkins, Indiana?', 'Stranger Things', 'The X-Files', 'Supernatural', 'Twin Peaks');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué famoso programa de televisión de concursos fue presentado por Alex Trebek?', 'Jeopardy!', 'Wheel of Fortune', 'Family Feud', 'The Price is Right');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué película de Quentin Tarantino aparece el personaje de "Uma Thurman" conocido como "The Bride"?', 'Kill Bill', 'Pulp Fiction', 'Inglourious Basterds', 'Django Unchained');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué escritor es conocido por la novela "1984" y "Rebelión en la granja"?', 'George Orwell', 'Aldous Huxley', 'Ray Bradbury', 'Philip K. Dick');
INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Bután?', 'Thimphu', 'Paro', 'Phuntsholing', 'Wangdue Phodrang');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué continente se encuentra el monte Kilimanjaro?', 'África', 'Asia', 'América', 'Oceanía');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué país tiene más islas en el mundo?', 'Suecia', 'Canadá', 'Finlandia', 'Noruega');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país se encuentra el Desierto de Atacama?', 'Chile', 'Perú', 'Argentina', 'Bolivia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Mongolia?', 'Ulán Bator', 'Almatý', 'Tashkent', 'Astana');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué océano limita al este de Australia?', 'Océano Pacífico', 'Océano Atlántico', 'Océano Índico', 'Océano Ártico');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país se encuentra la región de los Alpes Suizos?', 'Suiza', 'Austria', 'Francia', 'Italia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la ciudad más grande de Brasil?', 'São Paulo', 'Río de Janeiro', 'Brasilia', 'Salvador');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué país es el hogar del lago Baikal, el lago más profundo del mundo?', 'Rusia', 'Kazajistán', 'China', 'Mongolia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre del desierto que se extiende por gran parte de Egipto y Libia?', 'Desierto del Sahara', 'Desierto de Kalahari', 'Desierto de Atacama', 'Desierto de Sonora');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué país tiene la mayor cantidad de fronteras internacionales?', 'Rusia', 'China', 'Brasil', 'India');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país se encuentran las ruinas de la antigua ciudad de Petra?', 'Jordania', 'Egipto', 'Siria', 'Irak');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué isla es la más grande del Caribe?', 'Cuba', 'Hispaniola', 'Jamaica', 'Puerto Rico');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Sri Lanka?', 'Sri Jayawardenepura Kotte', 'Colombo', 'Malé', 'Dhaka');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué río es el más largo de América del Sur?', 'El Amazonas', 'El Paraná', 'El Orinoco', 'El São Francisco');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué país tiene dos capitales, una administrativa y otra constitucional?', 'Bolivia', 'Sudáfrica', 'Malasia', 'Países Bajos');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué país africano tiene más de 1.000 idiomas reconocidos?', 'Papúa Nueva Guinea', 'Níger', 'Congo', 'Nigeria');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la capital de Uzbekistán?', 'Tashkent', 'Bishkek', 'Almatý', 'Dushanbe');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué país se encuentra el Monte Everest?', 'Nepal', 'Tíbet', 'Pakistán', 'China');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué país está formado por más de 17,000 islas?', 'Indonesia', 'Filipinas', 'Malasia', 'Japón');
INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién pintó "Las Meninas"?', 'Diego Velázquez', 'Francisco de Goya', 'El Greco', 'Bartolomé Esteban Murillo');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué ciudad se encuentra la famosa pintura "La Última Cena" de Leonardo da Vinci?', 'Milán', 'Roma', 'Florencia', 'Venecia');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el movimiento artístico al que pertenece la obra "El Grito" de Edvard Munch?', 'Expresionismo', 'Impresionismo', 'Cubismo', 'Surrealismo');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué pintor español es conocido por sus obras surrealistas como "La Persistencia de la Memoria"?', 'Salvador Dalí', 'Pablo Picasso', 'Joan Miró', 'Luis Buñuel');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué año se completó la Capilla Sixtina por Miguel Ángel?', '1512', '1498', '1543', '1525');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué pintor italiano es conocido por su obra "La Escuela de Atenas"?', 'Rafael', 'Leonardo da Vinci', 'Caravaggio', 'Donatello');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre del famoso pintor de la obra "Guernica"?', 'Pablo Picasso', 'Vincent van Gogh', 'Claude Monet', 'Henri Matisse');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué artista es famoso por el cuadro "La noche estrellada"?', 'Vincent van Gogh', 'Edvard Munch', 'Claude Monet', 'Édouard Manet');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué movimiento artístico está asociado con el uso de formas geométricas y la abstracción, siendo Picasso uno de sus principales exponentes?', 'Cubismo', 'Impresionismo', 'Surrealismo', 'Futurismo');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién pintó "La joven de la perla"?', 'Johannes Vermeer', 'Rembrandt', 'Francisco de Goya', 'Jan van Eyck');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué artista pintó el famoso fresco "El juicio final" en la Capilla Sixtina?', 'Miguel Ángel', 'Rafael', 'Leonardo da Vinci', 'Caravaggio');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué movimiento artístico es conocido por sus obras llenas de colores brillantes y formas simplificadas, como las de Marc Chagall?', 'Expresionismo', 'Surrealismo', 'Fauvismo', 'Cubismo');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién es el creador de la famosa obra "El jardín de las delicias"?', 'Hieronymus Bosch', 'El Greco', 'Giotto', 'Pieter Bruegel');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué artista pintó la obra "Las tres edades de la mujer"?', 'Gustav Klimt', 'Egon Schiele', 'Henri Toulouse-Lautrec', 'Alfred Sisley');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién fue el creador del famoso retrato de "La Gioconda"?', 'Leonardo da Vinci', 'Rafael', 'Michelangelo Buonarroti', 'Vincent van Gogh');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué ciudad se encuentra el museo "El Prado", que alberga obras de artistas como Velázquez y Goya?', 'Madrid', 'Barcelona', 'Sevilla', 'Valencia');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué pintor holandés es conocido por su obra "La ronda de noche"?', 'Rembrandt', 'Vincent van Gogh', 'Jan Vermeer', 'Pieter Bruegel');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Quién pintó "Las Meninas", una de las obras más famosas del arte español?', 'Diego Velázquez', 'El Greco', 'Francisco de Goya', 'Bartolomé Esteban Murillo');
INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál de las siguientes comarcas de Cataluña está situada en la provincia de Girona?', 'El Empordà', 'Bages', 'Vallès Oriental', 'Baix Penedès');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué comarca catalana se encuentra el Parque Nacional de Aigüestortes i Estany de Sant Maurici?', 'Alta Ribagorça', 'Cerdanya', 'Berguedà', 'Pallars Sobirà');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la comarca más poblada de Cataluña?', 'Vallès Occidental', 'Barcelonès', 'Tarragonès', 'Girona');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué comarca de la provincia de Lleida es famosa por su producción de frutas, especialmente peras y manzanas?', 'El Segrià', 'Pla dUrgell', 'Garrigues', 'Urgell');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué comarca catalana limita con las comarcas de Anoia, Bages y Berguedà?', 'Moianès', 'Baix Llobregat', 'Garraf', 'Vallès Oriental');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué comarca se encuentra en la costa norte de la provincia de Tarragona, conocida por su paisaje vinícola y su puerto pesquero?', 'Baix Ebre', 'Montsià', 'Tarragonès', 'Baix Penedès');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué comarca catalana se encuentra la famosa ciudad de Figueres, cuna de Salvador Dalí?', 'Alt Empordà', 'Baix Empordà', 'Gironès', 'Selva');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál de las siguientes comarcas pertenece a la provincia de Barcelona?', 'Anoia', 'Alt Empordà', 'Baix Penedès', 'Alt Urgell');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué comarca de Tarragona se encuentran las famosas playas de la Costa Dorada?', 'Baix Penedès', 'Baix Ebre', 'Montsià', 'Alt Camp');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué comarca de la provincia de Lleida se encuentra la ciudad de Balaguer?', 'Noguera', 'Segrià', 'Garrigues', 'Pla dUrgell');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué comarca pertenece a la provincia de Girona y es conocida por su patrimonio medieval, como el monasterio de Sant Pere de Rodes?', 'Alt Empordà', 'Selva', 'Baix Empordà', 'Gironès');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué comarca de Cataluña es famosa por ser la cuna del modernismo y tener un importante patrimonio arquitectónico como la Casa Batlló?', 'Vallès Occidental', 'Baix Llobregat', 'Barcelona', 'Garraf');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué comarca de Cataluña se encuentra la ciudad de Reus, famosa por ser la ciudad natal de Antoni Gaudí?', 'Baix Camp', 'Conca de Barberà', 'Priorat', 'Alt Camp');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué comarca de la provincia de Barcelona se encuentra el Parque Natural de la Sierra de Collserola?', 'Vallès Occidental', 'Baix Llobregat', 'Anoia', 'Maresme');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué comarca catalana limita con el mar Mediterráneo y es conocida por sus bellas playas y el Delta del Ebro?', 'Montsià', 'Baix Penedès', 'Selva', 'Alt Empordà');
INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el valor aproximado de la constante de Planck?', '6.626 × 10^-34 J·s', '1.602 × 10^-19 J', '9.8 m/s^2', '3.14');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué fenómeno físico es descrito por la ecuación de Schrödinger en mecánica cuántica?', 'La evolución temporal de una función de onda', 'El comportamiento de los fluidos', 'La ley de la gravitación universal', 'La relatividad general');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el principal mecanismo por el cual las células eucariotas generan ATP?', 'Quimiosmosis en las mitocondrias', 'Fosforilación en el citoplasma', 'Transporte activo en la membrana', 'Fermentación en el núcleo');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué teoría describe el origen de la vida en la Tierra a partir de moléculas simples que evolucionaron hacia formas más complejas?', 'Teoría de la abiogénesis', 'Teoría del Big Bang', 'Teoría de la evolución de Lamarck', 'Teoría del diseño inteligente');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el nombre del principio físico que establece que la energía no puede ser creada ni destruida, solo transformada?', 'Ley de conservación de la energía', 'Teoría de la relatividad', 'Ley de los gases ideales', 'Principio de incertidumbre de Heisenberg');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cómo se llama la constante que describe la aceleración de un objeto en caída libre cerca de la superficie terrestre?', 'Aceleración debida a la gravedad (g)', 'Constante de Planck (h)', 'Velocidad de la luz (c)', 'Constante universal de gravitación (G)');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué propiedad química define la cantidad de moles de soluto presentes en un litro de solución?', 'Molaridad', 'Molalidad', 'Normalidad', 'Fracción molar');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué experimento demostró la dualidad onda-partícula de la luz?', 'Experimento de la doble rendija', 'Experimento de Cavendish', 'Experimento de Rutherford', 'Experimento de Millikan');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la partícula subatómica responsable de la carga positiva en el núcleo de los átomos?', 'Protón', 'Neutrón', 'Electrón', 'Quark');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué es el "colapso de la función de onda" en mecánica cuántica?', 'La transición de una función de onda a un estado específico cuando se realiza una medición', 'El paso de la materia de estado sólido a líquido', 'La liberación de energía al hacer colapsar un átomo', 'El proceso de aceleración de partículas a altas velocidades');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Qué es el Principio de Exclusión de Pauli?', 'No puede haber dos electrones en un átomo con los mismos números cuánticos', 'El momento de inercia de un objeto depende de su masa', 'La energía no se crea ni se destruye', 'El spin de los electrones afecta a su ubicación en la órbita');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es el fenómeno que describe el cambio en la frecuencia de una onda a medida que su fuente se aleja o acerca?', 'Efecto Doppler', 'Ley de Coulomb', 'Ley de Ohm', 'Efecto Joule');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué consisten las "vibraciones libres" de un sistema mecánico?', 'Oscilaciones en las que el sistema oscila a su frecuencia natural sin intervención externa', 'Oscilaciones causadas por un estímulo periódico', 'El cambio en la temperatura de un sistema', 'El proceso de intercambio de energía térmica');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿Cuál es la ecuación que describe la ley de los gases ideales?', 'PV = nRT', 'F = ma', 'E = mc^2', 'V = IR');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('¿En qué parte de la célula eucariota se lleva a cabo la síntesis de proteínas?', 'Ribosomas', 'Mitocondrias', 'Núcleo', 'Lisósomas');
