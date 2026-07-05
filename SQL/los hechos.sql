------------- Carga Inicial del DW DW_TRANSPORTE_FBI - Tabla de Hechos Boleto -------------

USE DW_TRANSPORTE_FBI;
GO

INSERT INTO DW_TRANSPORTE_FBI.dbo.Boleto (
    pkCliente, pkRuta, pkTiempo, pkHorario,
    pkMantenimiento, pkBus, pkConductor, pkTerminal,
    Ingresos, CantidadViaje, CantidadPasajero, PromedioPasajero,
    VentaBoleto, Retrasos, MontoMantenimiento, Combustible,
    Incidencias, Demanda
)
SELECT dwCli.pkCliente, dwRut.pkRuta, dwTie.pkTiempo, dwHor.pkHorario,
    dwMan.pkMantenimiento, dwBus.pkBus, dwCon.pkConductor, dwTer.pkTerminal,
    SUM(bdt.Ingresos) as Ingresos,
    SUM(bdt.CantidadViaje) as CantidadViaje,
    SUM(bdt.CantidadPasajero) as CantidadPasajero,
    AVG(bdt.PromedioPasajero) as PromedioPasajero,
    COUNT(bdt.VentaBoleto) as VentaBoleto,
    SUM(bdt.Retrasos) as Retrasos,
    SUM(bdt.MontoMantenimiento) as MontoMantenimiento,
    SUM(bdt.Combustible) as Combustible,
    SUM(bdt.Incidencias) as Incidencias,
    SUM(bdt.Demanda) as Demanda
FROM oltp_DW_TRANSPORTE_FBI.dbo.Boleto bdt 
    INNER JOIN oltp_DW_TRANSPORTE_FBI.dbo.DimCliente bdtCli
        ON (bdt.pkCliente = bdtCli.pkCliente)
    INNER JOIN oltp_DW_TRANSPORTE_FBI.dbo.DimRuta bdtRut
        ON (bdt.pkRuta = bdtRut.pkRuta)
    INNER JOIN oltp_DW_TRANSPORTE_FBI.dbo.DimTiempo bdtTie
        ON (bdt.pkTiempo = bdtTie.pkTiempo)
    INNER JOIN oltp_DW_TRANSPORTE_FBI.dbo.DimHorario bdtHor
        ON (bdt.pkHorario = bdtHor.pkHorario)
    INNER JOIN oltp_DW_TRANSPORTE_FBI.dbo.DimMantenimiento bdtMan
        ON (bdt.pkMantenimiento = bdtMan.pkMantenimiento)
    INNER JOIN oltp_DW_TRANSPORTE_FBI.dbo.DimBus bdtBus
        ON (bdt.pkBus = bdtBus.pkBus)
    INNER JOIN oltp_DW_TRANSPORTE_FBI.dbo.DimConductor bdtCon
        ON (bdt.pkConductor = bdtCon.pkConductor)
    INNER JOIN oltp_DW_TRANSPORTE_FBI.dbo.DimTerminal bdtTer
        ON (bdt.pkTerminal = bdtTer.pkTerminal)
    INNER JOIN [DW_TRANSPORTE_FBI].dbo.DimCliente dwCli
        ON (bdtCli.idCliente = dwCli.idCliente)
    INNER JOIN [DW_TRANSPORTE_FBI].dbo.DimRuta dwRut
        ON (bdtRut.idRuta = dwRut.idRuta)
    INNER JOIN [DW_TRANSPORTE_FBI].dbo.DimTiempo dwTie
        ON (bdtTie.Fecha = dwTie.Fecha)
    INNER JOIN [DW_TRANSPORTE_FBI].dbo.DimHorario dwHor
        ON (bdtHor.idHorario = dwHor.idHorario)
    INNER JOIN [DW_TRANSPORTE_FBI].dbo.DimMantenimiento dwMan
        ON (bdtMan.idMantenimiento = dwMan.idMantenimiento)
    INNER JOIN [DW_TRANSPORTE_FBI].dbo.DimBus dwBus
        ON (bdtBus.idBus = dwBus.idBus)
    INNER JOIN [DW_TRANSPORTE_FBI].dbo.DimConductor dwCon
        ON (bdtCon.idConductor = dwCon.idConductor)
    INNER JOIN [DW_TRANSPORTE_FBI].dbo.DimTerminal dwTer
        ON (bdtTer.idTerminal = dwTer.idTerminal)
GROUP BY dwCli.pkCliente, dwRut.pkRuta, dwTie.pkTiempo, dwHor.pkHorario,
    dwMan.pkMantenimiento, dwBus.pkBus, dwCon.pkConductor, dwTer.pkTerminal;
GO