USE db_fundacion;
GO


-- Inserci�n de datos
-- TABLAS INDEPENDIENTES
INSERT INTO donante (id_donante, nombre, genero, fec_nac, correo, telefono, ciudad, pais, profesion, nivel_educativo, preferencia_contacto)
VALUES
(1, 'Ana G�mez', 'F', '1985-04-10', 'ana.gomez@mail.com', '555-1234', 'Madrid', 'Espa�a', 'Ingeniera', 'Universitario', 'Email'),
(2, 'Carlos P�rez', 'M', '1990-08-22', 'carlos.perez@mail.com', '555-5678', 'Barcelona', 'Espa�a', 'Abogado', 'Universitario', 'Tel�fono'),
(3, 'Luc�a Torres', 'F', '1978-01-15', 'lucia.torres@mail.com', '555-8765', 'Valencia', 'Espa�a', 'M�dica', 'Postgrado', 'Email'),
(4, 'Miguel S�nchez', 'M', '1982-05-05', 'miguel.sanchez@mail.com', '555-4321', 'Sevilla', 'Espa�a', 'Profesor', 'Universitario', 'Email'),
(5, 'Sof�a Mart�nez', 'F', '1995-09-12', 'sofia.martinez@mail.com', '555-9876', 'Bilbao', 'Espa�a', 'Dise�adora', 'Secundario', 'WhatsApp');

INSERT INTO campania (id_camp, nombre, descripcion, tipo_camp, fecha_ini, fecha_fin)
VALUES
(1, 'Campa�a Escolar 2025', 'Recaudaci�n para �tiles escolares', 'Educaci�n', '2025-01-01', '2025-03-31'),
(2, 'Ayuda a Refugiados', 'Fondos para asistencia humanitaria', 'Humanitaria', '2025-02-01', '2025-04-30'),
(3, 'Salvemos el Bosque', 'Reforestaci�n y conservaci�n', 'Medio Ambiente', '2025-03-15', '2025-06-15'),
(4, 'Navidad Solidaria', 'Entrega de regalos a ni�os', 'Social', '2025-11-01', '2025-12-31'),
(5, 'Salud para Todos', 'Campa�a de vacunaci�n gratuita', 'Salud', '2025-05-01', '2025-07-31');

INSERT INTO canal (id_canal, nombre)
VALUES
(1, 'Presencial'),
(2, 'P�gina Web'),
(3, 'Tel�fono'),
(4, 'Correo Postal'),
(5, 'Aplicaci�n M�vil');

INSERT INTO metodo_pago (id_mpago, nombre)
VALUES
(1, 'Tarjeta de Cr�dito'),
(2, 'Transferencia Bancaria'),
(3, 'PayPal'),
(4, 'Efectivo'),
(5, 'Cheque');

INSERT INTO evento (id_even, nombre, tipo_even, fecha_evento, lugar, asistentes_estimados)
VALUES
(1, 'Cena Ben�fica', 'Recaudaci�n', '2025-03-20', 'Hotel Madrid Center', 200),
(2, 'Concierto Solidario', 'Entretenimiento', '2025-04-15', 'Auditorio Nacional', 500),
(3, 'Subasta de Arte', 'Cultural', '2025-05-10', 'Museo de Arte Moderno', 150),
(4, 'Marat�n por la Salud', 'Deportivo', '2025-06-05', 'Parque Central', 300),
(5, 'Feria Solidaria', 'Comunitario', '2025-07-25', 'Plaza Mayor', 400);

-- TABLAS TRANSACCIONALES
INSERT INTO donacion (id_donacion, fec_donacion, monto, id_donante, id_camp, id_mpago, id_canal)
VALUES
(1, '2025-01-05', 50.00, 1, 1, 1, 2),
(2, '2025-01-10', 75.50, 2, 1, 2, 1),
(3, '2025-02-14', 120.00, 3, 2, 3, 5),
(4, '2025-02-20', 200.00, 4, 2, 1, 2),
(5, '2025-03-02', 35.00, 5, 3, 4, 1),
(6, '2025-03-15', 90.00, 1, 3, 2, 3),
(7, '2025-03-25', 150.00, 2, 1, 3, 4),
(8, '2025-04-01', 60.00, 3, 2, 5, 5),
(9, '2025-04-05', 80.00, 4, 3, 1, 2),
(10, '2025-04-10', 100.00, 5, 4, 2, 1),
(11, '2025-04-15', 45.00, 1, 5, 4, 5),
(12, '2025-04-20', 300.00, 2, 5, 1, 2),
(13, '2025-05-01', 110.00, 3, 4, 3, 4),
(14, '2025-05-05', 55.00, 4, 3, 5, 1),
(15, '2025-05-10', 90.00, 5, 2, 2, 3),
(16, '2025-05-15', 200.00, 1, 1, 1, 2),
(17, '2025-05-20', 75.00, 2, 4, 4, 5),
(18, '2025-05-25', 125.00, 3, 5, 3, 1),
(19, '2025-06-01', 95.00, 4, 3, 2, 4),
(20, '2025-06-05', 85.00, 5, 1, 5, 3);

INSERT INTO participacion (id_donante, id_even, asistio)
VALUES
(1, 1, 1),
(1, 2, 1),
(2, 1, 0),
(2, 3, 1),
(3, 2, 1),
(3, 4, 1),
(4, 1, 1),
(4, 5, 0),
(5, 3, 1),
(5, 4, 1),
(1, 5, 1),
(2, 2, 0),
(3, 1, 1),
(4, 3, 1),
(5, 2, 1),
(2, 4, 1),
(3, 5, 0),
(1, 4, 1),
(4, 2, 1),
(5, 1, 0);

EXEC SP_HELP donacion;

alter table donacion
DROP constraint FK__donacion__id_can__4222D4EF;

ALTER TABLE donacion
DROP COLUMN id_canal;

-- Drop table canal
DROP TABLE canal;

-- Drop table participacion
DROP TABLE participacion;

-- Drop table evento
DROP TABLE evento;

select * from donacion