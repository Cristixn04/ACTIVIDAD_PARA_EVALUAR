-- Tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    telefono INT,
    fecha_registro DATETIME
);

-- Tabla Libros
CREATE TABLE Libros (
    id_libro VARCHAR(50) PRIMARY KEY,
    titulo VARCHAR(150),
    genero VARCHAR(100),
    anio DATE,
    ISBN INT
);

-- Tabla Categoria
CREATE TABLE Categoria (
    id_categoria VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla intermedia Libros-Categorias (N:M)
CREATE TABLE Libros_Categorias (
    id_categoria VARCHAR(50),
    id_libro VARCHAR(50),
    PRIMARY KEY (id_categoria, id_libro),
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro)
);

-- Tabla Prestamos
CREATE TABLE Prestamos (
    id_prestamo VARCHAR(50) PRIMARY KEY,
    fecha_inicio DATETIME,
    fecha_devolucion DATETIME,
    id_usuario VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- Tabla Copias
CREATE TABLE Copias (
    id_copia VARCHAR(50) PRIMARY KEY,
    estado VARCHAR(50),
    ubicacion VARCHAR(100),
    id_libro VARCHAR(50),
    id_prestamo VARCHAR(50),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro),
    FOREIGN KEY (id_prestamo) REFERENCES Prestamos(id_prestamo)
);

-- Tabla Reseñas
CREATE TABLE Resenas (
    id_resena VARCHAR(50) PRIMARY KEY,
    calificacion INT,
    comentario VARCHAR(255),
    fecha DATETIME,
    id_usuario VARCHAR(50),
    id_libro VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro)
);

-- Usuarios
INSERT INTO Usuarios VALUES 
('U1', 'Juan Perez', 'juan@gmail.com', 123456789, '2024-01-10'),
('U2', 'Maria Lopez', 'maria@gmail.com', 987654321, '2024-02-15');

-- Libros
INSERT INTO Libros VALUES 
('L1', 'Cien Años de Soledad', 'Realismo Magico', '1967-01-01', 123456),
('L2', '1984', 'Distopia', '1949-01-01', 654321);

-- Categoria
INSERT INTO Categoria VALUES 
('C1', 'Novela'),
('C2', 'Ciencia Ficcion');

-- Libros_Categorias
INSERT INTO Libros_Categorias VALUES 
('C1', 'L1'),
('C2', 'L2');

-- Prestamos
INSERT INTO Prestamos VALUES 
('P1', '2024-03-01', '2024-03-10', 'U1'),
('P2', '2024-03-05', '2024-03-15', 'U2');

-- Copias
INSERT INTO Copias VALUES 
('CP1', 'Disponible', 'Estante A1', 'L1', 'P1'),
('CP2', 'Prestado', 'Estante B2', 'L2', 'P2');

-- Resenas
INSERT INTO Resenas VALUES 
('R1', 5, 'Excelente libro', '2024-03-02', 'U1', 'L1'),
('R2', 4, 'Muy interesante', '2024-03-06', 'U2', 'L2');
