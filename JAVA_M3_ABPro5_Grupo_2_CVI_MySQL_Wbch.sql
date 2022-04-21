/*
Parte 1: Crear entorno de trabajo.

a)	Crear una base de datos.
b)	Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.

Parte 2: Crear dos tablas.

c)	La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido, contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).
d)	La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)).

Parte 3: Modificación de la tabla.

e)	Modifique el UTC por defecto.Desde UTC-3 a UTC-2.

Parte 4: Creación de registros.

f)	Para cada tabla crea 8 registros.

Parte 5:

g)	Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?

Parte 6:

h)	Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de teléfono, correo electrónico).

Parte 7:

i)	Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.

j)	El ejercicio debe ser subido a github y al Nodo Virtual.

*/
-- Parte 1: Crear entorno de trabajo.
-- a)	Crear una base de datos.
CREATE SCHEMA `abpro5` DEFAULT CHARACTER SET utf8;
USE abpro5;

/* b)	Crear un usuario con todos los privilegios para trabajar con la
base de datos recién creada. */
CREATE USER 'abpro5user'@'localhost' IDENTIFIED BY 'abpro5';
GRANT ALL PRIVILEGES ON abpro5.* TO 'abpro5user'@'localhost';

-- Parte 2: Crear dos tablas.
/* c)	La primera almacena a los usuarios de la aplicación (id_usuario,
nombre, apellido, contraseña, zona horaria (por defecto UTC-3), género
y teléfono de contacto). */
CREATE TABLE usuario (
usu_ID			MEDIUMINT NOT NULL,
usu_nombre		VARCHAR(40) NOT NULL,
usu_apellido	VARCHAR(40) NOT NULL,
usu_password	VARCHAR(20) NOT NULL,
usu_utcZone		VARCHAR(60) NOT NULL DEFAULT 'UTC-3',
usu_genero		VARCHAR(10) NOT NULL,
usu_fone		VARCHAR(20) NOT NULL
);

/* d)	La segunda tabla almacena información relacionada a la fecha-hora
de ingreso de los usuarios a la plataforma (id_ingreso, id_usuario y la
fecha-hora de ingreso (por defecto la fecha-hora actual)). */
CREATE TABLE userlogin (
userlog_ID			MEDIUMINT	NOT NULL,
usu_ID				MEDIUMINT	NOT NULL,
userlog_dateTime	DATETIME	NOT NULL DEFAULT CURRENT_TIMESTAMP,
userlog_timesTamp	TIMESTAMP	NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Parte 3: Modificación de la tabla.
-- e)	Modifique el UTC por defecto.Desde UTC-3 a UTC-2.
	-- Antes de la modificación.
DESCRIBE usuario;

ALTER TABLE usuario MODIFY COLUMN usu_utcZone
VARCHAR(60) NOT NULL DEFAULT 'UTC-2';
	-- Después de la modificación.
DESCRIBE usuario;

-- Parte 4: Creación de registros.
-- f)	Para cada tabla crea 8 registros.
	-- Para tabla usuarios:
INSERT INTO usuario
(usu_ID, usu_nombre, usu_apellido, usu_password, usu_genero, usu_fone)
VALUES
('1','Juana','Perez','jperez22','F','+56987654321'),
('2','Dali','Rojas','rojas231','M','+56322680544'),
('3','Francisco','Rojas','fran123','M','+56324174540'),
('4','Esperanza','Muñoz','ranza00','F','+56320700944'),
('5','Carlos','Valdebenito','kikeh22611','M','+56325999854'),
('6','Rodrigo','Ortiz','fecimo4119','M','+56322227660'),
('7','Norma','Canio','yalibot478','F','+56328853260'),
('8','Gabriel','Medina','danole2','M','+56323033484');
SELECT * FROM usuario;
	-- Para tabla userlogin:
    -- En momentos distintos para probar el DEFAULT:
INSERT INTO userlogin (userlog_ID, usu_ID) VALUES ('1','1');
SELECT * FROM userlogin;

INSERT INTO userlogin (userlog_ID, usu_ID) VALUES ('2','4');
SELECT * FROM userlogin;

INSERT INTO userlogin (userlog_ID, usu_ID) VALUES ('3','7');
SELECT * FROM userlogin;

	-- INSERT normal:
INSERT INTO userlogin
(userlog_ID, usu_ID, userlog_dateTime, userlog_timesTamp)
VALUES
('4','2','2022-04-18 13:06:45','2022-04-18 13:06:45'),
('5','3','2022-04-17 10:05:41','2022-04-17 10:05:41'),
('6','5','2022-04-15 16:59:52','2022-04-15 16:59:52'),
('7','6','2022-04-02 18:47:36','2022-04-02 18:47:36'),
('8','8','2022-04-01 23:05:00','2022-04-18 23:05:00');
SELECT * FROM userlogin;

-- Parte 5:
/* g)	Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada
caso? */
DESCRIBE usuario;
DESCRIBE userlogin;

