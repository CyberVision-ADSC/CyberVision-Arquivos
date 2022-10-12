CREATE DATABASE cybervision;
USE cybervision;

CREATE TABLE faculdade(
  id_faculdade INT PRIMARY KEY AUTO_INCREMENT,
  nome_fantasia VARCHAR(40),
  razao_social VARCHAR(40),
  cnpj CHAR(15),
  cep CHAR(8),
  numero INT
);
  
  CREATE TABLE usuario (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(40),
  email VARCHAR(40),
  senha VARCHAR(40),
  tipo VARCHAR(40),
  fk_faculdade INT NOT NULL,
  tipo_usuario VARCHAR(10),
  FOREIGN KEY (fk_faculdade)
  REFERENCES faculdade (id_faculdade)
);

CREATE TABLE andar (
  id_andar INT PRIMARY KEY AUTO_INCREMENT,
  identificador_andar VARCHAR(40),
  descricao_andar VARCHAR(255),
  fk_faculdade INT,
  FOREIGN KEY (fk_faculdade)
  REFERENCES faculdade (id_faculdade)
);

CREATE TABLE sala (
  id_sala INT PRIMARY KEY AUTO_INCREMENT,
  identificador_sala VARCHAR(40),
  descricao_sala VARCHAR(255),
  fk_andar INT,
  FOREIGN KEY (fk_andar)
  REFERENCES andar (id_andar)
);
  
CREATE TABLE computador (
  id_computador INT PRIMARY KEY AUTO_INCREMENT,
  hostname VARCHAR(100),
  processador VARCHAR(100),
  arquitetura VARCHAR (10),
  fabricante VARCHAR(100),
  ram INT,
  disco INT,
  sistema_operacional VARCHAR(40),
  ativo BOOLEAN,
  problema_fisico BOOLEAN,
  problema_memoria BOOLEAN,
  problema_cpu BOOLEAN,
  problema_disco BOOLEAN,
  fk_sala INT,
  FOREIGN KEY (fk_sala)
  REFERENCES sala (id_sala)
);

CREATE TABLE relatorio (
  id_relatorio INT PRIMARY KEY AUTO_INCREMENT,
  tipo VARCHAR(15),
  uso_cpu INT,
  uso_disco INT,
  uso_ram INT,
  data_hora DATETIME,
  fk_computador INT,
  FOREIGN KEY (fk_computador)
  REFERENCES computador (id_computador),
  fk_sala INT,
  FOREIGN KEY (fk_sala)
  REFERENCES sala (id_sala)
);
  
CREATE TABLE processo (
	id_processo INT PRIMARY KEY AUTO_INCREMENT,
    pid INT,
    nome VARCHAR(100),
    uso_cpu INT,
    uso_memoria INT,
    fk_computador INT,
    FOREIGN KEY (fk_computador)
    REFERENCES computador (id_computador)
);