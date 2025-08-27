-- Insert tabla donante

INSERT INTO donante (id_donante,nombre, genero, fec_nac, correo, telefono, ciudad, pais, profesion, nivel_educativo, preferencia_contacto) VALUES
(6,'Ana Torres', 'F', '1985-03-12', 'ana.torres@email.com', '0991234567', 'Quito', 'Ecuador', 'Ingeniera', 'Universitario', 'Email'),
(7,'Carlos Pérez', 'M', '1990-06-22', 'carlos.perez@email.com', '0987654321', 'Guayaquil', 'Ecuador', 'Médico', 'Postgrado', 'Teléfono'),
(8,'María López', 'F', '1978-11-05', 'maria.lopez@email.com', '0971112233', 'Cuenca', 'Ecuador', 'Abogada', 'Universitario', 'WhatsApp'),
(9,'Jorge Andrade', 'M', '1982-01-18', 'jorge.andrade@email.com', '0964445566', 'Ambato', 'Ecuador', 'Profesor', 'Universitario', 'Email'),
(10,'Lucía Castillo', 'F', '1995-09-09', 'lucia.castillo@email.com', '0958889990', 'Loja', 'Ecuador', 'Diseñadora', 'Secundario', 'WhatsApp');

-- Insert tabla campania
INSERT INTO campania (id_camp, nombre, descripcion, tipo_camp, fecha_ini, fecha_fin) VALUES
(6, 'Educación para Todos', 'Campaña para becas escolares', 'Educación', '2025-01-01', '2025-06-30'),
(7, 'Salud Solidaria', 'Recaudación para brigadas médicas', 'Salud', '2025-02-15', '2025-08-15'),
(8, 'Manos Verdes', 'Campaña de reforestación', 'Medio Ambiente', '2025-03-01', '2025-07-31'),
(9, 'Alimentos por Esperanza', 'Recolección de víveres para familias vulnerables', 'Alimentación', '2025-04-01', '2025-09-30'),
(10, 'Refugio Seguro', 'Apoyo a personas en situación de calle', 'Social', '2025-05-01', '2025-12-31');


--Insert tabla donancion
INSERT INTO donacion (id_donacion, fec_donacion, monto, id_donante, id_camp, id_mPago) VALUES
(21, '2025-01-15', 50.00, 1, 1, 2),
(22, '2025-01-20', 75.00, 2, 1, 1),
(23, '2025-02-05', 100.00, 3, 2, 3),
(24, '2025-02-18', 30.00, 4, 2, 4),
(25, '2025-02-25', 150.00, 5, 2, 2),
(26, '2025-03-02', 60.00, 1, 3, 1),
(27, '2025-03-10', 80.00, 2, 3, 5),
(28, '2025-03-15', 40.00, 3, 3, 4),
(29, '2025-03-22', 200.00, 4, 3, 2),
(30, '2025-03-28', 90.00, 5, 3, 3),
(31, '2025-04-05', 25.00, 1, 4, 1),
(32, '2025-04-12', 120.00, 2, 4, 2),
(33, '2025-04-18', 55.00, 3, 4, 4),
(34, '2025-04-22', 75.00, 4, 4, 3),
(35, '2025-04-30', 180.00, 5, 4, 2),
(36, '2025-05-06', 95.00, 1, 5, 5),
(37, '2025-05-14', 60.00, 2, 5, 2),
(38, '2025-05-20', 130.00, 3, 5, 1),
(39, '2025-05-27', 45.00, 4, 5, 4),
(40, '2025-06-01', 110.00, 5, 5, 3);


-- Donantes frecuentes
SELECT 
    d.id_donante,
    d.nombre,
    COUNT(do.id_donacion) AS total_donaciones
FROM donante d
JOIN donacion do ON d.id_donante = do.id_donante
GROUP BY d.id_donante, d.nombre
ORDER BY total_donaciones DESC;


-- Campañas con mas ingresos
SELECT 
    c.id_camp,
    c.nombre AS campania,
    SUM(do.monto) AS total_recaudado
FROM campania c
JOIN donacion do ON c.id_camp = do.id_camp
GROUP BY c.id_camp, c.nombre
ORDER BY total_recaudado DESC;

-- perfil demográfico de los donantes de alto valor
WITH total_por_donante AS (
    SELECT 
        d.id_donante,
        d.nombre,
        d.genero,
        d.ciudad,
        d.pais,
        d.profesion,
        d.nivel_educativo,
        SUM(do.monto) AS total_donado
    FROM donante d
    JOIN donacion do ON d.id_donante = do.id_donante
    GROUP BY d.id_donante, d.nombre, d.genero, d.ciudad, d.pais, d.profesion, d.nivel_educativo
),
promedio AS (
    SELECT AVG(total_donado) AS promedio_general
    FROM total_por_donante
)
SELECT 
    t.id_donante,
    t.nombre,
    t.genero,
    t.ciudad,
    t.pais,
    t.profesion,
    t.nivel_educativo,
    t.total_donado
FROM total_por_donante t, promedio p
WHERE t.total_donado > p.promedio_general
ORDER BY t.total_donado DESC;


-- Donacion por rango de edad
--SELECT DATEDIFF(year, fec_nac, GETDATE()) as edad from donante

WITH DonantesEdad AS (
    SELECT 
        d.id_donante,
        CASE 
            WHEN DATEDIFF(YEAR, d.fec_nac, GETDATE()) < 30 THEN 'Jóvenes (<30)'
            WHEN DATEDIFF(YEAR, d.fec_nac, GETDATE()) BETWEEN 30 AND 50 THEN 'Adultos (30-50)'
            ELSE 'Mayores (>50)'
        END AS rango_edad,
        do.monto
    FROM donante d
    JOIN donacion do ON d.id_donante = do.id_donante
)
SELECT 
    rango_edad,
    COUNT(DISTINCT id_donante) AS total_donantes,
    SUM(monto) AS total_donado
FROM DonantesEdad
GROUP BY rango_edad
ORDER BY total_donado DESC;



-- Comparación de genero
SELECT 
    d.genero,
    COUNT(DISTINCT d.id_donante) AS total_donantes,
    SUM(do.monto) AS total_donado,
    AVG(do.monto) AS promedio_donacion
FROM donante d
JOIN donacion do ON d.id_donante = do.id_donante
GROUP BY d.genero
ORDER BY total_donado DESC;


-- Distibución por país

SELECT 
    d.pais,
    COUNT(DISTINCT d.id_donante) AS total_donantes,
    SUM(do.monto) AS total_donado
FROM donante d
JOIN donacion do ON d.id_donante = do.id_donante
GROUP BY d.pais
ORDER BY total_donado DESC;


-- Profesiones con mayor aporte
SELECT 
    d.profesion,
    COUNT(DISTINCT d.id_donante) AS total_donantes,
    SUM(do.monto) AS total_donado,
    AVG(do.monto) AS promedio_donacion
FROM donante d
JOIN donacion do ON d.id_donante = do.id_donante
GROUP BY d.profesion
ORDER BY total_donado DESC;

-- Donantes recurrentes vs ocasionales
SELECT 
    CASE 
        WHEN COUNT(do.id_donacion) > 3 THEN 'Recurrentes'
        ELSE 'Ocasionales'
    END AS tipo_donante,
    COUNT(DISTINCT d.id_donante) AS total_donantes,
    SUM(do.monto) AS total_donado
FROM donante d
JOIN donacion do ON d.id_donante = do.id_donante;
--GROUP BY tipo_donante;
