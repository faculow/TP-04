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
    Tipo VARCHAR(30) NOT NULL,
    NumeroAlbum INT NOT NULL,
    PosicionJuego VARCHAR(30) NOT NULL,
    Imagen VARCHAR(150) NOT NULL,

    IdPais INT NOT NULL,

    CONSTRAINT FK_Figurita_Pais
    FOREIGN KEY (IdPais)
    REFERENCES Pais(IdPais)
);


CREATE TABLE Sobre
(
    IdSobre INT IDENTITY(1,1) PRIMARY KEY,
    FechaApertura DATETIME DEFAULT GETDATE()
);


CREATE TABLE SobreFigurita
(
    Id INT IDENTITY(1,1) PRIMARY KEY,

    IdSobre INT NOT NULL,
    IdFigurita INT NOT NULL,

    CONSTRAINT FK_SobreFigurita_Sobre
        FOREIGN KEY (IdSobre)
        REFERENCES Sobre(IdSobre),

    CONSTRAINT FK_SobreFigurita_Figurita
        FOREIGN KEY (IdFigurita)
        REFERENCES Figurita(IdFigurita)
);


CREATE TABLE FiguritaPegada
(
    Id INT IDENTITY(1,1) PRIMARY KEY,

    IdFigurita INT NOT NULL,

    CONSTRAINT FK_FiguritaPegada
        FOREIGN KEY (IdFigurita)
        REFERENCES Figurita(IdFigurita)
);


CREATE TABLE FiguritaPendiente
(
    Id INT IDENTITY(1,1) PRIMARY KEY,

    IdFigurita INT NOT NULL,

    CONSTRAINT FK_FiguritaPendiente
        FOREIGN KEY (IdFigurita)
        REFERENCES Figurita(IdFigurita)
);


CREATE TABLE FiguritaRepetida
(
    Id INT IDENTITY(1,1) PRIMARY KEY,

    IdFigurita INT NOT NULL,

    CONSTRAINT FK_FiguritaRepetida
        FOREIGN KEY (IdFigurita)
        REFERENCES Figurita(IdFigurita)
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

INSERT INTO Figurita (Nombre, Tipo, NumeroAlbum, PosicionJuego, Imagen, IdPais) VALUES
('Escudo España','Escudo',9,'-','escudo_espana.png',2),
('Formación España','Formación',10,'-','formacion_espana.png',2),
('Unai Simón','Jugador',11,'Arquero','unai_simon.jpg',2),
('Robin Le Normand','Jugador',12,'Defensor','le_normand.jpg',2),
('Rodri','Jugador',13,'Mediocampista','rodri.jpg',2),
('Pedri','Jugador',14,'Mediocampista','pedri.jpg',2),
('Lamine Yamal','Jugador',15,'Delantero','lamine_yamal.jpg',2),
('Álvaro Morata','Jugador',16,'Delantero','morata.jpg',2),

('Escudo Alemania','Escudo',17,'-','escudo_alemania.png',3),
('Formación Alemania','Formación',18,'-','formacion_alemania.png',3),
('Manuel Neuer','Jugador',19,'Arquero','neuer.jpg',3),
('Antonio Rüdiger','Jugador',20,'Defensor','rudiger.jpg',3),
('Joshua Kimmich','Jugador',21,'Mediocampista','kimmich.jpg',3),
('Florian Wirtz','Jugador',22,'Mediocampista','wirtz.jpg',3),
('Jamal Musiala','Jugador',23,'Delantero','musiala.jpg',3),
('Kai Havertz','Jugador',24,'Delantero','havertz.jpg',3),

('Escudo Inglaterra','Escudo',25,'-','escudo_inglaterra.png',4),
('Formación Inglaterra','Formación',26,'-','formacion_inglaterra.png',4),
('Jordan Pickford','Jugador',27,'Arquero','pickford.jpg',4),
('John Stones','Jugador',28,'Defensor','stones.jpg',4),
('Declan Rice','Jugador',29,'Mediocampista','rice.jpg',4),
('Jude Bellingham','Jugador',30,'Mediocampista','bellingham.jpg',4),
('Bukayo Saka','Jugador',31,'Delantero','saka.jpg',4),
('Harry Kane','Jugador',32,'Delantero','kane.jpg',4),

('Escudo Francia','Escudo',33,'-','escudo_francia.png',5),
('Formación Francia','Formación',34,'-','formacion_francia.png',5),
('Mike Maignan','Jugador',35,'Arquero','maignan.jpg',5),
('William Saliba','Jugador',36,'Defensor','saliba.jpg',5),
('Aurélien Tchouaméni','Jugador',37,'Mediocampista','tchouameni.jpg',5),
('Adrien Rabiot','Jugador',38,'Mediocampista','rabiot.jpg',5),
('Ousmane Dembélé','Jugador',39,'Delantero','dembele.jpg',5),
('Kylian Mbappé','Jugador',40,'Delantero','mbappe.jpg',5),

('Escudo Uruguay','Escudo',41,'-','escudo_uruguay.png',6),
('Formación Uruguay','Formación',42,'-','formacion_uruguay.png',6),
('Sergio Rochet','Jugador',43,'Arquero','rochet.jpg',6),
('Ronald Araújo','Jugador',44,'Defensor','araujo.jpg',6),
('Federico Valverde','Jugador',45,'Mediocampista','valverde.jpg',6),
('Manuel Ugarte','Jugador',46,'Mediocampista','ugarte.jpg',6),
('Darwin Núñez','Jugador',47,'Delantero','darwin.jpg',6),
('Luis Suárez','Jugador',48,'Delantero','suarez.jpg',6),

('Escudo Portugal','Escudo',49,'-','escudo_portugal.png',7),
('Formación Portugal','Formación',50,'-','formacion_portugal.png',7),
('Diogo Costa','Jugador',51,'Arquero','diogo_costa.jpg',7),
('Rúben Dias','Jugador',52,'Defensor','ruben_dias.jpg',7),
('Bruno Fernandes','Jugador',53,'Mediocampista','bruno_fernandes.jpg',7),
('Vitinha','Jugador',54,'Mediocampista','vitinha.jpg',7),
('Rafael Leão','Jugador',55,'Delantero','rafael_leao.jpg',7),
('Cristiano Ronaldo','Jugador',56,'Delantero','cristiano_ronaldo.jpg',7),

('Escudo Países Bajos','Escudo',57,'-','escudo_paises_bajos.png',8),
('Formación Países Bajos','Formación',58,'-','formacion_paises_bajos.png',8),
('Bart Verbruggen','Jugador',59,'Arquero','verbruggen.jpg',8),
('Virgil van Dijk','Jugador',60,'Defensor','vandijk.jpg',8),
('Frenkie de Jong','Jugador',61,'Mediocampista','dejong.jpg',8),
('Tijjani Reijnders','Jugador',62,'Mediocampista','reijnders.jpg',8),
('Xavi Simons','Jugador',63,'Delantero','xavi_simons.jpg',8),
('Cody Gakpo','Jugador',64,'Delantero','gakpo.jpg',8);

