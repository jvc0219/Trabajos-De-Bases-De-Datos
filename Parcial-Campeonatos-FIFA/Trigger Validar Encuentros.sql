CREATE TRIGGER trg_validar_encuentro
ON Encuentro
INSTEAD OF INSERT
AS
BEGIN
    -- Verificar si ya existe el partido 
    IF EXISTS (
        SELECT 1
        FROM Encuentro e
        JOIN inserted i ON 
            e.IdCampeonato = i.IdCampeonato
            AND e.IdFase = i.IdFase
            AND (
                (e.IdPais1 = i.IdPais1 AND e.IdPais2 = i.IdPais2)
                OR
                (e.IdPais1 = i.IdPais2 AND e.IdPais2 = i.IdPais1)
            )
    )
    BEGIN
        RAISERROR('Ya existe este partido en este campeonato y fase.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Si el partido no esta duplicado se inserta normal
    INSERT INTO Encuentro(IdPais1, IdPais2, IdEstadio, IdFase, IdCampeonato, Fecha, Goles1, Goles2)
    SELECT IdPais1, IdPais2, IdEstadio, IdFase, IdCampeonato, Fecha, Goles1, Goles2
    FROM inserted;
END;
GO