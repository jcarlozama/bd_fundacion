USE db_fundacion;
GO

SELECT*FROM donacion;

--- Dim Tiempo

SELECT
DISTINCT fec_donacion,
	DAY(fec_donacion) AS 'dia',
	MONTH(fec_donacion) AS 'mes',
	DATEPART(QUARTER,fec_donacion) as 'trimestre',
	YEAR(fec_donacion) AS 'anio'
FROM donacion;


--- Dim Ubicacion
SELECT*FROM donante;

SELECT
DISTINCT ciudad, pais
FROM donante;

USE dw_fundacion;

SELECT * FROM factdonacion;
SELECT * FROM dim_donante;
SELECT * FROM dim_mpago;
SELECT * FROM dim_campania;
SELECT * FROM dim_tiempo;
SELECT * FROM dim_ubicacion;

DELETE FROM factdonacion;
DBCC CHECKIDENT('factdonacion', RESEED, 1);
DELETE FROM dim_donante;
DBCC CHECKIDENT('dim_donante', RESEED, 1);
DELETE FROM dim_mpago;
DBCC CHECKIDENT('dim_mpago', RESEED, 1);
DELETE FROM dim_campania;
DBCC CHECKIDENT('dim_campania', RESEED, 1);
DELETE FROM dim_tiempo;
DBCC CHECKIDENT('dim_tiempo', RESEED, 1);
DELETE FROM dim_ubicacion;
DBCC CHECKIDENT('dim_ubicacion', RESEED, 1);