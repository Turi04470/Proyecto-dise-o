
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
	correo NVARCHAR(50) UNIQUE,
	pass NVARCHAR(50),
	edad INT DEFAULT 0,
	_admin bit DEFAULT 0,
)

CREATE TABLE desarrolladora(
	id_desarrolladora INT IDENTITY(1,1) PRIMARY KEY,
	nombre NVARCHAR(50) UNIQUE,
	publisher NVARCHAR(50) DEFAULT NULL,
)

CREATE TABLE categoria(
	id_categoria INT IDENTITY(1,1) PRIMARY KEY,
	nombre NVARCHAR(50),
	descripcion NVARCHAR(500) UNIQUE,
)

CREATE TABLE genero(
	id_genero INT IDENTITY(1,1) PRIMARY KEY,
	nombre NVARCHAR(50) UNIQUE,
)


CREATE TABLE idioma(
	id_idioma INT IDENTITY(1,1) PRIMARY KEY,
	nombre NVARCHAR(20) UNIQUE,
)


CREATE TABLE plataforma(
	id_plataforma  INT IDENTITY(1,1) PRIMARY KEY,
	nombre NVARCHAR(50) UNIQUE,
)

CREATE TABLE game(
	id_juego INT IDENTITY(1,1) PRIMARY KEY,
	titulo NVARCHAR(50) UNIQUE,
	id_desarrolLadora INT,
	lanzamiento DATE,
	id_categoria INT,
	id_plataforma int,
	id_idioma INT,
	img NVARCHAR(500) DEFAULT NULL,
	FOREIGN KEY (id_categoria) REFERENCES categoria,
	FOREIGN KEY (id_idioma) REFERENCES idioma,
	FOREIGN KEY (id_plataforma) REFERENCES plataforma,
	FOREIGN KEY (id_desarrolLadora) REFERENCES desarrolladora,
)

CREATE TABLE juego_genero(
	id_juego INT,
	id_genero INT,
	PRIMARY KEY(id_juego,id_genero),
	FOREIGN KEY (id_juego) REFERENCES game,
	FOREIGN KEY (id_genero) REFERENCES genero,
)


CREATE TABLE favoritos(
	id_user INT,
	id_juego INT,
	PRIMARY KEY(id_user,id_juego),
	FOREIGN KEY (id_juego) REFERENCES game,
	FOREIGN KEY (id_user) REFERENCES usuario,
)


CREATE TABLE no_favoritos(
	id_user INT,
	id_juego INT,
	PRIMARY KEY(id_user,id_juego),
	FOREIGN KEY (id_juego) REFERENCES game,
	FOREIGN KEY (id_user) REFERENCES usuario,
)

CREATE TABLE computadora(
	id_user INT PRIMARY KEY,
	procesador NVARCHAR(50),
	graficos NVARCHAR(50),
	ram NVARCHAR(10),
	so NVARCHAR(50),
	FOREIGN KEY (id_user) REFERENCES usuario,
)

CREATE TABLE requeriemientos(
	id_juego INT PRIMARY KEY,
	min_procesador NVARCHAR(200),
	min_graficos NVARCHAR(200),
	min_ram NVARCHAR(10),
	min_so NVARCHAR(50),
	recomendado_procesador NVARCHAR(200),
	recomendado_graficos NVARCHAR(200),
	recomendado_ram NVARCHAR(10),
	recomendado_so NVARCHAR(50),
	FOREIGN KEY (id_juego) REFERENCES game,

)


--PROCEDIMIENTOS

USE VIDEOJUEGOS;
GO

--1
CREATE PROCEDURE registar_user 
	@nombre NVARCHAR(50),
	@correo NVARCHAR(50),
	@pass NVARCHAR(50)
AS
	INSERT INTO usuario(nombre , correo , pass)
	VALUES(@nombre,@correo,@pass);
GO

--2
CREATE PROCEDURE registar_user_admin
	@nombre NVARCHAR(50),
	@correo NVARCHAR(50),
	@pass NVARCHAR(50),
	@_admin bit 
