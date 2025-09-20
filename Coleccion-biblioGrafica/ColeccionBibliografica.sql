CREATE DATABASE ColeccionBibliografica
GO

--Ir a la base de datos
USE ColeccionBibliografica

--Crear tabla Editorial
CREATE TABLE Editorial (
    Id_editorial INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    Ubicacion VARCHAR(50)
)

-- Índices
CREATE INDEX idx_editorial_nombre ON Editorial(nombre)

CREATE TABLE TipoPublicacion (
    id_tipo INT PRIMARY KEY,
    nombre_tipo VARCHAR(50) NOT NULL
)

CREATE TABLE Publicacion (
    id_publicacion INT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    año_publicacion INT,
    id_editorial INT,
    id_tipo INT,
    FOREIGN KEY (id_editorial) REFERENCES Editorial(id_editorial),
    FOREIGN KEY (id_tipo) REFERENCES TipoPublicacion(id_tipo)
)

CREATE INDEX idx_publicacion_titulo ON Publicacion(titulo)
CREATE INDEX idx_publicacion_anio ON Publicacion(año_publicacion)

CREATE TABLE Revista (
    id_publicacion INT PRIMARY KEY,
    issn VARCHAR(20),
    volumen INT,
    numero INT,
    FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion)
)

CREATE TABLE Libro (
    id_publicacion INT PRIMARY KEY,
    isbn VARCHAR(20),
    edicion VARCHAR(20),
    FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion)
)

CREATE TABLE Autor (
    id_autor INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    tipo_autor VARCHAR(20) -- Ej: Principal, Secundario, Colaborador
)

-- Índices
CREATE INDEX idx_autor_nombre ON Autor(nombre)
CREATE INDEX idx_autor_apellido ON Autor(apellido)

CREATE TABLE Autor_Publicacion (
    id_autor INT,
    id_publicacion INT,
    PRIMARY KEY (id_autor, id_publicacion),
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor),
    FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion)
)

CREATE TABLE Descriptor (
    id_descriptor INT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
)

CREATE TABLE Descriptor_Publicacion (
    id_descriptor INT,
    id_publicacion INT,
    PRIMARY KEY (id_descriptor, id_publicacion),
    FOREIGN KEY (id_descriptor) REFERENCES Descriptor(id_descriptor),
    FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id_publicacion)
)



