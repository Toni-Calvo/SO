USE T7BBDD;


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
VALUES ('Quien fue el primer presidente de los Estados Unidos?', 'George Washington', 'Abraham Lincoln', 'Thomas Jefferson', 'Benjamin Franklin');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano cayo el Muro de Berlin?', '1989', '1991', '1985', '1979');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais se inicio la Revolucion Industrial?', 'Inglaterra', 'Francia', 'Alemania', 'Estados Unidos');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien escribio "El Quijote"?', 'Miguel de Cervantes', 'Federico Garcia Lorca', 'Gabriel Garcia Marquez', 'Julio Cortazar');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el lider de los nazis durante la Segunda Guerra Mundial?', 'Adolf Hitler', 'Winston Churchill', 'Joseph Stalin', 'Benito Mussolini');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual fue el imperio que construyo la Gran Muralla China?', 'Imperio Chino', 'Imperio Mongol', 'Imperio Persa', 'Imperio Bizantino');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien descubrio America?', 'Cristobal Colon', 'Fernando de Magallanes', 'Marco Polo', 'Americo Vespucio');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual fue el conflicto belico mas extenso del siglo XX?', 'Segunda Guerra Mundial', 'Primera Guerra Mundial', 'Guerra de Vietnam', 'Guerra Fria');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano comenzo la Primera Guerra Mundial?', '1914', '1920', '1918', '1939');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que emperador romano legalizo el cristianismo?', 'Constantino', 'Neron', 'Augusto', 'Julio Cesar');
INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien pinto "La Ultima Cena"?', 'Leonardo da Vinci', 'Miguel Angel', 'Rafael', 'Tiziano');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la obra mas famosa de William Shakespeare?', 'Hamlet', 'La Odisea', 'El Principito', 'Don Quijote');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que artista es famoso por pintar girasoles?', 'Vincent van Gogh', 'Pablo Picasso', 'Salvador Dali', 'Claude Monet');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien es el autor de "Cien anos de soledad"?', 'Gabriel Garcia Marquez', 'Mario Vargas Llosa', 'Isabel Allende', 'Jorge Luis Borges');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que estilo artistico desarrollo Picasso?', 'Cubismo', 'Impresionismo', 'Surrealismo', 'Realismo');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien pinto "La persistencia de la memoria"?', 'Salvador Dali', 'Pablo Picasso', 'Claude Monet', 'Francisco de Goya');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual de estos es un pintor impresionista?', 'Claude Monet', 'Vincent van Gogh', 'Andy Warhol', 'Leonardo da Vinci');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais nacio Frida Kahlo?', 'Mexico', 'Espana', 'Argentina', 'Chile');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre de la famosa estatua sin brazos que se encuentra en el Louvre?', 'Venus de Milo', 'David de Miguel Angel', 'Victoria de Samotracia', 'Diana de Versalles');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien pinto "La noche estrellada"?', 'Vincent van Gogh', 'Salvador Dali', 'Edvard Munch', 'Henri Matisse');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el planeta mas grande del sistema solar?', 'Jupiter', 'Marte', 'Tierra', 'Venus');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que tipo de animal es un ornitorrinco?', 'Mamifero', 'Ave', 'Reptil', 'Anfibio');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el elemento quimico con el simbolo "O"?', 'Oxigeno', 'Oro', 'Osmio', 'Oxido');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el animal terrestre mas rapido?', 'Guepardo', 'Leon', 'Tigre', 'Antilope');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que cientifico propuso la teoria de la relatividad?', 'Albert Einstein', 'Isaac Newton', 'Galileo Galilei', 'Nikola Tesla');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la unidad basica de la vida?', 'Celula', 'Molecula', 'Atomo', 'Organelo');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que planeta es conocido como el "Planeta Rojo"?', 'Marte', 'Saturno', 'Venus', 'Jupiter');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que particula tiene una carga negativa?', 'Electron', 'Protones', 'Neutrones', 'Iones');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el metal mas ligero?', 'Litio', 'Mercurio', 'Oro', 'Plata');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la molecula que transporta la informacion genetica?', 'ADN', 'ARN', 'Proteina', 'Carbohidrato');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el pais mas grande de Africa en terminos de superficie?', 'Argelia', 'Sudan', 'Republica Democratica del Congo', 'Libia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Mongolia?', 'Ulan Bator', 'Almaty', 'Baku', 'Dushanbe');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais se encuentra el desierto de Atacama?', 'Chile', 'Argentina', 'Peru', 'Bolivia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el pais con mas islas en el mundo?', 'Suecia', 'Filipinas', 'Indonesia', 'Noruega');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el rio mas largo de Europa?', 'Volga', 'Danubio', 'Rin', 'Elba');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la ciudad mas poblada de Africa?', 'Lagos', 'El Cairo', 'Kinshasa', 'Johannesburgo');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais se encuentra la Cordillera de los Pirineos?', 'Espana y Francia', 'Italia y Suiza', 'Portugal y Espana', 'Alemania y Francia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el pais mas montanoso del mundo?', 'Nepal', 'Suiza', 'Chile', 'Canada');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais se encuentra la ciudad de San Petersburgo?', 'Rusia', 'Polonia', 'Finlandia', 'Estonia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el archipielago mas grande del mundo en terminos de area?', 'Indonesia', 'Filipinas', 'Maldivas', 'Japon');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el pais sin litoral mas grande en terminos de superficie?', 'Kazajistan', 'Mongolia', 'Afganistan', 'Niger');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pais tiene frontera con el mayor numero de otros paises?', 'China', 'Brasil', 'Rusia', 'India');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais se encuentra el Lago Baikal, el lago de agua dulce mas profundo del mundo?', 'Rusia', 'Canada', 'China', 'Finlandia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el volcan mas alto del mundo?', 'Ojos del Salado', 'Monte Etna', 'Monte Fuji', 'Mauna Kea');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Butan?', 'Thimphu', 'Katmandu', 'Islamabad', 'Yakarta');
INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien dirigio la pelicula "2001: Una odisea del espacio"?', 'Stanley Kubrick', 'Steven Spielberg', 'Francis Ford Coppola', 'George Lucas');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que videojuego popular de 1980 presenta a un personaje que debe comerse puntos en un laberinto mientras evita fantasmas?', 'Pac-Man', 'Donkey Kong', 'Galaga', 'Asteroids');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano se lanzo el album "Thriller" de Michael Jackson?', '1982', '1979', '1985', '1990');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pelicula gano el primer premio Oscar a Mejor Pelicula en 1929?', 'Wings', 'Sunrise', 'The Broadway Melody', 'All Quiet on the Western Front');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien escribio la novela "Crimen y castigo"?', 'Fiodor Dostoyevski', 'Leon Tolstoi', 'Vladimir Nabokov', 'Anton Chejov');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la serie de television de mayor duracion en la historia?', 'Los Simpson', 'Doctor Who', 'Law & Order', 'Friends');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que banda de rock lanzo el album "The Dark Side of the Moon"?', 'Pink Floyd', 'Led Zeppelin', 'The Rolling Stones', 'Queen');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el verdadero nombre del personaje "El Hombre Arana" en los comics?', 'Peter Parker', 'Clark Kent', 'Bruce Wayne', 'Barry Allen');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais se origino el baile conocido como tango?', 'Argentina', 'Brasil', 'Cuba', 'Espana');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que director de cine es conocido por sus peliculas surrealistas como "Eraserhead" y "Mulholland Drive"?', 'David Lynch', 'Quentin Tarantino', 'Tim Burton', 'Martin Scorsese');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual fue la primera pelicula animada en ganar un Oscar a Mejor Pelicula Animada?', 'Shrek', 'Toy Story', 'Blancanieves y los siete enanitos', 'La bella y la bestia');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que compositor clasico compuso la famosa obra "Las Cuatro Estaciones"?', 'Antonio Vivaldi', 'Wolfgang Amadeus Mozart', 'Ludwig van Beethoven', 'Johann Sebastian Bach');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre del planeta natal de Superman?', 'Krypton', 'Omega', 'Vulcano', 'Ego');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que famoso cuadro fue robado del Museo del Louvre en 1911?', 'La Mona Lisa', 'La ultima cena', 'El nacimiento de Venus', 'La joven de la perla');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que banda de los anos 60 fue conocida como "Los Cuatro Fabulosos"?', 'The Beatles', 'The Rolling Stones', 'The Beach Boys', 'The Who');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que videojuego aparece un personaje llamado Solid Snake?', 'Metal Gear', 'Final Fantasy', 'Resident Evil', 'Street Fighter');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano se lanzo el primer iPhone?', '2007', '2005', '2008', '2010');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien es el autor de la obra "La Metamorfosis"?', 'Franz Kafka', 'Oscar Wilde', 'Fiodor Dostoyevski', 'Gabriel Garcia Marquez');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que personaje de cine pronuncio la famosa frase "Aqui tienes mirando a ti, chico"?', 'Rick Blaine en Casablanca', 'Michael Corleone en El Padrino', 'Forrest Gump en Forrest Gump', 'Indiana Jones en En busca del arca perdida');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que emperador romano hizo del cristianismo la religion oficial del Imperio Romano?', 'Teodosio I', 'Constantino', 'Juliano', 'Augusto');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual fue la dinastia que goberno China durante la construccion de la Gran Muralla?', 'Dinastia Qin', 'Dinastia Ming', 'Dinastia Tang', 'Dinastia Han');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano cayo Constantinopla en manos del Imperio Otomano?', '1453', '1492', '1517', '1410');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el primer presidente de Estados Unidos en ser asesinado en el cargo?', 'Abraham Lincoln', 'James Garfield', 'William McKinley', 'John F. Kennedy');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que rey de Inglaterra fue ejecutado durante la Guerra Civil Inglesa?', 'Carlos I', 'Enrique VIII', 'Ricardo III', 'Jacobo I');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que civilizacion antigua es conocida por sus "Lineas de Nazca" en el desierto peruano?', 'Nazca', 'Maya', 'Inca', 'Tolteca');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que general cartagines cruzo los Alpes para enfrentarse a Roma?', 'Anibal', 'Escipion', 'Mario', 'Julio Cesar');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el fundador de la dinastia Yuan en China?', 'Kublai Kan', 'Genghis Kan', 'Ogedai Kan', 'Timur');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual fue la ultima dinastia imperial de Rusia antes de la revolucion de 1917?', 'Dinastia Romanov', 'Dinastia Rurik', 'Dinastia Vasa', 'Dinastia Pruska');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que tratado puso fin a la Primera Guerra Mundial?', 'Tratado de Versalles', 'Tratado de Paris', 'Tratado de Tordesillas', 'Tratado de Brest-Litovsk');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la ciudad mas antigua continuamente habitada del mundo?', 'Damasco', 'Jerusalen', 'Roma', 'Atenas');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el lider militar conocido como "El Zorro del Desierto" durante la Segunda Guerra Mundial?', 'Erwin Rommel', 'Bernard Montgomery', 'George Patton', 'Dwight D. Eisenhower');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual fue la civilizacion precolombina que construyo Machu Picchu?', 'Inca', 'Maya', 'Azteca', 'Olmeca');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el rey de los francos coronado como Emperador del Sacro Imperio Romano en el ano 800?', 'Carlomagno', 'Luis el Piadoso', 'Carlos Martel', 'Clodoveo I');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que emperador japones fue el ultimo en tener un estatus divino reconocido?', 'Hirohito', 'Meiji', 'Taisho', 'Akihito');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que nacion europea fue conocida como "La Gran Serbia" en el siglo XIX?', 'Serbia', 'Montenegro', 'Croacia', 'Bosnia');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais tuvo lugar la revolucion de los "Camisas Negras"?', 'Italia', 'Espana', 'Alemania', 'Grecia');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre de la batalla en la que Napoleon Bonaparte fue derrotado definitivamente?', 'Waterloo', 'Austerlitz', 'Trafalgar', 'Leipzig');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual fue el nombre de la operacion alemana para invadir la Union Sovietica en 1941?', 'Operacion Barbarroja', 'Operacion Leon Marino', 'Operacion Overlord', 'Operacion Market Garden');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que evento se considera el detonante de la Primera Guerra Mundial?', 'Asesinato del archiduque Francisco Fernando', 'Invasion de Polonia', 'Hundimiento del Lusitania', 'Incidente de Mukden');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el pais mas grande del mundo por superficie?', 'Rusia', 'Canada', 'China', 'Estados Unidos');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que montana es la mas alta del continente africano?', 'Kilimanjaro', 'Monte Kenia', 'Monte Atlas', 'Monte Toubkal');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais se encuentra el Lago Baikal, el lago de agua dulce mas profundo del mundo?', 'Rusia', 'Canada', 'China', 'Kazajistan');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Australia?', 'Canberra', 'Sidney', 'Melbourne', 'Adelaida');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que continente se encuentra el desierto de Atacama?', 'America del Sur', 'Africa', 'Asia', 'Oceania');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pais tiene el mayor numero de islas en el mundo?', 'Suecia', 'Noruega', 'Grecia', 'Indonesia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la ciudad mas poblada de Brasil?', 'Sao Paulo', 'Rio de Janeiro', 'Brasilia', 'Salvador');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el rio mas largo de Africa?', 'Nilo', 'Niger', 'Zambeze', 'Congo');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais se encuentra la montana conocida como "El Matterhorn"?', 'Suiza', 'Italia', 'Francia', 'Austria');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que oceano se encuentra al este de Africa?', 'Oceano Indico', 'Oceano Atlantico', 'Oceano Pacifico', 'Oceano Artico');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pais tiene la mayor extension territorial de America Latina?', 'Brasil', 'Argentina', 'Mexico', 'Colombia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el unico pais en el mundo que tiene la misma bandera que el Reino Unido?', 'Australia', 'Canada', 'Nueva Zelanda', 'Fiji');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais se encuentra el Monte Everest, la montana mas alta del mundo?', 'Nepal', 'Tibet', 'India', 'China');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais se encuentra la famosa ciudad antigua de Petra?', 'Jordania', 'Egipto', 'Turquia', 'Irak');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre del estrecho que separa Espana de Marruecos?', 'Estrecho de Gibraltar', 'Estrecho de Magallanes', 'Estrecho de Bering', 'Estrecho de Dardanelos');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Butan?', 'Thimphu', 'Katmandu', 'Lhasa', 'Paro');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais se encuentra el desierto de Kalahari?', 'Botsuana', 'Sudafrica', 'Namibia', 'Mozambique');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la isla mas grande del Caribe?', 'Cuba', 'Hispaniola', 'Jamaica', 'Puerto Rico');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el pais con la mayor cantidad de poblacion musulmana?', 'Indonesia', 'Pakistan', 'India', 'Iran');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el unico pais sin ejercito en el mundo?', 'Costa Rica', 'Suiza', 'Japon', 'Panama');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que paradoja en "Dark" esta asociada con la figura de "el viajero del tiempo"?', 'La paradoja del abuelo', 'La paradoja de Fermi', 'La paradoja de Schrodinger', 'La paradoja de los gemelos');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Como se llama la organizacion secreta que se oculta en las sombras en "Dark"?', 'Sic Mundus', 'La Resistencia', 'El Sindicato', 'La Sociedad de los Secretos');
INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que serie de TV aparece el personaje de "Walter White"?', 'Breaking Bad', 'Better Call Saul', 'The Sopranos', 'Mad Men');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien es el director de la pelicula "El Gran Lebowski"?', 'Joel Coen', 'Martin Scorsese', 'Stanley Kubrick', 'Wes Anderson');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pelicula de 1999 aparece la famosa frase "Me han dado un golpe en la cabeza"?', 'The Matrix', 'Fight Club', 'American Beauty', 'El Club de la Pelea');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre del primer superheroe creado por Marvel Comics en 1939?', 'Namor el Submarino', 'Capitan America', 'Spider-Man', 'Iron Man');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pelicula de animacion fue la primera en ser nominada al Oscar a Mejor Pelicula?', 'La Bella y la Bestia', 'El Rey Leon', 'Shrek', 'Frozen');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien interpreto a "Hannibal Lecter" en la pelicula "El Silencio de los Corderos"?', 'Anthony Hopkins', 'Jack Nicholson', 'Marlon Brando', 'Johnny Depp');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que videojuego popular fue lanzado originalmente en 1996 por la empresa Nintendo?', 'Super Mario 64', 'The Legend of Zelda: Ocarina of Time', 'Pokemon Rojo', 'Final Fantasy VII');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que banda lanzo el famoso album "Abbey Road" en 1969?', 'The Beatles', 'The Rolling Stones', 'Led Zeppelin', 'Pink Floyd');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que serie de television se presenta el concepto de "la Zona Fantasma"?', 'Superman', 'Smallville', 'Arrow', 'The Flash');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien dirigio la pelicula "La naranja mecanica"?', 'Stanley Kubrick', 'Francis Ford Coppola', 'Quentin Tarantino', 'David Lynch');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre del principio fisico que afirma que no se puede conocer con precision la posicion y la velocidad de una particula al mismo tiempo?', 'Principio de incertidumbre de Heisenberg', 'Ley de la gravitacion universal', 'Teoria de cuerdas', 'Principio de superposicion cuantica');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el primero en postular la teoria heliocentrica, que afirma que el Sol esta en el centro del sistema solar?', 'Nicolas Copernico', 'Galileo Galilei', 'Johannes Kepler', 'Isaac Newton');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre de la particula subatomica que tiene carga negativa?', 'Electron', 'Proton', 'Neutron', 'Quark');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que descubrimiento llevo a la formulacion de la teoria de la relatividad de Albert Einstein?', 'La constancia de la velocidad de la luz', 'La ley de la gravitacion universal', 'La expansion del universo', 'El efecto fotoelectrico');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Como se llama el genoma completo de una especie?', 'Genoma', 'Cromosoma', 'Alelo', 'Proteoma');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre del primer animal que se clono en 1996?', 'Dolly la oveja', 'Albert el mono', 'Einstein la vaca', 'Clyde el raton');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien descubrio la penicilina?', 'Alexander Fleming', 'Marie Curie', 'Louis Pasteur', 'Robert Koch');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que elemento quimico tiene el simbolo "Fe"?', 'Hierro', 'Fosforo', 'Fluor', 'Francio');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre de la capa mas externa de la Tierra?', 'Corteza', 'Manto', 'Nucleo externo', 'Nucleo interno');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que teorema establece que no se puede conocer simultaneamente el momento y la posicion de una particula con precision infinita?', 'Teorema de Heisenberg', 'Teorema de Pitagoras', 'Teorema de Euler', 'Teorema de Gauss');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Como se llama la ecuacion fundamental de la mecanica de fluidos que describe el movimiento de un fluido incomprensible y viscoso?', 'Ecuacion de Navier-Stokes', 'Ecuacion de Euler', 'Teorema de Bernoulli', 'Ley de Poiseuille');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el principio fisico que explica la sustentacion en las alas de un avion?', 'Principio de Bernoulli', 'Ley de la conservacion de la masa', 'Teoria de la elasticidad', 'Teoria de la relatividad');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Como se llama el parametro que describe la viscosidad dinamica en la mecanica de fluidos?', 'Coeficiente de viscosidad', 'Numero de Reynolds', 'Presion de vaporizacion', 'Coeficiente de difusion');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que fenomeno explica el comportamiento de los gases ideales segun la ley de Boyle?', 'La compresion de un gas a temperatura constante', 'La expansion de un gas a volumen constante', 'El aumento de temperatura a volumen constante', 'La energia cinetica de las moleculas de gas');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En aerodinamica, que significa el "numero de Mach"?', 'La relacion de la velocidad de un objeto con la velocidad del sonido', 'La relacion entre la densidad y la velocidad de un fluido', 'La proporcion entre la presion y la temperatura de un gas', 'La diferencia de presiones en las alas de un avion');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la ley que describe el comportamiento de un fluido ideal que se mueve a traves de una tuberia con diferentes areas de seccion transversal?', 'Ley de continuidad', 'Ley de Bernoulli', 'Ley de Poiseuille', 'Ecuacion de Navier-Stokes');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que es la "tension superficial" en mecanica de fluidos?', 'La fuerza que actua en la superficie de un liquido, creando una capa resistente', 'La velocidad maxima a la que puede fluir un fluido', 'La cantidad de energia cinetica de un fluido en movimiento', 'El comportamiento de un fluido viscoso que fluye por una superficie rugosa');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que significa el "numero de Reynolds" en mecanica de fluidos?', 'Indica el regimen de flujo de un fluido (laminar o turbulento)', 'La cantidad de energia que pierde un fluido debido a la friccion', 'La velocidad critica de un fluido en movimiento', 'El coeficiente de arrastre de un objeto en movimiento');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que ley en aerodinamica se utiliza para calcular la fuerza de sustentacion de un avion en vuelo?', 'Ley de Bernoulli', 'Ley de Pascal', 'Ley de Boyle', 'Teoria de la elasticidad');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el principio que explica la aceleracion de un fluido cuando su velocidad aumenta al pasar por un estrechamiento en una tuberia?', 'Principio de Bernoulli', 'Ley de Boyle', 'Ecuacion de Navier-Stokes', 'Teorema de la energia cinetica');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la ecuacion fundamental que describe el movimiento de un avion en el aire teniendo en cuenta las fuerzas de sustentacion, resistencia, empuje y peso?', 'Ecuacion de la mecanica del vuelo', 'Ecuacion de Navier-Stokes', 'Ecuacion de Euler', 'Ecuacion de Bernoulli');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Como se denomina la velocidad critica a la que el flujo de aire en torno a un avion comienza a volverse turbulento, causando perdida de sustentacion?', 'Velocidad de perdida', 'Velocidad de Mach 1', 'Velocidad terminal', 'Velocidad de ascenso');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que efecto explica el cambio de presion sobre el ala de un avion debido a la variacion de la velocidad del aire por encima y por debajo del ala?', 'Efecto Bernoulli', 'Efecto Magnus', 'Efecto Venturi', 'Efecto Doppler');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la teoria de la aerodinamica, que es el "angulo de ataque" en un avion?', 'El angulo entre el eje longitudinal del avion y la direccion del viento relativo', 'El angulo entre el fuselaje y la superficie del ala', 'El angulo de inclinacion de las alas respecto al suelo', 'El angulo entre el fuselaje y el viento de cola');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el termino que describe la cantidad de aire que pasa a traves de un motor a reaccion en un tiempo determinado?', 'Caudal de masa de aire', 'Coeficiente de arrastre', 'Potencia especifica', 'Indice de presion dinamica');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la mecanica de vuelo, que describe el "numero de Mach"?', 'La relacion entre la velocidad del avion y la velocidad del sonido en el aire', 'La relacion entre la sustentacion y la resistencia de un avion', 'La velocidad a la que el avion alcanza su maxima eficiencia aerodinamica', 'La cantidad de aire que un motor succiona por segundo');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Como se denomina el fenomeno cuando el flujo de aire sobre un ala se separa, causando una perdida repentina de sustentacion?', 'Perdida aerodinamica', 'Despegue asistido', 'Arrastre inducido', 'Inestabilidad transitoria');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que principio aerodinamico describe el aumento de la sustentacion al incrementar la velocidad del flujo de aire por encima del ala?', 'Principio de Bernoulli', 'Ley de la conservacion de la masa', 'Teoria de los vortices', 'Teoria de la expansion de los gases');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Como se llama el fenomeno que ocurre cuando un avion pasa de una velocidad subsonica a transonica, causando una compresion del aire frente a las alas?', 'Compresion transonica', 'Pico de shock', 'Inestabilidad de onda', 'Zona de maxima sustentacion');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En aerodinamica, que se entiende por "arrastre parasitario" de un avion?', 'La resistencia al avance debido a la friccion del aire con la superficie del avion', 'La resistencia causada por las perturbaciones de aire en las alas', 'La resistencia causada por la compresion del aire en el cono de choque', 'La resistencia a la presion del aire por debajo del fuselaje');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano se estreno la primera pelicula de "Blade Runner" dirigida por Ridley Scott?', '1982', '1980', '1984', '1986');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Como se llama el actor que interpreto a Doctor Emmett Brown en la saga de "Volver al Futuro"?', 'Christopher Lloyd', 'Michael J. Fox', 'Jeff Goldblum', 'Bill Murray');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que serie de television aparece un personaje llamado "Cersei Lannister"?', 'Juego de Tronos', 'Los 100', 'The Witcher', 'The Mandalorian');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la serie "Rick and Morty", como se llama el universo paralelo en el que Morty tiene una version malvada?', 'Universo C-137', 'Universo 1-2-3', 'Universo 69', 'Universo X');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que actor da vida a Tony Stark/Iron Man en el Universo Cinematografico de Marvel?', 'Robert Downey Jr.', 'Chris Hemsworth', 'Mark Ruffalo', 'Chris Evans');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano se estreno la serie "Stranger Things" en Netflix?', '2016', '2017', '2015', '2018');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la pelicula "The Matrix", cual es el nombre real del personaje interpretado por Keanu Reeves?', 'Thomas Anderson', 'John Wick', 'Neo Skywalker', 'Agent Smith');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que anime cuenta la historia de un adolescente llamado Shinji Ikari y su lucha con gigantescos robots llamados "Eva"?', 'Neon Genesis Evangelion', 'Attack on Titan', 'Cowboy Bebop', 'Fullmetal Alchemist');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que serie de ciencia ficcion se desarrolla en una nave espacial llamada "Discovery One"?', '2001: Una odisea del espacio', 'Star Trek: The Next Generation', 'Battlestar Galactica', 'Firefly');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que director es conocido por sus peliculas de culto como "Donnie Darko" y "Southland Tales"?', 'Richard Kelly', 'David Lynch', 'Stanley Kubrick', 'Quentin Tarantino');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la pelicula "Inception", que objeto se utiliza como "totem" para saber si el protagonista esta sonando?', 'Un trompo', 'Una peonza', 'Un reloj de bolsillo', 'Una anillo de bodas');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pelicula de ciencia ficcion aparece el personaje de HAL 9000?', '2001: Una odisea del espacio', 'Interestelar', 'Alien', 'Solaris');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Como se llama la civilizacion alienigena en la serie "Star Trek: The Next Generation"?', 'Los Vulcanos', 'Los Klingon', 'Los Borg', 'Los Romulanos');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que serie de anime esta basada en un manga de Yoshihiro Togashi sobre un grupo de cazadores y su lucha contra poderosos enemigos?', 'Hunter x Hunter', 'Dragon Ball Z', 'Naruto', 'Bleach');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre del protagonista en la serie de television "The Mandalorian"?', 'Din Djarin', 'Boba Fett', 'Han Solo', 'Mace Windu');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien escribio la saga de novelas "Dune", que posteriormente fue adaptada al cine y la television?', 'Frank Herbert', 'Isaac Asimov', 'Arthur C. Clarke', 'Philip K. Dick');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que universo cinematografico se encuentra el personaje "Thanos"?', 'Marvel', 'DC Comics', 'Star Wars', 'Transformers');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre de la organizacion secreta en la pelicula "Men in Black"?', 'MIB', 'CIA', 'FBI', 'SHIELD');
INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien pinto "El jardin de las delicias"?', 'Hieronymus Bosch', 'El Greco', 'Pieter Bruegel el Viejo', 'Jan van Eyck');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que movimiento artistico se enmarca la obra "La persistencia de la memoria" de Salvador Dali?', 'Surrealismo', 'Cubismo', 'Impresionismo', 'Expresionismo');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el pintor de "La escuela de Atenas", una obra maestra del Renacimiento italiano?', 'Rafael Sanzio', 'Leonardo da Vinci', 'Michelangelo Buonarroti', 'Donatello');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pintor se caracteriza por el uso del "dripping" o goteo en sus obras, como en "No. 5, 1948"?', 'Jackson Pollock', 'Mark Rothko', 'Willem de Kooning', 'Andy Warhol');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ciudad se encuentra la "Galeria Uffizi", famosa por su coleccion de arte renacentista?', 'Florencia', 'Roma', 'Venecia', 'Milan');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que artista fue el principal representante del estilo de pintura conocido como "cubismo"?', 'Pablo Picasso', 'Henri Matisse', 'Georges Braque', 'Juan Gris');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual de las siguientes obras fue pintada por Edvard Munch?', 'El grito', 'La joven de la perla', 'Las meninas', 'Guernica');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que artista famoso se asocio con el Movimiento de Arte Pop y fue conocido por sus retratos de celebridades y latas de sopa Campbell?', 'Andy Warhol', 'Roy Lichtenstein', 'Keith Haring', 'Robert Rauschenberg');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano se pinto "La ultima cena" de Leonardo da Vinci?', '1495-1498', '1505-1510', '1480-1485', '1520-1525');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ciudad se encuentra la famosa obra "La noche estrellada" de Vincent van Gogh?', 'Nueva York', 'Paris', 'Amsterdam', 'Londres');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pintor barroco es famoso por su uso del claroscuro y obras como "La rendicion de Breda"?', 'Diego Velazquez', 'Caravaggio', 'Rembrandt', 'Peter Paul Rubens');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien pinto el "Guernica", una obra emblematica del cubismo y el arte moderno?', 'Pablo Picasso', 'Juan Gris', 'Georges Braque', 'Fernand Leger');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que estilo artistico se caracteriza por un enfoque en el color y la luz, y fue popularizado por artistas como Claude Monet y Pierre-Auguste Renoir?', 'Impresionismo', 'Expresionismo', 'Surrealismo', 'Realismo');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pintor del Renacimiento italiano creo la famosa obra "El nacimiento de Venus"?', 'Sandro Botticelli', 'Leonardo da Vinci', 'Michelangelo Buonarroti', 'Rafael Sanzio');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que famoso escultor italiano es conocido por sus esculturas de marmol, como "David" y "La piedad"?', 'Michelangelo Buonarroti', 'Donatello', 'Gian Lorenzo Bernini', 'Alberto Giacometti');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien es conocido como el "Padre del Impresionismo" en la pintura?', 'Edouard Manet', 'Claude Monet', 'Pierre-Auguste Renoir', 'Camille Pissarro');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que tecnica de pintura se utiliza en las obras de "fresco" en las que los pigmentos se aplican sobre una capa de yeso fresco?', 'Frescos', 'Acuarelas', 'Oleo', 'Acrilico');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pintor renacentista es conocido por sus retratos realistas y fue autor de "La Virgen de las rocas"?', 'Leonardo da Vinci', 'Rafael Sanzio', 'Giovanni Bellini', 'Botticelli');
INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el director de la pelicula de culto "The Big Lebowski"?', 'Joel Coen', 'Quentin Tarantino', 'Martin Scorsese', 'David Lynch');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual fue el primer largometraje de Studio Ghibli?', 'Nausicaa del Valle del Viento', 'Mi vecino Totoro', 'El castillo en el cielo', 'La princesa Mononoke');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la serie "Breaking Bad", que tipo de cancer padece Walter White?', 'Cancer de pulmon', 'Leucemia', 'Cancer de colon', 'Linfoma');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que banda sonora compuso John Williams para la pelicula "Jurassic Park"?', 'Jurassic Park', 'E.T. el Extraterrestre', 'Star Wars: Una Nueva Esperanza', 'Indiana Jones');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano se estreno la pelicula "Donnie Darko"?', '2001', '1999', '2002', '2000');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que serie de television se mencionan por primera vez los "Osos Mowgli"?', 'Doctor Who', 'Sherlock', 'The Big Bang Theory', 'Lost');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre del personaje interpretado por Matt Damon en "El caso Bourne"?', 'Jason Bourne', 'Max DeCosta', 'Tommy Lee', 'Jack Ryan');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que escritor es conocido por crear la saga de "El Senor de los Anillos"?', 'J.R.R. Tolkien', 'C.S. Lewis', 'George R.R. Martin', 'J.K. Rowling');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pelicula dirigida por Stanley Kubrick es famosa por su tratamiento visual de la violencia y la cultura juvenil?', 'La naranja mecanica', '2001: Una odisea del espacio', 'El resplandor', 'Barry Lyndon');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la pelicula "Matrix", cual es el nombre del mentor de Neo?', 'Morpheus', 'Trinity', 'Agent Smith', 'The Oracle');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que serie de television gira en torno a un instituto para jovenes con habilidades especiales, creado por el profesor Charles Xavier?', 'X-Men: La serie animada', 'The Boys', 'Umbrella Academy', 'Titans');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien interpreto a Joker en "The Dark Knight" (2008)?', 'Heath Ledger', 'Jared Leto', 'Jack Nicholson', 'Mark Hamill');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano se estreno la serie "Twin Peaks" dirigida por David Lynch?', '1990', '1992', '1989', '1994');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que actriz gano el Oscar a la Mejor Actriz por su papel en "Reina Cristina de Suecia" (1933)?', 'Greta Garbo', 'Meryl Streep', 'Bette Davis', 'Jodie Foster');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la pelicula "Inception", quien interpreta al personaje de Cobb?', 'Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Tom Hardy', 'Cillian Murphy');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que serie de culto aparece el personaje "Don Draper"?', 'Mad Men', 'The Sopranos', 'The Wire', 'Breaking Bad');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre del personaje principal en la pelicula "American Psycho"?', 'Patrick Bateman', 'Don Draper', 'Tyler Durden', 'Jack Torrance');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la pelicula "The Truman Show", que actor interpreta a Truman Burbank?', 'Jim Carrey', 'Steve Carell', 'Will Ferrell', 'Adam Sandler');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que escritor es el autor de "Fahrenheit 451"?', 'Ray Bradbury', 'George Orwell', 'Aldous Huxley', 'Margaret Atwood');
INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que zar ruso fue conocido por su reforma de la administracion y su modernizacion de Rusia en el siglo XVIII, incluida la fundacion de San Petersburgo?', 'Pedro el Grande', 'Ivan IV el Terrible', 'Alejandro II', 'Catalina la Grande');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que evento historico desencadeno la Revolucion Rusa de 1917?', 'La Revolucion de Febrero', 'La guerra ruso-japonesa', 'La Revolucion de Octubre', 'La masacre de Bloody Sunday');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el lider de la Revolucion de Octubre y primer lider de la Union Sovietica?', 'Vladimir Lenin', 'Leon Trotsky', 'Jose Stalin', 'Mijail Gorbachov');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que tratado puso fin a la participacion de Rusia en la Primera Guerra Mundial?', 'Tratado de Brest-Litovsk', 'Tratado de Versalles', 'Tratado de Trianon', 'Tratado de Saint-Germain');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que lider ruso fue responsable de la purga politica conocida como el "Gran Terror" durante la decada de 1930?', 'Jose Stalin', 'Leon Trotsky', 'Nikita Jrushchov', 'Vladimir Lenin');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano se fundo la Union Sovietica?', '1922', '1917', '1939', '1945');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que zar ruso abdico durante la Revolucion de Febrero en 1917?', 'Nicolas II', 'Alejandro II', 'Pedro III', 'Ivan IV');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el principal rival de Stalin durante los primeros anos del regimen sovietico antes de ser exiliado?', 'Leon Trotsky', 'Nikita Jrushchov', 'Andrei Zhdanov', 'Vladimir Lenin');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que evento marco el fin de la Guerra Fria?', 'La caida del Muro de Berlin', 'La Revolucion Rusa', 'La invasion de Afganistan por la URSS', 'La crisis de los misiles en Cuba');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual fue el principal resultado de la Revolucion Rusa de 1917 en terminos de organizacion politica?', 'El derrocamiento del zarismo y la creacion de un gobierno bolchevique', 'La instauracion de la dictadura de Stalin', 'La firma de la paz con Alemania', 'La derrota de los Mencheviques y el establecimiento de una monarquia constitucional');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que lider sovietico introdujo el programa de reformas conocido como "glasnost" y "perestroika" durante la decada de 1980?', 'Mijail Gorbachov', 'Leonid Brezhnev', 'Nikita Jrushchov', 'Yuri Andropov');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que ciudad fue el centro de la resistencia a la invasion nazi durante el Sitio de Leningrado en la Segunda Guerra Mundial?', 'Leningrado (San Petersburgo)', 'Moscu', 'Stalingrado', 'Kiev');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano se disolvio oficialmente la Union Sovietica?', '1991', '1989', '1993', '1985');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual fue el objetivo del "Gulag" sovietico?', 'Sistema de campos de trabajo forzado', 'Sistema de educacion politica', 'Centro de investigacion cientifica', 'Red de hospitales psiquiatricos');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que evento marco la "Crisis de los Misiles en Cuba" de 1962?', 'El descubrimiento de misiles nucleares sovieticos en Cuba', 'El derrocamiento de Nikita Jrushchov', 'El lanzamiento del primer satelite Sputnik', 'La invasion sovietica de Afganistan');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que tratado internacional de 1975 buscaba reducir las tensiones entre el bloque sovietico y el bloque occidental?', 'Acuerdos de Helsinki', 'Tratado de Paris', 'Pacto de Varsovia', 'Tratado de no proliferacion nuclear');
INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el determinante de una matriz 2x2 con elementos a, b, c, d?', 'ad - bc', 'a + b + c + d', 'ac - bd', 'ab - cd');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el rango de una matriz de 3x3 con filas linealmente dependientes?', 'Menor que 3', 'Igual a 3', 'Igual a 2', 'Igual a 1');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Como se llama el proceso mediante el cual una matriz cuadrada se descompone en una multiplicacion de una matriz triangular superior y una matriz triangular inferior?', 'Descomposicion LU', 'Descomposicion QR', 'Descomposicion SVD', 'Descomposicion Eigen');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Si una matriz tiene un determinante igual a 0, que se puede decir sobre sus columnas?', 'Son linealmente dependientes', 'Son ortogonales', 'Son linealmente independientes', 'Forman una base ortonormal');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que es una matriz ortogonal?', 'Una matriz cuya inversa es igual a su transpuesta', 'Una matriz con todos sus elementos positivos', 'Una matriz cuya determinante es igual a 1', 'Una matriz cuadrada con eigenvalores reales');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que es un valor propio (eigenvalor) de una matriz A?', 'Un escalar \(\lambda\) tal que Av = \(\lambda v\)', 'Una constante que representa la diagonal de la matriz', 'Un numero que multiplica el determinante de la matriz', 'Una transformacion de la matriz en una forma diagonal');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la condicion para que una matriz cuadrada sea diagonalizable?', 'Debe tener un numero suficiente de vectores propios linealmente independientes', 'Debe tener determinante igual a 1', 'Debe ser una matriz ortogonal', 'Debe ser invertible');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Si una matriz tiene un valor propio de 0, que se puede decir sobre la matriz?', 'Es singular', 'Es invertible', 'Es ortogonal', 'Es una matriz de rotacion');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En algebra lineal, cual es la definicion de una transformacion lineal?', 'Una funcion que preserva la adicion y la multiplicacion por escalares', 'Una funcion que transforma vectores en otros vectores con la misma magnitud', 'Una funcion que preserva solo la adicion de vectores', 'Una funcion que no tiene valores propios');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la dimension del espacio nulo de una matriz de 3x3 si su rango es 2?', '1', '2', '0', '3');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que representa el producto cruzado de dos vectores en el espacio tridimensional?', 'Un vector perpendicular a los dos vectores originales', 'El area de un paralelogramo definido por los dos vectores', 'La magnitud del angulo entre los dos vectores', 'La longitud del vector resultante');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Como se denomina el proceso de descomposicion de una matriz cuadrada en una matriz diagonal y una matriz de eigenvectores?', 'Descomposicion espectral', 'Descomposicion LU', 'Descomposicion QR', 'Descomposicion SVD');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que es una matriz simetrica?', 'Una matriz que es igual a su transpuesta', 'Una matriz cuyo determinante es igual a 1', 'Una matriz con todas las filas iguales', 'Una matriz cuyo rango es igual a su orden');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que propiedad tiene el determinante de una matriz producto de dos matrices A y B?', 'Es el producto de los determinantes de A y B', 'Es la suma de los determinantes de A y B', 'Es el determinante de la transpuesta de A multiplicado por el determinante de B', 'Es igual al determinante de A si B es la inversa de A');
INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que tipo de enlace quimico es caracteristico de los materiales ceramicos?', 'Enlace ionico', 'Enlace covalente', 'Enlace metalico', 'Enlace dativo');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el principio fundamental detras de la fabricacion de materiales compuestos?', 'La combinacion de dos o mas materiales con propiedades distintas para obtener un material con mejores propiedades', 'La aleacion de metales para mejorar la conductividad', 'La utilizacion de polimeros como matrices plasticas', 'El recubrimiento de materiales con sustancias mas resistentes');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En la teoria de bandas de solidos, que distingue a los conductores de los aislantes?', 'La banda de conduccion esta parcialmente ocupada en los conductores, mientras que en los aislantes esta completamente vacia', 'Los conductores tienen una alta densidad de atomos, mientras que los aislantes tienen una baja densidad de atomos', 'Los conductores tienen un mayor numero de electrones libres en la capa de valencia', 'Los conductores tienen atomos con alta electronegatividad');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que material es conocido por su excelente conductividad electrica y se utiliza comunmente en cables electricos?', 'Cobre', 'Silicio', 'Aluminio', 'Oro');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la principal ventaja de los materiales polimericos frente a los metalicos en la industria?', 'Ligereza y facilidad de conformado', 'Alta conductividad termica', 'Alta resistencia a la traccion', 'Resistencia a la corrosion');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En terminos de estructura cristalina, que tipo de empacamiento tienen los cristales de un material metalico con la estructura FCC (cubica centrada en las caras)?', 'Cerrado y denso', 'Alineacion en filas rectas', 'Estructura hexagonal', 'Estructura aleatoria');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que proceso de fabricacion de materiales involucra el enfriamiento rapido de un metal fundido para obtener una estructura amorfa?', 'Solidificacion rapida (metal amorfo)', 'Horno de induccion', 'Sinterizacion', 'Fundicion en arena');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que es un polimero termoplastico?', 'Un polimero que se puede moldear y remoldear repetidamente con calor', 'Un polimero que no se puede derretir', 'Un polimero que se descompone a temperaturas muy altas', 'Un polimero con enlaces covalentes muy fuertes');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el principio de funcionamiento de una bateria de iones de litio?', 'La transferencia de iones de litio entre los electrodos durante la carga y descarga', 'La conversion de energia termica en energia electrica', 'La generacion de energia mediante reacciones nucleares', 'La liberacion de electrones a traves de un proceso de oxidacion');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual de las siguientes propiedades es mas importante para los materiales superconductores?', 'La capacidad de conducir electricidad sin resistencia a temperaturas extremadamente bajas', 'La alta resistencia al impacto', 'La alta capacidad de absorcion de radiacion', 'La capacidad de cambiar de forma bajo esfuerzo');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que tipo de material se utiliza comunmente como semiconductor en la industria electronica?', 'Silicio', 'Oro', 'Cobre', 'Titanio');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que proceso es utilizado para producir acero de alta calidad a partir de chatarra reciclada?', 'Horno electrico de arco', 'Forja en caliente', 'Sinterizacion', 'Colada continua');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que material es conocido por su alta resistencia a la corrosion y es utilizado comunmente en ambientes marinos?', 'Acero inoxidable', 'Cobre', 'Titanio', 'Aluminio');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En terminos de ciencia de materiales, que significa el termino “sinterizacion”?', 'El proceso de compactar y calentar polvos metalicos o ceramicos hasta que se fusionan parcialmente', 'El proceso de fundir metales y permitir que se enfrien lentamente', 'La formacion de materiales cristalinos mediante enfriamiento rapido', 'El proceso de adicion de impurezas para cambiar las propiedades mecanicas de un material');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que es un material piezoelectrico?', 'Un material que genera una carga electrica cuando se le somete a una tension mecanica', 'Un material que cambia su color al recibir luz ultravioleta', 'Un material que mejora la eficiencia de los motores electricos', 'Un material que es insensible a las variaciones termicas');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el tipo de enlace predominante en los materiales ceramicos?', 'Enlace ionico y covalente', 'Enlace metalico', 'Enlace covalente', 'Enlace ionico');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En quimica de materiales, que significa el termino “ductilidad”?', 'La capacidad de un material para estirarse sin romperse', 'La capacidad de un material para resistir la compresion', 'La capacidad de un material para soportar temperaturas extremas', 'La capacidad de un material para ser moldeado sin perder su forma');
INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Somalia?', 'Mogadiscio', 'Addis Abeba', 'Nairobi', 'Dakar');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Burkina Faso?', 'Uagadugu', 'Bamako', 'Ouagadougou', 'Accra');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que ciudad es la capital de Guinea Ecuatorial?', 'Malabo', 'Libreville', 'Banjul', 'Yaounde');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Cabo Verde?', 'Praia', 'Bissau', 'Dakar', 'Conakry');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que ciudad es la capital de Tanzania?', 'Dodoma', 'Dar es Salaam', 'Kigali', 'Maputo');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Malaui?', 'Lilongue', 'Lusaka', 'Harare', 'Addis Abeba');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Namibia?', 'Windhoek', 'Gaborone', 'Lusaka', 'Maputo');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Chad?', 'N’Djamena', 'Douala', 'Kinshasa', 'Brazzaville');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que ciudad es la capital de Burundi?', 'Gitega', 'Bujumbura', 'Kigali', 'Lome');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de la Republica Democratica del Congo?', 'Kinshasa', 'Brazzaville', 'Luanda', 'Harare');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que ciudad es la capital de Uganda?', 'Kampala', 'Nairobi', 'Kigali', 'Addis Abeba');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Liberia?', 'Monrovia', 'Accra', 'Freetown', 'Abuja');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que ciudad es la capital de Zimbabue?', 'Harare', 'Lusaka', 'Maputo', 'Lilongue');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Egipto?', 'El Cairo', 'Rabat', 'Tunez', 'Argel');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que ciudad es la capital de Angola?', 'Luanda', 'Maputo', 'Windhoek', 'Addis Abeba');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Seychelles?', 'Victoria', 'Port Louis', 'Antananarivo', 'Banjul');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Eritrea?', 'Asmara', 'Khartum', 'Addis Abeba', 'Bujumbura');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que ciudad es la capital de Malawi?', 'Lilongue', 'Lusaka', 'Kigali', 'Harare');
INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el ultimo zar de Rusia?', 'Nicolas II', 'Alejandro III', 'Pedro el Grande', 'Ivan el Terrible');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que batalla decisiva se libro el enfrentamiento final entre los aliados y las fuerzas del Tercer Reich en 1944?', 'Batalla de Normandia', 'Batalla de Berlin', 'Batalla de Stalingrado', 'Batalla de las Ardenas');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el primer emperador de China?', 'Qin Shi Huang', 'Han Wudi', 'Liu Bang', 'Zhao Tuo');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que tratado puso fin a la Primera Guerra Mundial?', 'Tratado de Versalles', 'Tratado de Paris', 'Tratado de Ginebra', 'Tratado de Tordesillas');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano cayo Constantinopla ante el Imperio Otomano?', '1453', '1492', '1204', '1521');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que dinastia china goberno desde 1368 hasta 1644?', 'Ming', 'Qing', 'Tang', 'Song');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que rey de Inglaterra fue conocido por su ruptura con la Iglesia Catolica y su creacion de la Iglesia de Inglaterra?', 'Enrique VIII', 'Ricardo III', 'Eduardo III', 'Carlos I');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el lider militar carismatico de la Revolucion Francesa que llego a ser emperador de Francia?', 'Napoleon Bonaparte', 'Robespierre', 'Danton', 'Marat');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que imperio sufrio la invasion de los mongoles en el siglo XIII?', 'Imperio Rumano', 'Imperio del Sacro Imperio Romano Germanico', 'Imperio Bizantino', 'Imperio Persa');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que batalla fue derrotado Napoleon Bonaparte en 1815?', 'Batalla de Waterloo', 'Batalla de Leipzig', 'Batalla de Austerlitz', 'Batalla de Trafalgar');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pais fue el primer en conceder el voto a las mujeres en 1893?', 'Nueva Zelanda', 'Finlandia', 'Estados Unidos', 'Australia');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pais fue invadido por los nazis en 1940 en una de las primeras etapas de la Segunda Guerra Mundial?', 'Dinamarca', 'Francia', 'Polonia', 'Belgica');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que antigua ciudad fue destruida por una erupcion volcanica en el ano 79 d.C.?', 'Pompeya', 'Roma', 'Atenas', 'Carthago');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que batalla historica se libro la primera gran victoria naval de la flota estadounidense durante la Guerra de Independencia?', 'Batalla de Saratoga', 'Batalla de Yorktown', 'Batalla de Bunker Hill', 'Batalla de la Bahia de Chesapeake');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el presidente de los Estados Unidos durante la Guerra Civil?', 'Abraham Lincoln', 'George Washington', 'Thomas Jefferson', 'Andrew Johnson');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que civilizacion precolombina construyo las famosas lineas de Nazca en Peru?', 'Nazca', 'Azteca', 'Maya', 'Inca');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que famoso filosofo griego fundo la escuela de pensamiento conocida como el "Estoicismo"?', 'Zenon de Citio', 'Platon', 'Aristoteles', 'Epicurio');

