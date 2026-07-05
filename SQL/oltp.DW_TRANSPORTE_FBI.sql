
CREATE DATABASE oltp_DW_TRANSPORTE_FBI;
go

USE oltp_DW_TRANSPORTE_FBI;
go


CREATE TABLE DimCliente (
    pkCliente   INT PRIMARY KEY IDENTITY(1,1),
    idCliente   INT NOT NULL,
    Categoria   VARCHAR(50)
);

CREATE TABLE DimRuta (
    pkRuta        INT PRIMARY KEY IDENTITY(1,1),
    idRuta        INT NOT NULL,
    Origen        VARCHAR(100),
    Destino       VARCHAR(100),
    PrecioPasaje  DECIMAL(10,2)
);

CREATE TABLE DimTiempo (
    pkTiempo  INT PRIMARY KEY IDENTITY(1,1),
    Fecha     DATE NOT NULL,
    Anio      INT,
    Mes       INT,
    Semana    INT,
    Dia       INT
);

CREATE TABLE DimHorario (
    pkHorario    INT PRIMARY KEY IDENTITY(1,1),
    idHorario    INT NOT NULL,
    HoraSalida   TIME,
    HoraLlegada  TIME,
    Turno        VARCHAR(50)
);

CREATE TABLE DimMantenimiento (
    pkMantenimiento   INT PRIMARY KEY IDENTITY(1,1),
    idMantenimiento   INT NOT NULL,
    Fecha             DATE,
    TipoMantenimiento VARCHAR(100)
);

CREATE TABLE DimBus (
    pkBus      INT PRIMARY KEY IDENTITY(1,1),
    idBus      INT NOT NULL,
    Placa      VARCHAR(20),
    Modelo     VARCHAR(50),
    Capacidad  INT
);

CREATE TABLE DimConductores (
    pkConductor  INT PRIMARY KEY IDENTITY(1,1),
    idConductor  INT NOT NULL,
    Nombre       VARCHAR(50),
    Apellido     VARCHAR(50),
    Licencia     VARCHAR(60),
    Incidencia   VARCHAR(100)
);

CREATE TABLE DimTerminal (
    pkTerminal  INT PRIMARY KEY IDENTITY(1,1),
    idTerminal  INT NOT NULL,
    Nombre      VARCHAR(100),
    Ciudad      VARCHAR(100)
);

-- =========================================
-- TABLA DE HECHOS
-- =========================================

CREATE TABLE Boleto (
    pkCliente         INT,
    pkRuta            INT,
    pkTiempo          INT,
    pkHorario         INT,
    pkMantenimiento   INT,
    pkBus             INT,
    pkConductor       INT,
    pkTerminal        INT,
    Ingresos          DECIMAL(10,2),
    CantidadViaje     INT,
    CantidadPasajero  INT,
    PromedioPasajero  DECIMAL(10,2),
    VentaBoleto       DECIMAL(10,2),
    Retrasos          INT,
    MontoMantenimiento DECIMAL(10,2),
    Combustible       DECIMAL(10,2),
    Incidencias       INT,
    Demanda           DECIMAL(10,2),

    FOREIGN KEY (pkCliente) REFERENCES DimCliente(pkCliente),
    FOREIGN KEY (pkRuta) REFERENCES DimRuta(pkRuta),
    FOREIGN KEY (pkTiempo) REFERENCES DimTiempo(pkTiempo),
    FOREIGN KEY (pkHorario) REFERENCES DimHorario(pkHorario),
    FOREIGN KEY (pkMantenimiento) REFERENCES DimMantenimiento(pkMantenimiento),
    FOREIGN KEY (pkBus) REFERENCES DimBus(pkBus),
    FOREIGN KEY (pkConductor) REFERENCES DimConductor(pkConductor),
    FOREIGN KEY (pkTerminal) REFERENCES DimTerminal(pkTerminal)
);
GO