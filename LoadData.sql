CREATE DATABASE inegi_mario;
USE inegi_mario;

CREATE TABLE entidades(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE asentamientos(
    id INT NOT NULL AUTO_INCREMENT,
    tipo_asentamiento VARCHAR(80) NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE centros_comerciales(
    id INT NOT NULL AUTO_INCREMENT,
    tipo_centro VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE vialidades(
    id INT NOT NULL AUTO_INCREMENT,
    tipo_vialidad VARCHAR(25) NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE municipios(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE unidad_economica(
    id INT NOT NULL AUTO_INCREMENT,
    tipo_unidad VARCHAR(15) NOT NULL,
    PRIMARY KEY(id)
);


CREATE TABLE direcciones(
    id INT NOT NULL UNIQUE AUTO_INCREMENT,
    tipo_vialidad INT NOT NULL DEFAULT 0,
    nombre_vialidad VARCHAR(150) NOT NULL DEFAULT 'not_in_file',
    tipo_vialidad_entre_1 INT DEFAULT 0,
    nombre_vialidad_entre_1 VARCHAR(150) DEFAULT 'not_in_file',
    tipo_vialidad_entre_2 INT DEFAULT 0,
    nombre_vialidad_entre_2 VARCHAR(150) DEFAULT 'not_in_file',
    tipo_vialidad_entre_3 INT DEFAULT 0,
    nombre_vialidad_entre_3 VARCHAR(150) DEFAULT 'not_in_file',
    numero_exterior INT NOT NULL DEFAULT 0,
    letra_exterior VARCHAR(35) DEFAULT 'not_in_file',
    edificio VARCHAR(140) DEFAULT 'not_in_file',
    edificio_piso VARCHAR(30) DEFAULT 'not_in_file',
    numero_interior VARCHAR(30) DEFAULT 0,
    letra_interior VARCHAR(100) DEFAULT 'not_in_file',
    tipo_asentamiento INT DEFAULT 0,
    nombre_asentamiento VARCHAR(100) DEFAULT 'not_in_file',
    tipo_centro_comercial INT DEFAULT 0,
    nombre_centro_comercial VARCHAR(200) DEFAULT 'not_in_file',
    numero_de_local VARCHAR(25) DEFAULT 'not_in_file',
    codigo_postal INT DEFAULT 0,
    entidad INT DEFAULT 0,
    municipio INT DEFAULT 0,
    localidad VARCHAR(90) DEFAULT 'not_in_file',
    numero_manzana INT DEFAULT 0,

    PRIMARY KEY(id),
    FOREIGN KEY (tipo_vialidad) REFERENCES vialidades(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (tipo_vialidad_entre_1) REFERENCES vialidades(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (tipo_vialidad_entre_2) REFERENCES vialidades(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (tipo_vialidad_entre_3) REFERENCES vialidades(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (tipo_asentamiento) REFERENCES asentamientos(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (tipo_centro_comercial) REFERENCES centros_comerciales(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (entidad) REFERENCES entidades(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (municipio) REFERENCES municipios(id) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE establecimientos(
    id BIGINT NOT NULL UNIQUE AUTO_INCREMENT,
    nombre_establecimiento VARCHAR(170) NOT NULL,
    razon_social  VARCHAR(185) NOT NULL,
    nombre_actual VARCHAR(150) DEFAULT '',
    personas_ocupadas VARCHAR(25),
    direccion INT NOT NULL,
    telefono BIGINT,
    correo_electronico VARCHAR(99),
    pagina_web VARCHAR(99),
    tipo_unidad_economica INT,
    latitud FLOAT(10),
    longitud FLOAT(10),
    fecha_alta VARCHAR(20),

    PRIMARY KEY(id),
    FOREIGN KEY (direccion) REFERENCES direcciones(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (tipo_unidad_economica) REFERENCES unidad_economica(id) ON DELETE CASCADE ON UPDATE CASCADE
    
);

-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/entidades.csv' replace INTO TABLE entidades FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/asentamientos.csv' replace INTO TABLE asentamientos FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/centros_comerciales.csv' replace INTO TABLE centros_comerciales FIELDS TERMINATED BY '+' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/vialidades.csv' replace INTO TABLE vialidades FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/municipios.csv' replace INTO TABLE municipios FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/unidad_economica.csv' replace INTO TABLE unidad_economica FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/direcciones.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES BY '@' '\n' IGNORE 1 LINES;
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+1+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+2+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+3+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+4+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+5+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+6+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+7+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+8+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+9+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+10+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+11+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+12+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+13+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+14+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+15+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+16+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+17+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+18+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+19+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+20+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+21+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+22+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+23+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+24+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-direccionesCompleta/direccionesCompleta+25+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);

-- -- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/establecimientos.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '+' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+1+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+2+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+3+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+4+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+5+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+6+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+7+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+8+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+9+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+10+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+11+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+12+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+13+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+14+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+15+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+16+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+17+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+18+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+19+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+20+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+21+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+22+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+23+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+24+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT SLEEP(18);
-- LOAD DATA LOCAL INFILE '/home/mario/DirectorioPrueba/CSVsParaImportar/salidas-establecimientosCompleta/establecimientosCompleta+25+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;

-- -- Separador para cambio de maquina
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/entidades.csv' replace INTO TABLE entidades FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/asentamientos.csv' replace INTO TABLE asentamientos FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/centros_comerciales.csv' replace INTO TABLE centros_comerciales FIELDS TERMINATED BY '+' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/vialidades.csv' replace INTO TABLE vialidades FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/municipios.csv' replace INTO TABLE municipios FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/unidad_economica.csv' replace INTO TABLE unidad_economica FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

-- -- LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/direcciones.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES BY '@' '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+1+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+2+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+3+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+4+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+5+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+6+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+7+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+8+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+9+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+10+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+11+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+12+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+13+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+14+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+15+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+16+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+17+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+18+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+19+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+20+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+21+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+22+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+23+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+24+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-direccionesCompleta/direccionesCompleta+25+.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);

-- LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/establecimientos.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '+' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+1+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+2+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+3+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+4+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+5+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+6+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+7+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+8+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+9+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+10+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+11+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+12+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+13+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+14+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+15+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+16+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+17+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+18+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+19+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+20+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+21+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+22+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+23+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+24+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
SELECT SLEEP(18);
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/salidas-establecimientosCompleta/establecimientosCompleta+25+.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
