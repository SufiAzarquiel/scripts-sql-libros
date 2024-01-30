DROP TABLE IF EXISTS saca;
DROP TABLE IF EXISTS escribe;
DROP TABLE IF EXISTS ejemplar;
DROP TABLE IF EXISTS libro;
DROP TABLE IF EXISTS autor;
DROP TABLE IF EXISTS usuario;


CREATE TABLE libro(
    idLibro NUMBER(6) CONSTRAINT pkLibro PRIMARY KEY,
    titulo VARCHAR2(50),
    ISBN VARCHAR2(15),
    paginas NUMBER(4),
    editorial VARCHAR2(20)
);

CREATE TABLE ejemplar(
    idEjemplar NUMBER(6) CONSTRAINT pkEjemplar PRIMARY KEY,
    localizacion VARCHAR2(20),
    -- Referencia a codigo de libro. Relacion: N ejemplares de 1 libro.
    idLibro NUMBER(6) CONSTRAINT fkEjemplarLibro REFERENCES libro
);

CREATE TABLE autor(
    idAutor NUMBER(6) CONSTRAINT pkAutor PRIMARY KEY,
    nombre VARCHAR2(70)
);

CREATE TABLE usuario(
    idUsuario NUMBER(6) CONSTRAINT pkUsuario PRIMARY KEY,
    nombre VARCHAR2(70),
    telefono NUMBER(9),
    direccion VARCHAR2(70)
);

CREATE TABLE escribe(
    idAutor NUMBER(6) CONSTRAINT fkEscribeAutor REFERENCES autor,
    idLibro NUMBER(6) CONSTRAINT fkEscribeLibro REFERENCES libro,
    CONSTRAINT pkEscribe PRIMARY KEY (idAutor, idLibro)
);

CREATE TABLE saca(
    idUsuario NUMBER(6),
    idEjemplar NUMBER(6),
    CONSTRAINT pkSaca PRIMARY KEY (idUsuario, idEjemplar),
    CONSTRAINT fkSacaUsuario FOREIGN KEY (idUsuario) REFERENCES usuario,
    CONSTRAINT fkSacaEjemplar FOREIGN KEY (idEjemplar) REFERENCES ejemplar
);