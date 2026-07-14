CREATE DATABASE AlbumMundial;
GO

USE AlbumMundial;
GO

-- 1. Crear tabla Pais
CREATE TABLE Pais
(
    IdPais INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    CantFiguritas INT NOT NULL
);

-- 2. Crear tabla Jugador
CREATE TABLE Jugador (
    idJugador INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    posicion VARCHAR(50) NOT NULL
);

-- 3. Crear tabla Figurita (incluye la columna Pegada)
CREATE TABLE Figurita
(
    IdFigurita INT IDENTITY(1,1) PRIMARY KEY,
    Imagen VARCHAR(150) NOT NULL,
    IdJugador INT,
    IdPais INT,
    Pegada BIT NOT NULL
);
GO

-- 4. Agregar relaciones (Claves Foráneas)
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

-- 5. Insertar Países
INSERT INTO Pais (Nombre, CantFiguritas)
VALUES
('Argentina',8), ('España',8), ('Alemania',8), ('Inglaterra',8),
('Francia',8), ('Uruguay',8), ('Portugal',8), ('Países Bajos',8);

-- 6. Insertar Jugadores
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
(12, 'Mikel', 'Oyarzabal', 'Delantero'),
-- Alemania
(13, 'Manuel', 'Neuer', 'Arquero'),
(14, 'Antonio', 'Rüdiger', 'Defensor'),
(15, 'Joshua', 'Kimmich', 'Mediocampista'),
(16, 'Florian', 'Wirtz', 'Mediocampista'),
(17, 'Jamal', 'Musiala', 'Mediocampista'),
(18, 'Kai', 'Havertz', 'Delantero'),
-- Inglaterra
(19, 'Jordan', 'Pickford', 'Arquero'),
(20, 'Marc', 'Guéhi', 'Defensor'),
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
(36, 'Nahitan', 'Nández', 'Mediocampista'),
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

-- 7. Insertar Figuritas
SET IDENTITY_INSERT Figurita ON;
INSERT INTO Figurita (IdFigurita, Imagen, IdJugador, IdPais, Pegada)
VALUES
-- Argentina
(1, 'emiliano_martinez.jpg', 1, 1, 0), (2, 'cristian_romero.jpg', 2, 1, 0), (3, 'otamendi.jpg', 3, 1, 0), (4, 'de_paul.jpg', 4, 1, 0), (5, 'mac_allister.jpg', 5, 1, 0), (6, 'messi.jpg', 6, 1, 0),
-- España
(7, 'unai_simon.jpg', 7, 2, 0), (8, 'le_normand.jpg', 8, 2, 0), (9, 'rodri.jpg', 9, 2, 0), (10, 'pedri.jpg', 10, 2, 0), (11, 'lamine_yamal.jpg', 11, 2, 0), (12, 'oyarzabal.jpg', 12, 2, 0),
-- Alemania
(13, 'neuer.jpg', 13, 3, 0), (14, 'rudiger.jpg', 14, 3, 0), (15, 'kimmich.jpg', 15, 3, 0), (16, 'wirtz.jpg', 16, 3, 0), (17, 'musiala.jpg', 17, 3, 0), (18, 'havertz.jpg', 18, 3, 0),
-- Inglaterra
(19, 'pickford.jpg', 19, 4, 0), (20, 'guehi.jpg', 20, 4, 0), (21, 'rice.jpg', 21, 4, 0), (22, 'bellingham.jpg', 22, 4, 0), (23, 'saka.jpg', 23, 4, 0), (24, 'kane.jpg', 24, 4, 0),
-- Francia
(25, 'maignan.jpg', 25, 5, 0), (26, 'saliba.jpg', 26, 5, 0), (27, 'tchouameni.jpg', 27, 5, 0), (28, 'rabiot.jpg', 28, 5, 0), (29, 'dembele.jpg', 29, 5, 0), (30, 'mbappe.jpg', 30, 5, 0),
-- Uruguay
(31, 'rochet.jpg', 31, 6, 0), (32, 'araujo.jpg', 32, 6, 0), (33, 'valverde.jpg', 33, 6, 0), (34, 'ugarte.jpg', 34, 6, 0), (35, 'darwin.jpg', 35, 6, 0), (36, 'nandez.jpg', 36, 6, 0),
-- Portugal
(37, 'diogo_costa.jpg', 37, 7, 0), (38, 'ruben_dias.jpg', 38, 7, 0), (39, 'bruno_fernandes.jpg', 39, 7, 0), (40, 'vitinha.jpg', 40, 7, 0), (41, 'rafael_leao.jpg', 41, 7, 0), (42, 'cristiano_ronaldo.jpg', 42, 7, 0),
-- Países Bajos
(43, 'verbruggen.jpg', 43, 8, 0), (44, 'vandijk.jpg', 44, 8, 0), (45, 'dejong.jpg', 45, 8, 0), (46, 'reijnders.jpg', 46, 8, 0), (47, 'xavi_simons.jpg', 47, 8, 0), (48, 'gakpo.jpg', 48, 8, 0);
SET IDENTITY_INSERT Figurita OFF;
GO