-- Parte 6:
/* h)	Creen una nueva tabla llamada Contactos (id_contacto, id_usuario,
numero de teléfono, correo electrónico). */
CREATE TABLE contacto (
contacto_ID		MEDIUMINT	NOT NULL,
usu_ID			MEDIUMINT	NOT NULL,
contacto_fone	VARCHAR(20) NOT NULL,
contacto_email	VARCHAR(60) NOT NULL
);

-- Parte 7:
/* i)	Modifique la columna teléfono de contacto, para crear un vínculo
entre la tabla Usuarios y la tabla Contactos. */
	-- Creando Primary Key en tabla usuario.
ALTER TABLE usuario ADD CONSTRAINT usuario_usu_fone_pk PRIMARY KEY (usu_fone);
DESCRIBE usuario;

	-- Creando Foreign Key en tabla contacto.
ALTER TABLE contacto ADD CONSTRAINT contacto_contacto_fone_fk FOREIGN KEY (contacto_fone)
REFERENCES usuario(usu_fone);
DESCRIBE contacto;

-- j)	El ejercicio debe ser subido a github y al Nodo Virtual.




































/*********************** DESARROLLO B ***********************/
/*
Parte 1: Crear entorno de trabajo.

a)	Crear una base de datos.
b)	Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.

Parte 2: Crear dos tablas.

c)	La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido, contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).
d)	La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)).

Parte 3: Modificación de la tabla.

e)	Modifique el UTC por defecto.Desde UTC-3 a UTC-2.

Parte 4: Creación de registros.

f)	Para cada tabla crea 8 registros.

Parte 5:

g)	Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?

Parte 6:

h)	Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de teléfono, correo electrónico).

Parte 7:

i)	Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.

j)	El ejercicio debe ser subido a github y al Nodo Virtual.

*/
-- Parte 1: Crear entorno de trabajo.
-- a)	Crear una base de datos.
CREATE SCHEMA `abpro5` DEFAULT CHARACTER SET utf8;
USE abpro5;

/* b)	Crear un usuario con todos los privilegios para trabajar con la
base de datos recién creada. */
CREATE USER 'abpro5user'@'localhost' IDENTIFIED BY 'abpro5';
GRANT ALL PRIVILEGES ON abpro5.* TO 'abpro5user'@'localhost';

-- Parte 2: Crear dos tablas.
/* c)	La primera almacena a los usuarios de la aplicación (id_usuario,
nombre, apellido, contraseña, zona horaria (por defecto UTC-3), género
y teléfono de contacto). */
CREATE TABLE usuario (
usu_ID			MEDIUMINT NOT NULL AUTO_INCREMENT,
usu_nombre		VARCHAR(40) NOT NULL,
usu_apellido	VARCHAR(40) NOT NULL,
usu_password	VARCHAR(20) NOT NULL,
usu_utcZone		VARCHAR(60) NOT NULL DEFAULT 'UTC-3',
usu_genero		VARCHAR(10) NOT NULL,
usu_fone		VARCHAR(20) NOT NULL,
CONSTRAINT usuario_usu_ID_pk PRIMARY KEY (usu_ID)
);

/* d)	La segunda tabla almacena información relacionada a la fecha-hora
de ingreso de los usuarios a la plataforma (id_ingreso, id_usuario y la
fecha-hora de ingreso (por defecto la fecha-hora actual)). */
CREATE TABLE userlogin (
userlog_ID			MEDIUMINT	NOT NULL AUTO_INCREMENT,
usu_ID				MEDIUMINT	NOT NULL,
userlog_dateTime	DATETIME	NOT NULL DEFAULT CURRENT_TIMESTAMP,
userlog_timesTamp	TIMESTAMP	NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT userlogin_userlog_ID_pk PRIMARY KEY (userlog_ID),
CONSTRAINT userlogin_usu_ID_fk	FOREIGN KEY (usu_ID)
REFERENCES usuario(usu_ID)
);

-- Parte 3: Modificación de la tabla.
-- e)	Modifique el UTC por defecto.Desde UTC-3 a UTC-2.
	-- Antes de la modificación.
DESCRIBE usuario;

ALTER TABLE usuario MODIFY COLUMN usu_utcZone
VARCHAR(60) NOT NULL DEFAULT 'UTC-2';
	-- Después de la modificación.
DESCRIBE usuario;

-- Parte 4: Creación de registros.
-- f)	Para cada tabla crea 8 registros.
	-- Para tabla usuarios:
INSERT INTO usuario
(usu_nombre, usu_apellido, usu_password, usu_genero, usu_fone)
VALUES
('Juana','Perez','jperez22','F','+56987654321'),
('Dali','Rojas','rojas231','M','+56322680544'),
('Francisco','Rojas','fran123','M','+56324174540'),
('Esperanza','Muñoz','ranza00','F','+56320700944'),
('Carlos','Valdebenito','kikeh22611','M','+56325999854'),
('Rodrigo','Ortiz','fecimo4119','M','+56322227660'),
('Norma','Canio','yalibot478','F','+56328853260'),
('Gabriel','Medina','danole2','M','+56323033484');
SELECT * FROM usuario;

	-- Para tabla userlogin:
    -- En momentos distintos para probar el DEFAULT:
