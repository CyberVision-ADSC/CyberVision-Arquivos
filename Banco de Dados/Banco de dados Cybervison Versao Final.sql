DROP DATABASE cybervision;
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
  tipo_usuario VARCHAR(40),
  fk_faculdade INT NOT NULL,
  is_ativo BOOLEAN,
  FOREIGN KEY (fk_faculdade)
  REFERENCES faculdade (id_faculdade)
);

CREATE TABLE andar (
  id_andar INT PRIMARY KEY AUTO_INCREMENT,
  identificador_andar VARCHAR(40),
  descricao_andar VARCHAR(255),
  fk_faculdade INT,
  is_ativo BOOLEAN,
  FOREIGN KEY (fk_faculdade)
  REFERENCES faculdade (id_faculdade)
);

CREATE TABLE sala (
  id_sala INT PRIMARY KEY AUTO_INCREMENT,
  identificador_sala VARCHAR(40),
  descricao_sala VARCHAR(255),
  fk_andar INT,
  is_ativo BOOLEAN,
  FOREIGN KEY (fk_andar)
  REFERENCES andar (id_andar)
);
 
CREATE TABLE computador (
  id_computador INT PRIMARY KEY AUTO_INCREMENT,
  identificador_computador VARCHAR(100),
  hostname VARCHAR(100) UNIQUE,
  processador VARCHAR(100),
  arquitetura INT,
  fabricante VARCHAR(100),
  ram LONG,
  disco LONG,
  problema_cpu BOOLEAN,
  problema_disco BOOLEAN,
  problema_memoria BOOLEAN,
  problema_fisico BOOLEAN,
  sistema_operacional VARCHAR(100),
  is_ativo BOOLEAN,
  fk_sala INT,
  FOREIGN KEY (fk_sala)
  REFERENCES sala (id_sala)
);

CREATE TABLE relatorio (
  id_relatorio INT PRIMARY KEY AUTO_INCREMENT,
  uso_cpu DOUBLE,
  uso_disco LONG,
  uso_ram LONG,
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
    uso_cpu DOUBLE,
      uso_memoria DOUBLE,
    data_hora_atualizado DATETIME,
    fk_computador INT,
    FOREIGN KEY (fk_computador)
    REFERENCES computador (id_computador)
);

CREATE TABLE chamados (
id_chamado INT PRIMARY KEY AUTO_INCREMENT,
ra_aluno VARCHAR(50),
hostname VARCHAR(100),
descricao_ocorrido VARCHAR(300),
status_chamado CHAR(10), CHECK (status_chamado = 'Pendente' or status_chamado = 'Finalizado'),
responsavel_chamado VARCHAR(50),
data_hora DATETIME,
fk_computador INT,
FOREIGN KEY (fk_computador)
REFERENCES computador (id_computador)
);


insert into faculdade values(
null, 'Sptech', 'sptech', '111111111111111', '88888888', 3388);

insert into usuario values(
null, 'Leonardo', 'leo@gmail.com', '123456', 'admin', 1, true);

insert into andar values(
null, 'Andar 1', 'Andar legal', true, 1
);

insert into sala values (
null, 'Sala 2ADSC', 'Sala legal', true, 1
);

insert into computador (id_computador, hostname, is_ativo, fk_sala) values(
null, '123456789', true, 1
);

select * from faculdade;
select * from andar;
select * from sala;
select * from usuario;
select * from computador;
select * from relatorio;
select * from processo;
select * from chamados;