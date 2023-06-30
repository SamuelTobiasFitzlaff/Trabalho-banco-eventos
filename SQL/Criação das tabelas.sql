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
