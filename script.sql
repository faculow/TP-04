CREATE DATABASE AlbumMundial;
GO

USE AlbumMundial;
GO

CREATE TABLE Pais
(
    IdPais INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    CantFiguritas INT NOT NULL
);

CREATE TABLE Figurita
(
    IdFigurita INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Tipo VARCHAR(20) NOT NULL,
    Imagen VARCHAR(100)
    IdPais int
);


INSERT INTO Pais (Nombre, CantFiguritas)
VALUES
('Argentina',8),
('España',8),
('Alemania',8),
('Inglaterra',8),
('Francia',8),
('Uruguay',8),
('Portugal',8),
('Países Bajos',8);

INSERT INTO Figurita (Nombre, Tipo, NumeroAlbum, PosicionJuego, Imagen)
VALUES
('Escudo Argentina','Escudo',1,'-','escudo_argentina.png'),
('Formacion Argentina','Formacion',2,'-','formacion_argentina.png'),
('Emiliano Martinez','Jugador',3,'Arquero','emiliano_martinez.jpg'),
('Cristian Romero','Jugador',4,'Defensor','cristian_romero.jpg'),
('Enzo Fernandez','Jugador',5,'Mediocampista','enzo_fernandez.jpg'),
('Rodrigo De Paul','Jugador',6,'Mediocampista','de_paul.jpg'),
('Julian Alvarez','Jugador',7,'Delantero','julian_alvarez.jpg'),
('Lionel Messi','Jugador',8,'Delantero','messi.jpg'),

('Escudo España','Escudo',9,'-','escudo_espana.png'),
('Formacion España','Formacion',10,'-','formacion_espana.png'),
('Unai Simon','Jugador',11,'Arquero','unai_simon.jpg'),
('Robin Le Normand','Jugador',12,'Defensor','le_normand.jpg'),
('Rodri','Jugador',13,'Mediocampista','rodri.jpg'),
('Pedri','Jugador',14,'Mediocampista','pedri.jpg'),
('Lamine Yamal','Jugador',15,'Delantero','lamine_yamal.jpg'),
('Alvaro Morata','Jugador',16,'Delantero','morata.jpg'),

('Escudo Alemania','Escudo',17,'-','escudo_alemania.png'),
('Formacion Alemania','Formacion',18,'-','formacion_alemania.png'),
('Manuel Neuer','Jugador',19,'Arquero','neuer.jpg'),
('Antonio Rudiger','Jugador',20,'Defensor','rudiger.jpg'),
('Joshua Kimmich','Jugador',21,'Mediocampista','kimmich.jpg'),
('Florian Wirtz','Jugador',22,'Mediocampista','wirtz.jpg'),
('Jamal Musiala','Jugador',23,'Delantero','musiala.jpg'),
('Kai Havertz','Jugador',24,'Delantero','havertz.jpg'),

('Escudo Inglaterra','Escudo',25,'-','escudo_inglaterra.png'),
('Formacion Inglaterra','Formacion',26,'-','formacion_inglaterra.png'),
('Jordan Pickford','Jugador',27,'Arquero','pickford.jpg'),
('John Stones','Jugador',28,'Defensor','stones.jpg'),
('Declan Rice','Jugador',29,'Mediocampista','rice.jpg'),
('Jude Bellingham','Jugador',30,'Mediocampista','bellingham.jpg'),
('Bukayo Saka','Jugador',31,'Delantero','saka.jpg'),
('Harry Kane','Jugador',32,'Delantero','kane.jpg'),

('Escudo Francia','Escudo',33,'-','escudo_francia.png'),
('Formacion Francia','Formacion',34,'-','formacion_francia.png'),
('Mike Maignan','Jugador',35,'Arquero','maignan.jpg'),
('William Saliba','Jugador',36,'Defensor','saliba.jpg'),
('Aurelien Tchouameni','Jugador',37,'Mediocampista','tchouameni.jpg'),
('Adrien Rabiot','Jugador',38,'Mediocampista','rabiot.jpg'),
('Ousmane Dembele','Jugador',39,'Delantero','dembele.jpg'),
('Kylian Mbappe','Jugador',40,'Delantero','mbappe.jpg'),

('Escudo Uruguay','Escudo',41,'-','escudo_uruguay.png'),
('Formacion Uruguay','Formacion',42,'-','formacion_uruguay.png'),
('Sergio Rochet','Jugador',43,'Arquero','rochet.jpg'),
('Ronald Araujo','Jugador',44,'Defensor','araujo.jpg'),
('Federico Valverde','Jugador',45,'Mediocampista','valverde.jpg'),
('Manuel Ugarte','Jugador',46,'Mediocampista','ugarte.jpg'),
('Darwin Nunez','Jugador',47,'Delantero','darwin.jpg'),
('Luis Suarez','Jugador',48,'Delantero','suarez.jpg'),

('Escudo Portugal','Escudo',49,'-','escudo_portugal.png'),
('Formacion Portugal','Formacion',50,'-','formacion_portugal.png'),
('Diogo Costa','Jugador',51,'Arquero','diogo_costa.jpg'),
('Ruben Dias','Jugador',52,'Defensor','ruben_dias.jpg'),
('Bruno Fernandes','Jugador',53,'Mediocampista','bruno_fernandes.jpg'),
('Vitinha','Jugador',54,'Mediocampista','vitinha.jpg'),
('Rafael Leao','Jugador',55,'Delantero','rafael_leao.jpg'),
('Cristiano Ronaldo','Jugador',56,'Delantero','cristiano_ronaldo.jpg'),

('Escudo Paises Bajos','Escudo',57,'-','escudo_paises_bajos.png'),
('Formacion Paises Bajos','Formacion',58,'-','formacion_paises_bajos.png'),
('Bart Verbruggen','Jugador',59,'Arquero','verbruggen.jpg'),
('Virgil van Dijk','Jugador',60,'Defensor','vandijk.jpg'),
('Frenkie de Jong','Jugador',61,'Mediocampista','dejong.jpg'),
('Tijjani Reijnders','Jugador',62,'Mediocampista','reijnders.jpg'),
('Xavi Simons','Jugador',63,'Delantero','xavi_simons.jpg'),
('Cody Gakpo','Jugador',64,'Delantero','gakpo.jpg');

INSERT INTO FiguritaXPais
VALUES
(1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),
(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),
(17,3),(18,3),(19,3),(20,3),(21,3),(22,3),(23,3),(24,3),
(25,4),(26,4),(27,4),(28,4),(29,4),(30,4),(31,4),(32,4),
(33,5),(34,5),(35,5),(36,5),(37,5),(38,5),(39,5),(40,5),
(41,6),(42,6),(43,6),(44,6),(45,6),(46,6),(47,6),(48,6),
(49,7),(50,7),(51,7),(52,7),(53,7),(54,7),(55,7),(56,7),
(57,8),(58,8),(59,8),(60,8),(61,8),(62,8),(63,8),(64,8);