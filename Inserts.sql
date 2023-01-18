use VIDEOJUEGOS
GO

INSERT INTO usuario (nombre , correo , pass ,edad,_admin ) VALUES

('admin','admin@gmail.com','administrador',100,1);

Execute registar_user N'turi' , N'turi@gmail.com' ,N'wasder'

-- delete from usuario

select * from usuario



SELECT * FROM desarrolladora
SELECT * FROM categoria
SELECT * FROM plataforma
SELECT * FROM IDIOMA



INSERT INTO game(titulo,id_desarrolLadora,lanzamiento,id_categoria,id_plataforma,id_idioma) VALUES
('Game',1,GETDATE(),1,1,1);



INSERT INTO genero(nombre) VALUES
('Genero');


INSERT INTO juego_genero(id_juego,id_genero) VALUES
(1,1);



SELECT 
	game.id_juego,
	game.titulo,
	game.lanzamiento, 
	categoria.nombre as categoria,
	plataforma.nombre as plataforma,
	idioma.nombre as idioma,
	genero.nombre as genero
FROM game
	INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
	INNER JOIN plataforma ON plataforma.id_plataforma=GAME.id_plataforma
	INNER JOIN idioma ON idioma.id_idioma=game.id_idioma
	INNER JOIN juego_genero ON juego_genero.id_juego=game.id_juego
	INNER JOIN genero ON genero.id_genero=juego_genero.id_genero







--Consulta para favoritos de un usuario
SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
INNER JOIN no_favoritos ON no_favoritos.id_juego=game.id_juego
WHERE no_favoritos.id_user=1


--para las de el año
SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
INNER JOIN categoria ON categoria.id_categoria=game.id_categoria
WHERE game.lanzamiento BETWEEN DATEFROMPARTS(2022,1,1) and DATEFROMPARTS(2022,12,31)

--consulta defualt
SELECT game.id_juego,game.titulo,categoria.nombre as categoria,game.img as urlIMG FROM game
INNER JOIN categoria ON categoria.id_categoria=game.id_categoria

--pata la pltaforma