INSERT INTO PreguntasHistoria (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que imperio del antiguo Medio Oriente fue derrotado por Alejandro Magno en la Batalla de Gaugamela?', 'Imperio Persa', 'Imperio Romano', 'Imperio Egipcio', 'Imperio Macedonio');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano se estreno la pelicula "Blade Runner 2049"?', '2017', '2015', '2018', '2016');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien escribio el guion original de la pelicula "Pulp Fiction"?', 'Quentin Tarantino', 'Martin Scorsese', 'Francis Ford Coppola', 'Steven Spielberg');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que famosa serie de television de ciencia ficcion tiene un episodio titulado "San Junipero"?', 'Black Mirror', 'Stranger Things', 'The Twilight Zone', 'The X-Files');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ciudad se desarrolla la mayor parte de la serie "Breaking Bad"?', 'Albuquerque', 'Los Angeles', 'Chicago', 'Dallas');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el director de la pelicula "El Laberinto del Fauno"?', 'Guillermo del Toro', 'Alejandro Gonzalez Inarritu', 'Alfonso Cuaron', 'Pedro Almodovar');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que banda de rock lanzo el album "Abbey Road" en 1969?', 'The Beatles', 'The Rolling Stones', 'Led Zeppelin', 'Pink Floyd');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano se lanzo la serie de television "Friends"?', '1994', '1992', '1996', '1998');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el creador de la serie de television "The Simpsons"?', 'Matt Groening', 'Seth MacFarlane', 'Dan Harmon', 'Trey Parker');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que actor interpreto a "The Joker" en la pelicula "The Dark Knight" de 2008?', 'Heath Ledger', 'Jared Leto', 'Jack Nicholson', 'Tom Hardy');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que videojuego popular fue creado por el estudio Blizzard Entertainment en 1998?', 'StarCraft', 'Warcraft', 'Diablo', 'Overwatch');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pelicula de Disney se estreno en 1994 y presenta a un joven leon llamado Simba?', 'El Rey Leon', 'La Bella y la Bestia', 'Aladdin', 'Cenicienta');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que banda de musica fue fundada por Freddie Mercury en 1970?', 'Queen', 'Led Zeppelin', 'The Rolling Stones', 'The Who');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano se estreno el primer episodio de la serie "Stranger Things"?', '2016', '2015', '2017', '2018');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el compositor de la famosa banda sonora de la pelicula "Star Wars"?', 'John Williams', 'Hans Zimmer', 'Danny Elfman', 'Ennio Morricone');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que famosa pelicula de ciencia ficcion fue dirigida por Ridley Scott en 1982?', 'Blade Runner', 'Alien', 'The Terminator', '2001: A Space Odyssey');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que serie de television popular esta ambientada en la ciudad ficticia de Hawkins, Indiana?', 'Stranger Things', 'The X-Files', 'Supernatural', 'Twin Peaks');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que famoso programa de television de concursos fue presentado por Alex Trebek?', 'Jeopardy!', 'Wheel of Fortune', 'Family Feud', 'The Price is Right');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pelicula de Quentin Tarantino aparece el personaje de "Uma Thurman" conocido como "The Bride"?', 'Kill Bill', 'Pulp Fiction', 'Inglourious Basterds', 'Django Unchained');

