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
    Imagen VARCHAR(150) NOT NULL,
    IdJugador int,
    IdPais int
);
GO

ALTER TABLE Figurita
ADD CONSTRAINT FK_Figurita_Jugador
FOREIGN KEY (IdJugador)
REFERENCES Jugador(IdJugador);
GO

ALTER TABLE Figurita
ADD CONSTRAINT FK_Figurita_Pais
FOREIGN KEY (IdPais)
REFERENCES Pais(IdPais);
GO

CREATE TABLE Jugador (
    idJugador INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    posicion VARCHAR(50) NOT NULL
);

INSERT INTO Pais (Nombre, CantFiguritas)
VALUES
('Argentina',8), ('España',8), ('Alemania',8), ('Inglaterra',8),
('Francia',8), ('Uruguay',8), ('Portugal',8), ('Países Bajos',8);

SET IDENTITY_INSERT Jugador ON;
INSERT INTO Jugador (idJugador, nombre, apellido, posicion) 
VALUES
-- Argentina
(1,'Emiliano', 'Martínez', 'Arquero'),
(2,'Cristian', 'Romero', 'Defensor'),
(3,'Nicolás', 'Otamendi', 'Defensor'),
(4,'Rodrigo', 'De Paul', 'Mediocampista'),
(5,'Alexis', 'Mac Allister', 'Mediocampista'),
(6,'Lionel', 'Messi', 'Delantero'),
-- España
(7, 'Unai', 'Simón', 'Arquero'),
(8, 'Robin', 'Le Normand', 'Defensor'),
(9, 'Rodrigo', 'Hernández', 'Mediocampista'),
(10, 'Pedro', 'González', 'Mediocampista'),
(11, 'Lamine', 'Yamal', 'Delantero'),
(12, 'Álvaro', 'Morata', 'Delantero'),
-- Alemania
(13, 'Manuel', 'Neuer', 'Arquero'),
(14, 'Antonio', 'Rüdiger', 'Defensor'),
(15, 'Joshua', 'Kimmich', 'Mediocampista'),
(16, 'Florian', 'Wirtz', 'Mediocampista'),
(17, 'Jamal', 'Musiala', 'Mediocampista'),
(18, 'Kai', 'Havertz', 'Delantero'),
-- Inglaterra
(19, 'Jordan', 'Pickford', 'Arquero'),
(20, 'John', 'Stones', 'Defensor'),
(21, 'Declan', 'Rice', 'Mediocampista'),
(22, 'Jude', 'Bellingham', 'Mediocampista'),
(23, 'Bukayo', 'Saka', 'Delantero'),
(24, 'Harry', 'Kane', 'Delantero'),
-- Francia
(25, 'Mike', 'Maignan', 'Arquero'),
(26, 'William', 'Saliba', 'Defensor'),
(27, 'Aurélien', 'Tchouaméni', 'Mediocampista'),
(28, 'Adrien', 'Rabiot', 'Mediocampista'),
(29, 'Ousmane', 'Dembélé', 'Delantero'),
(30, 'Kylian', 'Mbappé', 'Delantero'),
-- Uruguay
(31, 'Sergio', 'Rochet', 'Arquero'),
(32, 'Ronald', 'Araújo', 'Defensor'),
(33, 'Federico', 'Valverde', 'Mediocampista'),
(34, 'Manuel', 'Ugarte', 'Mediocampista'),
(35, 'Darwin', 'Núñez', 'Delantero'),
(36, 'Luis', 'Suárez', 'Delantero'),
-- Portugal
(37, 'Diogo', 'Costa', 'Arquero'),
(38, 'Rúben', 'Dias', 'Defensor'),
(39, 'Bruno', 'Fernandes', 'Mediocampista'),
(40, 'Vitinha', 'Santos', 'Mediocampista'),
(41, 'Rafael', 'Leão', 'Delantero'),
(42, 'Cristiano', 'Ronaldo', 'Delantero'),
-- Países Bajos
(43, 'Bart', 'Verbruggen', 'Arquero'),
(44, 'Virgil', 'van Dijk', 'Defensor'),
(45, 'Frenkie', 'de Jong', 'Mediocampista'),
(46, 'Tijjani', 'Reijnders', 'Mediocampista'),
(47, 'Xavi', 'Simons', 'Mediocampista'),
(48, 'Cody', 'Gakpo', 'Delantero');

SET IDENTITY_INSERT Jugador OFF;

INSERT INTO Figurita (Imagen, IdJugador, IdPais)
VALUES
-- Argentina
('emiliano_martinez.jpg',1,1), ('cristian_romero.jpg',2,1), ('otamendi.jpg',3,1), ('de_paul.jpg',4,1), ('mac_allister.jpg',5,1), ('messi.jpg',6,1),
-- España
('unai_simon.jpg',7,2), ('le_normand.jpg',8,2), ('rodri.jpg',9,2), ('pedri.jpg',10,2), ('lamine_yamal.jpg',11,2), ('morata.jpg',12,2),
-- Alemania
('neuer.jpg',13,3), ('rudiger.jpg',14,3), ('kimmich.jpg',15,3), ('wirtz.jpg',16,3), ('musiala.jpg',17,3), ('havertz.jpg',18,3),
-- Inglaterra
('pickford.jpg',19,4), ('stones.jpg',20,4), ('rice.jpg',21,4), ('bellingham.jpg',22,4), ('saka.jpg',23,4), ('kane.jpg',24,4),
-- Francia
('maignan.jpg',25,5), ('saliba.jpg',26,5), ('tchouameni.jpg',27,5), ('rabiot.jpg',28,5), ('dembele.jpg',29,5), ('mbappe.jpg',30,5),
-- Uruguay
('rochet.jpg',31,6), ('araujo.jpg',32,6), ('valverde.jpg',33,6), ('ugarte.jpg',34,6), ('darwin.jpg',35,6), ('suarez.jpg',36,6),
-- Portugal
('diogo_costa.jpg',37,7), ('ruben_dias.jpg',38,7), ('bruno_fernandes.jpg',39,7), ('vitinha.jpg',40,7), ('rafael_leao.jpg',41,7), ('cristiano_ronaldo.jpg',42,7),
-- Países Bajos
('verbruggen.jpg',43,8), ('vandijk.jpg',44,8), ('dejong.jpg',45,8), ('reijnders.jpg',46,8), ('xavi_simons.jpg',47,8), ('gakpo.jpg',48,8);