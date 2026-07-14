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
(1, 'emiliano-martinez.jpg', 1, 1, 0), (2, 'cristian_romero.jpg.png', 2, 1, 0), (3, 'Nicolas-Otamendi.jpg', 3, 1, 0), (4, 'Rodrigo-de-Paul.jpg', 4, 1, 0), (5, 'Alexis-Mac-Allister.jpg', 5, 1, 0), (6, 'Lionel-Messi.jpg', 6, 1, 0),
-- España
(7, 'Unai-Simon.jpg', 7, 2, 0), (8, 'Robin-Le-Normand.jpg', 8, 2, 0), (9, 'rodri.jpg', 9, 2, 0), (10, 'Pedri.jpg', 10, 2, 0), (11, 'Lamine-Yamal.jpg', 11, 2, 0), (12, 'Mikel-Oyarzabal.jpg', 12, 2, 0),
-- Alemania
(13, 'Manuel-Neuer.jpg', 13, 3, 0), (14, 'Antonio-Rudiger.jpg', 14, 3, 0), (15, 'Joshua-Kimmich.jpg', 15, 3, 0), (16, 'Florian-Wirtz.jpg', 16, 3, 0), (17, 'Jamal-Musiala.jpg', 17, 3, 0), (18, 'Kai-Havertz.jpg', 18, 3, 0),
-- Inglaterra
(19, 'Jordan-Pickford.jpg', 19, 4, 0), (20, 'Marc-Guehi.jpg', 20, 4, 0), (21, 'Declan-Rice.jpg', 21, 4, 0), (22, 'Jude-Bellingham.jpg', 22, 4, 0), (23, 'Bukayo-Saka.jpg', 23, 4, 0), (24, 'Harry-Kane.jpg', 24, 4, 0),
-- Francia
(25, 'Mike-Maignan.jpg', 25, 5, 0), (26, 'William-Saliba.jpg', 26, 5, 0), (27, 'Aurelien-Tchouameni.jpg', 27, 5, 0), (28, 'Adrien-Rabiot.jpg', 28, 5, 0), (29, 'Ousmane-Dembele.jpg', 29, 5, 0), (30, 'Kylian-Mbappe.jpg', 30, 5, 0),
-- Uruguay
(31, 'Sergio-Rochet.jpg', 31, 6, 0), (32, 'Ronald-Araujo.jpg', 32, 6, 0), (33, 'Federico-Valverde.jpg', 33, 6, 0), (34, 'Manuel-Ugarte.jpg', 34, 6, 0), (35, 'Darwin-Nuñez.jpg', 35, 6, 0), (36, 'Nahitan-Nandez.jpg', 36, 6, 0),
-- Portugal
(37, 'Diogo-Costa.jpg', 37, 7, 0), (38, 'Ruben-Dias.jpg', 38, 7, 0), (39, 'Bruno_Fernandes.jpg', 39, 7, 0), (40, 'vitinha.jpg', 40, 7, 0), (41, 'Rafael-Leao.jpg', 41, 7, 0), (42, 'Cristiano-Ronaldo.jpg', 42, 7, 0),
-- Países Bajos
(43, 'Bart-Verbruggen.jpg', 43, 8, 0), (44, 'Virgil-Van-Dijk.jpg', 44, 8, 0), (45, 'Frankie-De-Jong.jpg', 45, 8, 0), (46, 'Tijjani-Reijnders.jpg', 46, 8, 0), (47, 'Xavi-Simons.jpg', 47, 8, 0), (48, 'Cody-Gakpo.jpg', 48, 8, 0);
SET IDENTITY_INSERT Figurita OFF;
GO