INSERT INTO PreguntasEntretenimiento (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que escritor es conocido por la novela "1984" y "Rebelion en la granja"?', 'George Orwell', 'Aldous Huxley', 'Ray Bradbury', 'Philip K. Dick');
INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Butan?', 'Thimphu', 'Paro', 'Phuntsholing', 'Wangdue Phodrang');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que continente se encuentra el monte Kilimanjaro?', 'Africa', 'Asia', 'America', 'Oceania');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pais tiene mas islas en el mundo?', 'Suecia', 'Canada', 'Finlandia', 'Noruega');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais se encuentra el Desierto de Atacama?', 'Chile', 'Peru', 'Argentina', 'Bolivia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Mongolia?', 'Ulan Bator', 'Almaty', 'Tashkent', 'Astana');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que oceano limita al este de Australia?', 'Oceano Pacifico', 'Oceano Atlantico', 'Oceano Indico', 'Oceano Artico');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais se encuentra la region de los Alpes Suizos?', 'Suiza', 'Austria', 'Francia', 'Italia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la ciudad mas grande de Brasil?', 'Sao Paulo', 'Rio de Janeiro', 'Brasilia', 'Salvador');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pais es el hogar del lago Baikal, el lago mas profundo del mundo?', 'Rusia', 'Kazajistan', 'China', 'Mongolia');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre del desierto que se extiende por gran parte de Egipto y Libia?', 'Desierto del Sahara', 'Desierto de Kalahari', 'Desierto de Atacama', 'Desierto de Sonora');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pais tiene la mayor cantidad de fronteras internacionales?', 'Rusia', 'China', 'Brasil', 'India');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais se encuentran las ruinas de la antigua ciudad de Petra?', 'Jordania', 'Egipto', 'Siria', 'Irak');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que isla es la mas grande del Caribe?', 'Cuba', 'Hispaniola', 'Jamaica', 'Puerto Rico');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Sri Lanka?', 'Sri Jayawardenepura Kotte', 'Colombo', 'Male', 'Dhaka');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que rio es el mas largo de America del Sur?', 'El Amazonas', 'El Parana', 'El Orinoco', 'El Sao Francisco');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pais tiene dos capitales, una administrativa y otra constitucional?', 'Bolivia', 'Sudafrica', 'Malasia', 'Paises Bajos');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pais africano tiene mas de 1.000 idiomas reconocidos?', 'Papua Nueva Guinea', 'Niger', 'Congo', 'Nigeria');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la capital de Uzbekistan?', 'Tashkent', 'Bishkek', 'Almaty', 'Dushanbe');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que pais se encuentra el Monte Everest?', 'Nepal', 'Tibet', 'Pakistan', 'China');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pais esta formado por mas de 17,000 islas?', 'Indonesia', 'Filipinas', 'Malasia', 'Japon');
INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien pinto "Las Meninas"?', 'Diego Velazquez', 'Francisco de Goya', 'El Greco', 'Bartolome Esteban Murillo');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ciudad se encuentra la famosa pintura "La Ultima Cena" de Leonardo da Vinci?', 'Milan', 'Roma', 'Florencia', 'Venecia');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el movimiento artistico al que pertenece la obra "El Grito" de Edvard Munch?', 'Expresionismo', 'Impresionismo', 'Cubismo', 'Surrealismo');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pintor espanol es conocido por sus obras surrealistas como "La Persistencia de la Memoria"?', 'Salvador Dali', 'Pablo Picasso', 'Joan Miro', 'Luis Bunuel');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ano se completo la Capilla Sixtina por Miguel Angel?', '1512', '1498', '1543', '1525');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pintor italiano es conocido por su obra "La Escuela de Atenas"?', 'Rafael', 'Leonardo da Vinci', 'Caravaggio', 'Donatello');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre del famoso pintor de la obra "Guernica"?', 'Pablo Picasso', 'Vincent van Gogh', 'Claude Monet', 'Henri Matisse');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que artista es famoso por el cuadro "La noche estrellada"?', 'Vincent van Gogh', 'Edvard Munch', 'Claude Monet', 'Edouard Manet');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que movimiento artistico esta asociado con el uso de formas geometricas y la abstraccion, siendo Picasso uno de sus principales exponentes?', 'Cubismo', 'Impresionismo', 'Surrealismo', 'Futurismo');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien pinto "La joven de la perla"?', 'Johannes Vermeer', 'Rembrandt', 'Francisco de Goya', 'Jan van Eyck');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que artista pinto el famoso fresco "El juicio final" en la Capilla Sixtina?', 'Miguel Angel', 'Rafael', 'Leonardo da Vinci', 'Caravaggio');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que movimiento artistico es conocido por sus obras llenas de colores brillantes y formas simplificadas, como las de Marc Chagall?', 'Expresionismo', 'Surrealismo', 'Fauvismo', 'Cubismo');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien es el creador de la famosa obra "El jardin de las delicias"?', 'Hieronymus Bosch', 'El Greco', 'Giotto', 'Pieter Bruegel');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que artista pinto la obra "Las tres edades de la mujer"?', 'Gustav Klimt', 'Egon Schiele', 'Henri Toulouse-Lautrec', 'Alfred Sisley');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien fue el creador del famoso retrato de "La Gioconda"?', 'Leonardo da Vinci', 'Rafael', 'Michelangelo Buonarroti', 'Vincent van Gogh');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que ciudad se encuentra el museo "El Prado", que alberga obras de artistas como Velazquez y Goya?', 'Madrid', 'Barcelona', 'Sevilla', 'Valencia');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que pintor holandes es conocido por su obra "La ronda de noche"?', 'Rembrandt', 'Vincent van Gogh', 'Jan Vermeer', 'Pieter Bruegel');