AS
	INSERT INTO usuario(nombre , correo , pass , _admin)
	VALUES(@nombre,@correo,@pass,@_admin);
GO

--3
CREATE PROCEDURE iniciar_sesion 
	@correo NVARCHAR(50),
	@pass NVARCHAR(50)
AS
	SELECT * FROM usuario where correo=@correo and pass=@pass;
GO

--4
CREATE PROCEDURE existe_correo 
	@correo NVARCHAR(50)
AS
	SELECT * FROM usuario where correo=@correo;
GO

--5
CREATE PROCEDURE eiste_pc
	@id_user INT
AS
	SELECT * FROM computadora WHERE id_user=@id_user
GO
--6
CREATE PROCEDURE registar_pc
	@id_user int,
	@procesador NVARCHAR(50),
	@graficos NVARCHAR(50),
	@ram NVARCHAR(10),
	@so NVARCHAR(50)
AS
	INSERT INTO computadora(id_user,procesador,graficos,ram,so) VALUES
	(@id_user,@procesador,@graficos,@ram,@so);
GO

--7
CREATE PROCEDURE update_pc
	@id_user int,
	@procesador NVARCHAR(50),
	@graficos NVARCHAR(50),
	@ram NVARCHAR(10),
	@so NVARCHAR(50)
AS
	UPDATE computadora
	SET 
		
		procesador=@procesador,
		graficos=@graficos,
		ram=@ram,
		so=@so
	WHERE
		id_user=@id_user
GO
--8
CREATE PROCEDURE agregar_categoria
	@nombre NVARCHAR(50),
	@descripcion NVARCHAR(500)
	
AS
	INSERT INTO categoria(nombre,descripcion) VALUES
	(@nombre,@descripcion);
GO


--9
CREATE PROCEDURE agregar_desarrolladora
	@nombre NVARCHAR(50),
	@publisher NVARCHAR(50)
AS
	INSERT INTO desarrolladora(nombre,publisher) VALUES
	(@nombre,@publisher);
GO

--10
CREATE PROCEDURE agregar_plataforma
	@nombre NVARCHAR(20)
AS
	INSERT INTO plataforma(nombre) VALUES
	(@nombre);
GO

--11
CREATE PROCEDURE agregar_genero
	@nombre NVARCHAR(50)
AS
	INSERT INTO genero(nombre) VALUES
	(@nombre);
GO

--12
CREATE PROCEDURE agregar_game
	@titulo NVARCHAR(50),
	@id_desarrolLadora INT,
	@lanzamiento DATE,
	@id_categoria INT,
	@id_plataforma int,
	@id_idioma INT,
	@img NVARCHAR(200)
AS
	INSERT INTO game(titulo,id_desarrolLadora,lanzamiento,id_categoria,id_plataforma,id_idioma,img) VALUES
	(@titulo,@id_desarrolLadora,@lanzamiento,@id_categoria ,@id_plataforma ,@id_idioma,@img);
GO

--13
CREATE PROCEDURE consultar_usuario
	@id_user int
AS
	SELECT * FROM usuario WHERE id_user=@id_user
GO

--14
CREATE PROCEDURE consultar_pc
	@id_user int
AS
	SELECT * FROM computadora WHERE id_user=@id_user
GO

--15
CREATE PROCEDURE actulizar_reque
	@id_juego INT,
	@min_procesador NVARCHAR(200),
	@min_graficos NVARCHAR(200),
	@min_ram NVARCHAR(10),
	@min_so NVARCHAR(50),
	@recomendado_procesador NVARCHAR(200),
	@recomendado_graficos NVARCHAR(200),
	@recomendado_ram NVARCHAR(10),
	@recomendado_so NVARCHAR(50)
AS
	UPDATE requeriemientos
	SET 
		min_Procesador=@min_Procesador,
		min_Graficos=@min_Graficos,
		min_RAM=@min_RAM,
		min_SO=@min_SO,
		recomendado_Procesador=@recomendado_Procesador,
		recomendado_Graficos=@recomendado_Graficos,
		recomendado_RAM=@recomendado_RAM,
		recomendado_SO=@recomendado_SO
	WHERE
	id_juego=@id_juego
