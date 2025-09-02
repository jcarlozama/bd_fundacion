CREATE DATABASE dw_fundacion;
GO
USE dw_fundacion; 

CREATE TABLE dim_donante (
    id_donante INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100),
    apellido NVARCHAR(100),
    genero NVARCHAR(10),
    fec_nac DATE
);

CREATE TABLE dim_campania (
    id_campana INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100),
    objetivo NVARCHAR(255),
    fecha_inicio DATE,
    fecha_fin DATE
);

CREATE TABLE dim_mpago (
    id_mpago INT IDENTITY(1,1) PRIMARY KEY,
    descripcion NVARCHAR(50)
);

CREATE TABLE dim_ubicacion (
    id_ubicacion INT IDENTITY(1,1) PRIMARY KEY,
    ciudad NVARCHAR(100),
    pais NVARCHAR(100)
);

CREATE TABLE dim_tiempo (
    id_tiempo INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE,
    dia INT,
    mes INT,
    trimestre INT,
    anio INT
);

CREATE TABLE factdonacion (
    id_donacion INT IDENTITY(1,1) PRIMARY KEY,
    id_donante INT,
    id_campana INT,
    id_mpago INT,
    id_ubicacion INT,
    id_tiempo INT,
    monto DECIMAL(10,2),

    FOREIGN KEY (id_donante) REFERENCES dim_donante(id_donante),
    FOREIGN KEY (id_campana) REFERENCES dim_campania(id_campana),
    FOREIGN KEY (id_mpago) REFERENCES dim_mpago(id_mpago),
    FOREIGN KEY (id_ubicacion) REFERENCES dim_ubicacion(id_ubicacion),
    FOREIGN KEY (id_tiempo) REFERENCES dim_tiempo(id_tiempo)
);