INSERT INTO PreguntasArte (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Quien pinto "Las Meninas", una de las obras mas famosas del arte espanol?', 'Diego Velazquez', 'El Greco', 'Francisco de Goya', 'Bartolome Esteban Murillo');
INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual de las siguientes comarcas de Cataluna esta situada en la provincia de Girona?', 'El Emporda', 'Bages', 'Valles Oriental', 'Baix Penedes');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que comarca catalana se encuentra el Parque Nacional de Aiguestortes i Estany de Sant Maurici?', 'Alta Ribagorca', 'Cerdanya', 'Bergueda', 'Pallars Sobira');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la comarca mas poblada de Cataluna?', 'Valles Occidental', 'Barcelones', 'Tarragones', 'Girona');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que comarca de la provincia de Lleida es famosa por su produccion de frutas, especialmente peras y manzanas?', 'El Segria', 'Pla dUrgell', 'Garrigues', 'Urgell');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que comarca catalana limita con las comarcas de Anoia, Bages y Bergueda?', 'Moianes', 'Baix Llobregat', 'Garraf', 'Valles Oriental');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que comarca se encuentra en la costa norte de la provincia de Tarragona, conocida por su paisaje vinicola y su puerto pesquero?', 'Baix Ebre', 'Montsia', 'Tarragones', 'Baix Penedes');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que comarca catalana se encuentra la famosa ciudad de Figueres, cuna de Salvador Dali?', 'Alt Emporda', 'Baix Emporda', 'Girones', 'Selva');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual de las siguientes comarcas pertenece a la provincia de Barcelona?', 'Anoia', 'Alt Emporda', 'Baix Penedes', 'Alt Urgell');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que comarca de Tarragona se encuentran las famosas playas de la Costa Dorada?', 'Baix Penedes', 'Baix Ebre', 'Montsia', 'Alt Camp');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que comarca de la provincia de Lleida se encuentra la ciudad de Balaguer?', 'Noguera', 'Segria', 'Garrigues', 'Pla dUrgell');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que comarca pertenece a la provincia de Girona y es conocida por su patrimonio medieval, como el monasterio de Sant Pere de Rodes?', 'Alt Emporda', 'Selva', 'Baix Emporda', 'Girones');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que comarca de Cataluna es famosa por ser la cuna del modernismo y tener un importante patrimonio arquitectonico como la Casa Batllo?', 'Valles Occidental', 'Baix Llobregat', 'Barcelona', 'Garraf');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que comarca de Cataluna se encuentra la ciudad de Reus, famosa por ser la ciudad natal de Antoni Gaudi?', 'Baix Camp', 'Conca de Barbera', 'Priorat', 'Alt Camp');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que comarca de la provincia de Barcelona se encuentra el Parque Natural de la Sierra de Collserola?', 'Valles Occidental', 'Baix Llobregat', 'Anoia', 'Maresme');

