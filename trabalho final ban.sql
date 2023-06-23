CREATE TABLE Categorias (
  categoria_id INT PRIMARY KEY,
  nome_categoria VARCHAR(255)
);

CREATE TABLE Eventos (
  evento_id INT PRIMARY KEY,
  nome VARCHAR(255),
  descricao VARCHAR(255),
  data_inicio DATE,
  data_fim DATE,
  local VARCHAR(255),
  informacoes_adicionais VARCHAR(255),
  categoria_id INT,
  FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);

CREATE TABLE Participantes (
  participante_id INT PRIMARY KEY,
  nome VARCHAR(255),
  endereco VARCHAR(255),
  informacoes_contato VARCHAR(255)
);

CREATE TABLE Evento_Participantes (
  evento_id INT,
  participante_id INT,
  PRIMARY KEY (evento_id, participante_id),
  FOREIGN KEY (evento_id) REFERENCES Eventos(evento_id),
  FOREIGN KEY (participante_id) REFERENCES Participantes(participante_id)
);

CREATE TABLE Sessoes (
  sessao_id INT PRIMARY KEY,
  titulo VARCHAR(255),
  descricao VARCHAR(255),
  hora_inicio TIME,
  hora_fim TIME,
  local VARCHAR(255),
  evento_id INT,
  FOREIGN KEY (evento_id) REFERENCES Eventos(evento_id)
);

CREATE TABLE Palestrantes (
  palestrante_id INT PRIMARY KEY,
  nome VARCHAR(255),
  biografia TEXT,
  informacoes_contato VARCHAR(255)
);

CREATE TABLE Sessao_Palestrantes (
  sessao_id INT,
  palestrante_id INT,
  PRIMARY KEY (sessao_id, palestrante_id),
  FOREIGN KEY (sessao_id) REFERENCES Sessoes(sessao_id),
  FOREIGN KEY (palestrante_id) REFERENCES Palestrantes(palestrante_id)
);



INSERT INTO Categorias (categoria_id, nome_categoria) VALUES
  (1, 'Tecnologia'),
  (2, 'Negócios'),
  (3, 'Saúde');

INSERT INTO Eventos (evento_id, nome, descricao, data_inicio, data_fim, local, informacoes_adicionais, categoria_id) VALUES
  (1, 'Conferência XYZ', 'Uma conferência sobre as últimas tendências em tecnologia, com palestras e workshops interativos.', '2023-08-15', '2023-08-17', 'São Paulo, SP', 'Detalhes adicionais', 1),
  (2, 'Workshop ABC', 'Um workshop prático para empreendedores discutindo estratégias de negócios.', '2023-09-10', '2023-09-11', 'Rio de Janeiro, RJ', 'Mais informações', 2);

INSERT INTO Participantes (participante_id, nome, endereco, informacoes_contato) VALUES
  (1, 'João da Silva', 'Rua A, 123, São Paulo, SP', 'joao@example.com'),
  (2, 'Maria Souza', 'Av. B, 456, Rio de Janeiro, RJ', 'maria@example.com'),
  (3, 'Pedro Santos', 'Rua C, 789, Belo Horizonte, MG', 'pedro@example.com'),
  (4, 'Ana Oliveira', 'Rua D, 321, Brasília, DF', 'ana@example.com');

INSERT INTO Evento_Participantes (evento_id, participante_id) VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 4);

INSERT INTO Sessoes (sessao_id, titulo, descricao, hora_inicio, hora_fim, local, evento_id) VALUES
  (1, 'Introdução à IA', 'Uma introdução ao campo da Inteligência Artificial.', '09:00:00', '10:30:00', 'Sala A', 1),
  (2, 'Machine Learning', 'Aplicações práticas de Machine Learning em negócios.', '11:00:00', '12:30:00', 'Sala B', 1),
  (3, 'Estratégias de Vendas', 'Táticas para melhorar as vendas de um negócio.', '09:30:00', '11:00:00', 'Sala C', 2);

INSERT INTO Palestrantes (palestrante_id, nome, biografia, informacoes_contato) VALUES
  (1, 'Carlos Oliveira', 'Carlos Oliveira é especialista em inteligência artificial com mais de 10 anos de experiência.', 'carlos@example.com'),
  (2, 'Ana Rodrigues', 'Ana Rodrigues é empreendedora e fundadora de uma startup de sucesso.', 'ana@example.com');

INSERT INTO Sessao_Palestrantes (sessao_id, palestrante_id) VALUES
  (1, 1),
  (2, 2),
  (3, 1);
  
  
  
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

-- todos paricipantes que se registraram para qualquer evento
SELECT Participantes.*
FROM Participantes
JOIN Evento_Participantes ON Participantes.participante_id = Evento_Participantes.participante_id;

