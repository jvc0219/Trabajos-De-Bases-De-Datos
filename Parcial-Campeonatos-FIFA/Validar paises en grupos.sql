CREATE TRIGGER tActualizarGrupoPais
ON GrupoPais
FOR INSERT, UPDATE
AS
BEGIN
 SET NOCOUNT ON;
 -- Verificar si alg�n pa�s de la inserci�n/actualizaci�n
 -- ya est� en otro grupo del mismo campeonato
 IF EXISTS(
 SELECT 1
 FROM Inserted I
 JOIN Grupo GNuevo ON GNuevo.Id = I.IdGrupo
 JOIN GrupoPais GP ON GP.IdPais = I.IdPais
 JOIN Grupo GExistente ON GExistente.Id = GP.IdGrupo
 WHERE GNuevo.IdCampeonato = GExistente.IdCampeonato
 AND GNuevo.Id <> GExistente.Id
 )
 BEGIN
 -- Cancelar la instrucci�n y lanzar error
 RAISERROR('Un pa�s no puede pertenecer a m�s de un grupo
en el mismo campeonato.', 16, 1);
 ROLLBACK TRANSACTION;
 RETURN;
 END
END
GO