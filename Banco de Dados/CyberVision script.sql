create database CyberVision;
use CyberVision;

create table faculdade
(id_faculdade int primary key auto_increment,
nome_fantasia varchar(40),
razao_social varchar(40),
cnpj char(15),
cep char (8),
numero int);


create table usuario
(id_usuario int primary key auto_increment,
nome varchar(40),
email varchar(40),
senha varchar (30),
cargo varchar(20),
fk_faculdade int,
foreign key (fk_faculdade) references faculdade (id_faculdade));

create table andar
(id_andar int primary key,
numero_andar int,
fk_faculdade int,
foreign key (fk_faculdade) references faculdade (id_faculdade));

create table sala 
(id_sala int primary key,
identificação varchar(10),
fk_andar int,
foreign key (fk_andar) references andar (id_andar));

create table maquina
(id_maquina int primary key auto_increment,
processador varchar(40),
placa_mae varchar(40),
ram int,
memoria int,
sistema_operacional varchar (20),
fk_sala int,
foreign key (fk_sala) references sala (id_sala));

create table desempenho
(id_relatorio int primary key auto_increment,
tipo varchar (15),
CHECK (tipo = 'manual' or tipo = 'automatico'),
fk_maquina int,
foreign key (fk_maquina) references computador (id_maquina),
uso_cpu int,
uso_disco int,
uso_ram int,
processos varchar (500));

create table tipo_alerta
(id_tipo_alerta int primary key auto_increment,
gravidade varchar(20),
descricao varchar (500));

create table alerta
(id_alerta int primary key auto_increment,
data_hora datetime,
fk_tipo_alerta int,
foreign key (fk_tipo_alerta) references tipo_alerta (id_tipo_alerta));

create table tipo_chamado 
(id_tipo_chamado int primary key auto_increment,
tipo_chamado varchar (500),
descricao varchar(500)
);

create table chamado_manual
(id_chamado int primary key auto_increment,
nome_aluno varchar(500),
data_hora datetime,
descricao varchar(500),
fk_tipo_chamado int,
foreign key (fk_tipoChamado) references tipo_chamado (id_tipo_chamado),
fk_maquina int,
foreign key (fk_maquina) references maquina (id_maquina)
);