GO


INSERT INTO idioma(nombre) VALUES
('Inglés'),
('Chino (Mandarín)'),
('hindi'),
('Español'),
('Francés'),
('Árabe'),
('Bengala'),
('Ruso'),
('Portugués'),
('Indonesio'),
('Japonés'),
('Aleman');

INSERT INTO plataforma VALUES
('Windows 7'),
('Windows 8'),
('Windows 10'),
('Windows 11'),
('Windows 7 en adelante'),
('Windows 8 en adelante'),
('Windows 10 en adelante'),
('Mac OS'),
('Linux'),
('Android'),
('iOS');

INSERT INTO usuario (nombre , correo , pass ,edad,_admin ) VALUES

('admin','admin@gmail.com','administrador',100,1);

INSERT INTO categoria(nombre,descripcion) VALUES
('RPG','Videojuego de ROL'),
('Acción','Se trata de un género caracterizado por el frenetismo y una gran inmersión. Implican realizar alguna acción repetitiva como pulsar mucho ciertas combinaciones de botones para realizar un movimiento. Debido a esto, suelen exigir una alta concentración'),
('Aventura','Este es uno de los tipos de videojuegos más importante ya que los peligros y las grandes hazañas están presentes en cada esquina. El protagonista del juego debe atravesar extensos niveles repletos de muchos enemigos y valerse de diferentes ítems para lograr sus objetivos.'),
('Arcade','Se trata de juegos sencillos que manejan elementos de poca complejidad como una aventura, laberintos o plataformas. Es necesario atravesar diferentes pantallas para avanzar. Su ritmo facilita adaptarse rápido al juego por primera vez.'),
('Deportes','Tal y como indica su nombre, se trata de juegos basados en deportes reales como fútbol, boxeo, golf, tenis o baloncesto, entre otros. Suelen exigir habilidad y precisión'),
('Estrategia','Estos juegos suelen manejar conceptos bélicos y de rol. Están diseñados para que el objetivo sea vencer al enemigo mediante una estrategia. Implican concentración e inteligencia.'),
('Simulación','En este género se pueden encontrar videojuegos muy variados, pues se basan en simular algún elemento de la vida real como la conducción de un coche, un avión, un tren, el trabajo de un cirujano o incluso la vida de un animal');

INSERT INTO desarrolladora(nombre,publisher) VALUES
('FromSoftware','Bandai Namco Entertainment'),
('Team Cherry',null),
('Crytek',null),
('PlatinumGames','SEGA');

INSERT INTO game(titulo,id_desarrolLadora,lanzamiento,id_categoria,id_plataforma,id_idioma,img) VALUES
('Elden Ring',1,'2022-2-25',1,3,1,'https://elamigosedition.com/uploads/posts/2021-11/elden-ring-cover-download.webp'),
('Hollow Knight',2,'2017-2-24',6,3,1,'https://elamigosedition.com/uploads/posts/2019-05/1557485836_hollow-knight-cover-download.webp'),
('Crysis 2',3,'2011-3-22',2,5,1,'https://elamigosedition.com/uploads/posts/2022-11/crysis-2-remastered-cover-download.webp'),
('Bayoneta',4,'2017-4-11',2,5,1,'https://elamigosedition.com/uploads/posts/2019-05/1556706731_bayonetta-cover-download.webp');

INSERT INTO requeriemientos(id_juego,min_procesador,min_graficos,min_ram,min_so,recomendado_procesador,recomendado_graficos,recomendado_ram,recomendado_so) VALUES
(1,'Intel Core i5-8400 2.8 GHz / AMD Ryzen 3 3300X 3.8 GHz','3 GB GeForce GTX 1060 / 4 GB Radeon RX 580','12 GB RAM','Windows 10','Intel Core i7-8700K 3.7 GHz / AMD Ryzen 5 3600X 3.8 GHz','8 GB GeForce GTX 1070 / Radeon RX Vega 56','16 GB RAM','Windows 10/11');


INSERT INTO favoritos(id_user,id_juego) VALUES
(1,2);
