/*
@description Eventos históricos en el mundo
@author Luis Carrillo Gutiérrez
@date Septiembre, 2021
@version 0.0.1b
*/

DROP TABLE IF EXISTS [Evento Histórico];
CREATE TABLE IF NOT EXISTS [Evento Histórico]
(
	[id] INTEGER UNSIGNED NOT NULL,
	[descripción] TEXT NOT NULL,
	[url] TEXT NULL,
	PRIMARY KEY (id)
) WITHOUT RowId;

-- [Suceso] -- 1 --- 1:2 -- [Datación]
DROP TABLE IF EXISTS [Datación del Evento];
CREATE TABLE IF NOT EXISTS [Datación del Evento]
(
	[id] INTEGER UNSIGNED NOT NULL,
	[id del evento] INTEGER UNSIGNED NOT NULL REFERENCES [Evento Histórico](id),
	[año] CHAR(8) NOT NULL,
	[mes] CHAR(2) NULL,
	[día] CHAR(2) NULL,
	[] BOOLEAN NOT NULL, -- { 0:empezar, 1:terminar}
	[] BOOLEAN NOT NULL -- antes/despues de 0 { 0:antes, 1:después }
	PRIMARY KEY (id)
) WITHOUT RowId;

-- [Suceso] -- 1 --- 1:1 -- [Lugar]
DROP TABLE IF EXISTS [Georreferencia del Evento];
CREATE TABLE IF NOT EXISTS [Georreferencia del Evento]
(
	[id] INTEGER UNSIGNED NOT NULL,
	[id del evento] INTEGER UNSIGNED NOT NULL REFERENCES [Evento Histórico](id),
	[continente] INTEGER UNSIGNED NOT NULL, --  { 0:Europa, 1:Asia, 2:Africa ... }
	[país] VARCHAR(128) NULL,
	[región] VARCHAR(128) NULL,
	[latitud] NUMERIC(11, 8) NULL, -- GPS 
	[longitud] NUMERIC(11, 8) NULL 
	PRIMARY KEY (id)
) WITHOUT RowId;

-- [Suceso] -- 1 --- 1:n -- [LugarActual]
DROP TABLE IF EXISTS [ Actual]
CREATE TABLE IF NOT EXISTS [Georreferencia Actual]
( 
	[id] INTEGER UNSIGNED NOT NULL,
	[id del evento] INTEGER UNSIGNED NOT NULL REFERENCES [Evento Histórico](id),
	[país] CHAR(3) NOT NULL,
	PRIMARY KEY (id)
) WITHOUT RowId;

-- [Suceso] -- 1 --- 1:n -- [Participante]
DROP TABLE IF EXISTS [Participante]
CREATE TABLE IF NOT EXISTS [Participante]
(
	[id] INTEGER UNSIGNED NOT NULL,
	[id del evento] INTEGER UNSIGNED NOT NULL REFERENCES [Evento Histórico](id),
	[denominación] VARCHAR(128) NOT NULL,
	 PRIMARY KEY (id)
) WITHOUT RowId;