SELECT * FROM Categorias;
SELECT * FROM Eventos;
SELECT * FROM Participantes;
SELECT * FROM Sessoes;
SELECT * FROM Palestrantes;

-- todos os participantes registrados para um evento específico
SELECT Participantes.*
FROM Participantes
JOIN Evento_Participantes ON Participantes.participante_id = Evento_Participantes.participante_id
WHERE Evento_Participantes.evento_id = <event_id>;

-- todas as sessões para um evento específico
SELECT * FROM Sessoes WHERE evento_id = <event_id>;

-- todos palestrantes para uma sessão específica
  SELECT Palestrantes.*
FROM Palestrantes
JOIN Sessao_Palestrantes ON Palestrantes.palestrante_id = Sessao_Palestrantes.palestrante_id
WHERE Sessao_Palestrantes.sessao_id = <sessao_id>;

-- todos eventos em uma categoria específica
SELECT * FROM Eventos WHERE categoria_id = <categoria_id>;
