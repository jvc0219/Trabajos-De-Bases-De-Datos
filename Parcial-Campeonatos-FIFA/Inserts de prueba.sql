-- Inserci�n v�lida
INSERT INTO Encuentro(IdPais1, IdPais2, IdEstadio, IdFase, IdCampeonato, Fecha, Goles1, Goles2)
VALUES (1, 2, 1, 1, 1, '2025-09-24', NULL, NULL);



-- Inserci�n duplicada (mismos pa�ses)
INSERT INTO Encuentro(IdPais1, IdPais2, IdEstadio, IdFase, IdCampeonato, Fecha, Goles1, Goles2)
VALUES (1, 2, 2, 1, 1, '2025-09-25', NULL, NULL);



-- Inserci�n duplicada (mismos pa�ses y con el orden invertido)
INSERT INTO Encuentro(IdPais1, IdPais2, IdEstadio, IdFase, IdCampeonato, Fecha, Goles1, Goles2)
VALUES (2, 1, 3, 1, 1, '2025-09-26', NULL, NULL);


-- Inserci�n en otra fase (v�lido)
INSERT INTO Encuentro(IdPais1, IdPais2, IdEstadio, IdFase, IdCampeonato, Fecha, Goles1, Goles2)
VALUES (1, 2, 4, 2, 1, '2025-09-27', NULL, NULL);


-- Inserci�n en otro campeonato (v�lido)
INSERT INTO Encuentro(IdPais1, IdPais2, IdEstadio, IdFase, IdCampeonato, Fecha, Goles1, Goles2)
VALUES (1, 2, 5, 1, 2, '2025-09-28', NULL, NULL);