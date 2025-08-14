-- Creación de base de datos

CREATE DATABASE db_fundacion;

-- Tabla Donante

CREATE TABLE donante (
    id_donante INT PRIMARY KEY,
    nombre VARCHAR(100),
    genero CHAR(1),
    fec_nac DATE,
    correo VARCHAR(100),
    telefono VARCHAR(20),
    ciudad VARCHAR(50),
    pais VARCHAR(50),
    profesion VARCHAR(50),
    nivel_educativo VARCHAR(50),
    preferencia_contacto VARCHAR(30)
);

-- Tabla Campania

CREATE TABLE campania (
    id_camp INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    tipo_camp VARCHAR(50),
    fecha_ini DATE,
    fecha_fin DATE
);

-- Tabla canal

CREATE TABLE canal (
    id_canal INT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- Tabla metodo_pago

CREATE TABLE metodo_pago (
    id_mpago INT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- Tabla donacion

CREATE TABLE donacion (
    id_donacion INT PRIMARY KEY,
    fec_donacion DATE,
    monto DECIMAL(10,2),
    id_donante INT,
    id_camp INT,
    id_mpago INT,
    id_canal INT,
    FOREIGN KEY (id_donante) REFERENCES donante(id_donante),
    FOREIGN KEY (id_camp) REFERENCES campania(id_camp),
    FOREIGN KEY (id_mpago) REFERENCES metodo_pago(id_mpago),
    FOREIGN KEY (id_canal) REFERENCES canal(id_canal)
);

-- Tabla evento

CREATE TABLE evento (
    id_even INT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo_even VARCHAR(50),
    fecha_evento DATE,
    lugar VARCHAR(100),
    asistentes_estimados INT
);

-- Tabla participacion

CREATE TABLE participacion (
    id_donante INT,
    id_even INT,
    asistio BIT,
    PRIMARY KEY (id_donante, id_even),
    FOREIGN KEY (id_donante) REFERENCES Donante(id_donante),
    FOREIGN KEY (id_even) REFERENCES Evento(id_even)
);