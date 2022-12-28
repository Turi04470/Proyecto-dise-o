
--------------------------------------------------------

--BASE DE DATOS USADA
--EJECUTAR TODA PARA PODER USAR LAS CONSULTAS
----Solis Torres Camilo

----------------------------------------------------------



--Drop database si existe
USE master;
GO
DECLARE @SQL nvarchar(max);
IF EXISTS (SELECT 1 FROM sys.databases WHERE [name] = 'VIDEOJUEGOS') 
BEGIN
    SET @SQL = 
        N'USE VIDEOJUEGOS;
          ALTER DATABASE VIDEOJUEGOS SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
          USE master;
          DROP DATABASE VIDEOJUEGOS;';
    EXEC (@SQL);
    USE master;
END;
GO
---

-- Crea Database

CREATE DATABASE VIDEOJUEGOS  
GO
use VIDEOJUEGOS
GO


CREATE TABLE usuario(
	id_user INT  IDENTITY(1,1) PRIMARY KEY,
	nombre NVARCHAR(50),
	correo NVARCHAR(50),
	pass NVARCHAR(50),
	edad INT,
)

CREATE TABLE desarrolladora(
	id_desarrolLadora INT IDENTITY(1,1) PRIMARY KEY,
	nombre NVARCHAR(50),
	publisher NVARCHAR(50),
)

CREATE TABLE categoria(
	id_categoria INT IDENTITY(1,1) PRIMARY KEY,
	nombre NVARCHAR(50),
	descripcion NVARCHAR(500),
)

CREATE TABLE genero(
	id_genero INT IDENTITY(1,1) PRIMARY KEY,
	nombre NVARCHAR(50),
)

CREATE TABLE game(
	id_juego INT IDENTITY(1,1) PRIMARY KEY,
	titulo NVARCHAR(50),
	año INT,
	id_desarrolLadora INT,
	lanzamiento DATE,
	id_categoria INT,
	plataforma NVARCHAR(20),
	lenguaje NVARCHAR(20),
	FOREIGN KEY (id_categoria) REFERENCES categoria,
	FOREIGN KEY (id_desarrolLadora) REFERENCES desarrolladora,
)

CREATE TABLE juego_genero(
	id_juego INT,
	id_genero INT,
	FOREIGN KEY (id_juego) REFERENCES game,
	FOREIGN KEY (id_genero) REFERENCES genero,
)


CREATE TABLE favoritos(
	id_user INT,
	id_juego INT,
	FOREIGN KEY (id_juego) REFERENCES game,
	FOREIGN KEY (id_user) REFERENCES usuario,
)


CREATE TABLE no_mostrar(
	id_user INT,
	id_juego INT,
	FOREIGN KEY (id_juego) REFERENCES game,
	FOREIGN KEY (id_user) REFERENCES usuario,
)

CREATE TABLE computadora(
	id_user INT,
	procesador NVARCHAR(50),
	graficos NVARCHAR(50),
	ram NVARCHAR(10),
	so NVARCHAR(50),
	FOREIGN KEY (id_user) REFERENCES usuario,
)

CREATE TABLE requeriemientos(
	id_juego INT,
	min_procesador NVARCHAR(50),
	min_graficos NVARCHAR(50),
	min_ram NVARCHAR(10),
	min_so NVARCHAR(50),
	recomendado_procesador NVARCHAR(50),
	recomendado_graficos NVARCHAR(50),
	recomendado_ram NVARCHAR(10),
	recomendado_so NVARCHAR(50),
	FOREIGN KEY (id_juego) REFERENCES game,
)