INSERT INTO PreguntasGeografia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que comarca catalana limita con el mar Mediterraneo y es conocida por sus bellas playas y el Delta del Ebro?', 'Montsia', 'Baix Penedes', 'Selva', 'Alt Emporda');
INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el valor aproximado de la constante de Planck?', '6.626 × 10^-34 J·s', '1.602 × 10^-19 J', '9.8 m/s^2', '3.14');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que fenomeno fisico es descrito por la ecuacion de Schrodinger en mecanica cuantica?', 'La evolucion temporal de una funcion de onda', 'El comportamiento de los fluidos', 'La ley de la gravitacion universal', 'La relatividad general');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el principal mecanismo por el cual las celulas eucariotas generan ATP?', 'Quimiosmosis en las mitocondrias', 'Fosforilacion en el citoplasma', 'Transporte activo en la membrana', 'Fermentacion en el nucleo');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que teoria describe el origen de la vida en la Tierra a partir de moleculas simples que evolucionaron hacia formas mas complejas?', 'Teoria de la abiogenesis', 'Teoria del Big Bang', 'Teoria de la evolucion de Lamarck', 'Teoria del diseno inteligente');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el nombre del principio fisico que establece que la energia no puede ser creada ni destruida, solo transformada?', 'Ley de conservacion de la energia', 'Teoria de la relatividad', 'Ley de los gases ideales', 'Principio de incertidumbre de Heisenberg');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Como se llama la constante que describe la aceleracion de un objeto en caida libre cerca de la superficie terrestre?', 'Aceleracion debida a la gravedad (g)', 'Constante de Planck (h)', 'Velocidad de la luz (c)', 'Constante universal de gravitacion (G)');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que propiedad quimica define la cantidad de moles de soluto presentes en un litro de solucion?', 'Molaridad', 'Molalidad', 'Normalidad', 'Fraccion molar');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que experimento demostro la dualidad onda-particula de la luz?', 'Experimento de la doble rendija', 'Experimento de Cavendish', 'Experimento de Rutherford', 'Experimento de Millikan');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la particula subatomica responsable de la carga positiva en el nucleo de los atomos?', 'Proton', 'Neutron', 'Electron', 'Quark');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que es el "colapso de la funcion de onda" en mecanica cuantica?', 'La transicion de una funcion de onda a un estado especifico cuando se realiza una medicion', 'El paso de la materia de estado solido a liquido', 'La liberacion de energia al hacer colapsar un atomo', 'El proceso de aceleracion de particulas a altas velocidades');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Que es el Principio de Exclusion de Pauli?', 'No puede haber dos electrones en un atomo con los mismos numeros cuanticos', 'El momento de inercia de un objeto depende de su masa', 'La energia no se crea ni se destruye', 'El spin de los electrones afecta a su ubicacion en la orbita');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es el fenomeno que describe el cambio en la frecuencia de una onda a medida que su fuente se aleja o acerca?', 'Efecto Doppler', 'Ley de Coulomb', 'Ley de Ohm', 'Efecto Joule');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que consisten las "vibraciones libres" de un sistema mecanico?', 'Oscilaciones en las que el sistema oscila a su frecuencia natural sin intervencion externa', 'Oscilaciones causadas por un estimulo periodico', 'El cambio en la temperatura de un sistema', 'El proceso de intercambio de energia termica');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('Cual es la ecuacion que describe la ley de los gases ideales?', 'PV = nRT', 'F = ma', 'E = mc^2', 'V = IR');

INSERT INTO PreguntasCiencia (Pregunta, respuesta1, respuesta2, respuesta3, respuesta4)
VALUES ('En que parte de la celula eucariota se lleva a cabo la sintesis de proteinas?', 'Ribosomas', 'Mitocondrias', 'Nucleo', 'Lisosomas');
