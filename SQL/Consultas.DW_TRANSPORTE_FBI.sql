

-- Dimensión Cliente
SELECT c.idCliente AS idCliente, c.Categoria AS Categoria
FROM oltp_DW_TRANSPORTE_FBI.dbo.DimCliente c;


-- Dimensión Ruta
SELECT r.idRuta AS idRuta, r.Origen AS Origen, r.Destino AS Destino, r.PrecioPasaje AS PrecioPasaje
FROM oltp_DW_TRANSPORTE_FBI.dbo.DimRuta r;

-- Dimensión Bus
SELECT b.idBus AS idBus, b.Placa AS Placa, b.Modelo AS Modelo, b.Capacidad AS Capacidad
FROM oltp_DW_TRANSPORTE_FBI.dbo.DimBus b;

-- Dimensión Conductor
SELECT c.idConductor AS idConductor, c.Nombre AS Nombre, c.Apellido AS Apellido, c.Licencia AS Licencia, c.Incidencia AS Incidencia
FROM oltp_DW_TRANSPORTE_FBI.dbo.DimConductor c;

-- Dimensión Horario
SELECT h.idHorario AS idHorario, h.HoraSalida AS HoraSalida, h.HoraLlegada AS HoraLlegada, h.Turno AS Turno
FROM oltp_DW_TRANSPORTE_FBI.dbo.DimHorario h;

-- Dimensión Terminal
SELECT t.idTerminal AS idTerminal, t.Nombre AS Nombre, t.Ciudad AS Ciudad
FROM oltp_DW_TRANSPORTE_FBI.dbo.DimTerminal t;

-- Dimensión Mantenimiento
SELECT m.idMantenimiento AS idMantenimiento, m.Fecha AS Fecha, m.TipoMantenimiento AS TipoMantenimiento
FROM oltp_DW_TRANSPORTE_FBI.dbo.DimMantenimiento m;

-- Dimensión Tiempo

SELECT t.Fecha AS Fecha,
       DATEPART(YEAR, t.Fecha) AS Anio,
       DATEPART(MONTH, t.Fecha) AS Mes,
       DATEPART(WEEK, t.Fecha) AS Semana, 
       DATEPART(DAY, t.Fecha) AS Dia
FROM oltp_DW_TRANSPORTE_FBI.dbo.DimTiempo t;


select * from dbo.DimCliente;

select * from dbo.DimRuta;

INSERT INTO DW_TRANSPORTE_FBI.dbo.DimCliente (idCliente, Categoria) 
VALUES (100, 'Frecuente');

DELETE FROM dbo.DimCliente;
DBCC CHECKIDENT ('dbo.DimCliente', RESEED, 0);

DELETE FROM dbo.DimRuta;
DBCC CHECKIDENT ('dbo.DimRuta', RESEED, 0);

DELETE FROM dbo.DimBus;
DBCC CHECKIDENT ('dbo.DimBus', RESEED, 0);

DELETE FROM dbo.DimConductor;
DBCC CHECKIDENT ('dbo.DimConductor', RESEED, 0);

DELETE FROM dbo.DimHorario;
DBCC CHECKIDENT ('dbo.DimHorario', RESEED, 0);

DELETE FROM dbo.DimTerminal;
DBCC CHECKIDENT ('dbo.DimTerminal', RESEED, 0);

DELETE FROM dbo.DimMantenimiento;
DBCC CHECKIDENT ('dbo.DimMantenimiento', RESEED, 0);

DELETE FROM dbo.DimTiempo;
DBCC CHECKIDENT ('dbo.DimTiempo', RESEED, 0);