INSERT INTO userlogin (usu_ID) VALUES ('1');
SELECT * FROM userlogin;
INSERT INTO userlogin (usu_ID) VALUES ('4');
SELECT * FROM userlogin;
INSERT INTO userlogin (usu_ID) VALUES ('7');
SELECT * FROM userlogin;
	-- INSERT normal:
INSERT INTO userlogin
(usu_ID, userlog_dateTime, userlog_timesTamp)
VALUES
('2','2022-04-18 13:06:45','2022-04-18 13:06:45'),
('3','2022-04-17 10:05:41','2022-04-17 10:05:41'),
('5','2022-04-15 16:59:52','2022-04-15 16:59:52'),
('6','2022-04-02 18:47:36','2022-04-02 18:47:36'),
('8','2022-04-01 23:05:00','2022-04-18 23:05:00');

-- Parte 5:
/* g)	Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada
caso? */
DESCRIBE usuario;
DESCRIBE userlogin;

-- Parte 6:
/* h)	Creen una nueva tabla llamada Contactos (id_contacto, id_usuario,
numero de teléfono, correo electrónico). */
CREATE TABLE contacto (
contacto_ID		MEDIUMINT	NOT NULL AUTO_INCREMENT,
usu_ID			MEDIUMINT	NOT NULL,
contacto_fone	VARCHAR(20) NOT NULL,
contacto_email	VARCHAR(60) NOT NULL,
CONSTRAINT contacto_contacto_ID_pk PRIMARY KEY (contacto_ID)
);
DESCRIBE contacto;
/*
INSERT INTO contacto
(usu_ID, contacto_fone, contacto_email)
VALUES
('1','+56987654321','juana@server.com'),
('2','+56322680544','ruxataupijo-7672@yopmail.com'),
('3','+56324174540','buddaxeprewoi-5738@yopmail.com'),
('4','+56320700944','Areeight43@teleworm.us'),
('5','+56325999854','kikeh22611@vsooc.com'),
('6','+56322227660','fecimo4119@vsooc.com'),
('7','+56328853260','yalibot478@whwow.com'),
('8','+56323033484','danole2781@whwow.com');
SELECT * FROM contacto;
*/

-- Parte 7:
/* i)	Modifique la columna teléfono de contacto, para crear un vínculo
entre la tabla Usuarios y la tabla Contactos. */
	/* Modificando las Keys de tablas usuario y userlogin, para vincular
	a la tabla contacto. */
ALTER TABLE userlogin DROP CONSTRAINT userlogin_usu_ID_fk;		-- Borrando FK en tabla userlogin:
ALTER TABLE usuario MODIFY COLUMN usu_ID MEDIUMINT NOT NULL;	-- Borrando AUTO_INCREMENT:
DESCRIBE usuario;
ALTER TABLE usuario DROP PRIMARY KEY;							-- Borrando PK en tabla user:
DESCRIBE usuario;
ALTER TABLE usuario
ADD CONSTRAINT usuario_usu_ID_usu_fone_pk PRIMARY KEY (usu_ID,usu_fone);
DESCRIBE usuario;
SELECT * FROM usuario;
ALTER TABLE usuario MODIFY COLUMN usu_ID MEDIUMINT NOT NULL AUTO_INCREMENT;	-- Borrando AUTO_INCREMENT:
DESCRIBE usuario;
ALTER TABLE usuario AUTO_INCREMENT = 9;
INSERT INTO usuario (usu_nombre, usu_apellido, usu_password, usu_genero, usu_fone)
VALUES
('Sofia','Alvarez','ihei-5841','F','+56327306947');				-- Probando AUTO_INCREMENT con nuevo registro.
SELECT * FROM usuario;
	/* Vinculando tabla contacto a tabla usuario. */
ALTER TABLE contacto ADD CONSTRAINT contacto_contacto_fone_fk FOREIGN KEY (contacto_fone)
REFERENCES usuario(usu_fone);
DESCRIBE usuario;

CREATE TABLE userlogin (
userlog_ID			MEDIUMINT	NOT NULL AUTO_INCREMENT,
usu_ID				MEDIUMINT	NOT NULL,
userlog_dateTime	DATETIME	NOT NULL DEFAULT CURRENT_TIMESTAMP,
userlog_timesTamp	TIMESTAMP	NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT userlogin_userlog_ID_pk PRIMARY KEY (userlog_ID),
CONSTRAINT userlogin_usu_ID_fk	FOREIGN KEY (usu_ID)
REFERENCES usuario(usu_ID)

-- j)	El ejercicio debe ser subido a github y al Nodo Virtual.
