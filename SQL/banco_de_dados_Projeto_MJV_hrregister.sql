CREATE database HRREGISTER;
use HRREGISTER;

CREATE TABLE profissao (
	id_profissao BIGINT UNSIGNED auto_increment NOT NULL,
	nome varchar(100) NOT NULL,
	CONSTRAINT profissao_pk PRIMARY KEY (id_profissao)
);


INSERT INTO profissao (nome)
VALUES('ANALISTA DE SISTEMAS'),
('ANALISTA DE BANCO DE DADOS'),
('ANALISTA DE REDES'),
('GERENTE DE PROJETOS');



/***************************************************************/
CREATE table habilidade (
	id_habilidade BIGINT UNSIGNED auto_increment NOT NULL,
	nome varchar(100) NOT NULL,
	CONSTRAINT habilidade_pk PRIMARY KEY (id_habilidade)
);


INSERT INTO habilidade (nome)
VALUES

('JAVA'),
('SQL'),
('PHP'),
('SPRING BOOT'),
('HTML'),
('CSS'),
('REDES'),
('PMI');


/****************************************************************/

CREATE TABLE cidade (
	id_cidade BIGINT UNSIGNED auto_increment NOT NULL,
	nome varchar(100) NOT NULL,
	estado varchar(50) NOT NULL,
	sigla VARCHAR(2) NOT NULL,
	CONSTRAINT cidade_pk PRIMARY KEY (id_cidade)
);

INSERT INTO cidade (nome, estado, sigla)
VALUES
('Rio de Janeiro','Rio de Janeiro','RJ'),
('São Paulo','São Paulo','SP'),
('Fortaleza','Ceará','CE'),
('Salvador','Bahia','BA'),
('Porto Alegre','Rio Grande do Sul','RS'),
('Belém','Pará','PA');


/****************************************************************/

CREATE TABLE empresa (
	id_empresa BIGINT UNSIGNED auto_increment NOT NULL,
	nome varchar(100) NOT NULL,
	CONSTRAINT empresa_pk PRIMARY KEY (id_empresa)
);

INSERT INTO empresa (nome)
VALUES

('IBM'),
('MJV'),
('MICROSFT'),
('APPLE');


/****************************************************************/

CREATE TABLE candidato (
	id_candidato BIGINT UNSIGNED auto_increment NOT NULL,
	nome VARCHAR(100) NOT NULL,
	cpf VARCHAR(15) NOT NULL,
	dataNascimento DATE NOT NULL,
	SEXO ENUM('FEMININO','MASCULINO') NOT NULL,
	email VARCHAR(150) NOT NULL,
	telefone VARCHAR(15) null,
	celular VARCHAR(15) NULL,
	whatsapp BOOL NULL,
	bairro VARCHAR(100) NULL,
	cep VARCHAR(10) NULL,
	logradouro VARCHAR(150) NULL,
	complemento VARCHAR(150) NULL,
	numero VARCHAR(20) NULL,
	valor_maximo DOUBLE NULL,
	valor_minimo DOUBLE NULL,
	cidade_id BIGINT UNSIGNED NOT NULL,
	profissao_id BIGINT UNSIGNED NULL,
	CONSTRAINT candidato_pk PRIMARY KEY (id_candidato),
	CONSTRAINT candidato_FK FOREIGN KEY (cidade_id) REFERENCES hrregister.cidade(id_cidade) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT candidato_FK_1 FOREIGN KEY (profissao_id) REFERENCES hrregister.profissao(id_profissao) ON DELETE CASCADE ON UPDATE CASCADE
)

INSERT INTO candidato (nome, cpf, dataNascimento, SEXO, email, telefone, celular, whatsapp, bairro, cep, logradouro, complemento, numero, valor_maximo, valor_minimo, cidade_id, profissao_id)
VALUES 
    ('John Doe', '123.456.789-01', '1990-05-15', 'MASCULINO', 'john.doe@example.com', '(11)1234-5678', '(11)98765-4321', 1, 'Centro', '12345-678', 'Rua A', 'Apto 123', '123', 1000.50, 500.25,1,4),
    ('Jane Brown', '987.654.321-09', '1985-09-30', 'FEMININO', 'jane.smith@example.com', '(21) 1111-2222', NULL, NULL, 'Copacabana', '54321-987', 'Av. B', 'Casa 789', '789', 1500.75, 700.00,2,3),
	('John Doe', '12345678901', '1990-05-15', 'MASCULINO', 'johndoe@example.com', '(11)1234-5678', '(11) 9876-5432', true, 'Centro', '12345-678', 'Rua A', 'Complemento A', '123', 1000.50, 500.25,3,2),
    ('Jane Smith', '98765432109', '1985-09-30', 'FEMININO', 'janesmith@example.com', '(21)1111-2222', NULL, null, 'Copacabana', '54321-987', 'Av. B', 'Casa 789', '789', 1500.75, 700.00,4,1),
    ('John Johnson', '78945612302', '1978-12-05', 'MASCULINO', 'john.johnson@example.com', NULL, '(31)9999-8888', true, 'Centro', NULL, 'Rua C', NULL, '456', 2000.00, 1000.00,5,4),
    ('Sarah Williams', '65478912303', '1995-06-20', 'FEMININO', 'sarah.williams@example.com', '(41)2222-3333', '(41)99999-9999', false, 'Jardim', '54321-001', 'Avenida D', 'Apto 123', '987', 3000.00, 1500.00,6,3),
    ('Michael Brown', '98765432100', '1982-04-10', 'MASCULINO', 'michael.brown@example.com', NULL, NULL, null, 'Vila', '78901-234', 'Praça E', NULL, '321', 2500.00, 1200.00,1,2),
	('Alice Silva', '123.456.789-01', '1990-01-15', 'FEMININO', 'alice@example.com', '(11)1111-1111', '(11)99999-9999', TRUE, 'Centro', '12345-678', 'Rua A', 'Apto 101', '101', 1500.00, 800.50,2,1),
    ('Bob Johnson', '987.654.321-09', '1985-05-25', 'MASCULINO', 'bob@example.com', '(21)2222-2222', NULL, NULL, 'Copacabana', '54321-987', 'Av. B', NULL, '222', 2000.75, 900.25,3,4),
    ('Carla Souza', '456.789.123-45', '1992-09-08', 'FEMININO', 'carla@example.com', '(31)3333-3333', '(31)88888-8888', TRUE, 'Centro', '98765-432', 'Rua C', 'Sala 201', '201', 1800.50, 1000.00,4,3),
    ('Daniel Oliveira', '987.654.321-09', '1980-11-18', 'MASCULINO', 'daniel@example.com', '(41)4444-4444', NULL, NULL, 'São João', '65432-109', 'Avenida X', 'Apto 301', '301', 2200.25, 1100.75,5,2),
    ('Eva Santos', '123.456.789-01', '1993-04-10', 'FEMININO', 'eva@example.com', '+(51)5555-5555', '(51)77777-7777', FALSE, 'Centro', '98765-432', 'Rua Y', NULL, '111', 1900.75, 1200.25,5,1),
    ('Fernando Pereira', '987.654.321-09', '1988-02-28', 'MASCULINO', 'fernando@example.com', NULL, '(71)6666-6666', TRUE, 'Copacabana', '54321-987', 'Av. Z', 'Bloco 1', '456', 2100.00, 1300.50,1,4),
    ('Gabriela Costa', '456.789.123-45', '1996-06-20', 'FEMININO', 'gabriela@example.com', '(81)7777-7777', '(81)99999-9999', NULL, 'São João', '65432-109', 'Avenida X', 'Sala 401', '401', 1700.50, 1400.00,2,3),
    ('Hugo Rodrigues', '123.456.789-01', '1991-03-07', 'MASCULINO', 'hugo@example.com', '(31)8888-8888', NULL, TRUE, 'Centro', '98765-432', 'Rua Y', NULL, '222', 2000.25, 1500.75,3,2),
    ('Isabela Mendes', '987.654.321-09', '1989-08-12', 'FEMININO', 'isabela@example.com', '(61)9999-9999', '(61)7777-7777', FALSE, 'Copacabana', '54321-987', 'Av. Z', 'Bloco 2', '789', 1800.00, 1600.50,4,1),
    ('Joaquim Alves', '456.789.123-45', '1997-10-22', 'MASCULINO', 'joaquim@example.com', '(11)3333-3333', NULL, NULL, 'São João', '65432-109', 'Avenida X', 'Apto 501', '501', 2200.75, 1700.25,5,4),
    ('Karine Lima', '123.456.789-01', '1994-12-30', 'FEMININO', 'karine@example.com', '+(21)4444-4444', '(21)88888-8888', TRUE, 'Centro', '12345-678', 'Rua A', 'Apto 202', '202', 1600.25, 1800.75,6,3),
    ('Leonardo Fernandes', '987.654.321-09', '1986-01-11', 'MASCULINO', 'leonardo@example.com', NULL, '(31)7777-7777', FALSE, 'Copacabana', '54321-987', 'Av. B', 'Bloco 3', '456', 2100.50, 1900.00,1,2),
  	('Mariana Gonçalves', '456.789.123-45', '1998-07-03', 'FEMININO', 'mariana@example.com', '+(41)5555-5555', NULL, TRUE, 'São João', '65432-109', 'Avenida X', 'Sala 302', '302', 2300.00, 2000.50,2,1),
    ('Nathan Ribeiro', '123.456.789-01', '1992-09-15', 'MASCULINO', 'nathan@example.com', '+(51)7777-7777', '(51)99999-9999', TRUE, 'Centro', '12345-678', 'Rua A', 'Casa 789', '789', 1400.50, 2100.25,3,4),
    ('Olivia Castro', '987.654.321-09', '1989-05-05', 'FEMININO', 'olivia@example.com', '+(71)3333-3333', NULL, NULL, 'Copacabana', '54321-987', 'Av. B', 'Bloco 4', '222', 1800.25, 2200.75,4,3),
    ('Pedro Santos', '456.789.123-45', '1995-11-18', 'MASCULINO', 'pedro@example.com', '(81)7777-7777', '(81)7777-8888', FALSE, 'São João', '65432-109', 'Avenida X', NULL, '111', 2500.75, 2300.25,5,2),
    ('Quitéria Oliveira', '123.456.789-01', '1993-03-07', 'FEMININO', 'quiteria@example.com', '(21)8888-8888', '(21)7777-7777', TRUE, 'Centro', '98765-432', 'Rua Y', 'Sala 502', '502', 1600.50, 2400.00,6,1),
    ('Rafael Costa', '987.654.321-09', '1987-08-22', 'MASCULINO', 'rafael@example.com', '(61)5555-5555', NULL, NULL, 'Copacabana', '54321-987', 'Av. Z', 'Bloco 5', '789', 2200.00, 2500.50,1,4),
    ('Sophia Almeida', '456.789.123-45', '1994-06-20', 'FEMININO', 'sophia@example.com', '(11)9999-9999', '(11)6666-6666', TRUE, 'São João', '65432-109', 'Avenida X', 'Apto 601', '601', 1700.25, 2600.75,2,3),
    ('Thiago Martins', '123.456.789-01', '1990-01-30', 'MASCULINO', 'thiago@example.com', NULL, '(31)7777-7777', FALSE, 'Centro', '98765-432', 'Rua Y', 'Casa 789', '789', 2100.50, 2700.25,3,2),
    ('Ursula Rodrigues', '987.654.321-09', '1988-06-12', 'FEMININO', 'ursula@example.com', '+(41)3333-3333', NULL, NULL, 'Copacabana', '54321-987', 'Av. B', 'Bloco 6', '222', 2000.75, 2800.75,4,1),
    ('Vitor Lima', '456.789.123-45', '1997-09-22', 'MASCULINO', 'vitor@example.com', '(51)7777-7777', '(51)6666-6666', TRUE, 'São João', '65432-109', 'Avenida X', 'Sala 702', '702', 2200.25, 2900.50,5,4),
    ('Wendy Castro', '123.456.789-01', '1991-12-07', 'FEMININO', 'wendy@example.com', '(21)8888-8888', '(21)6666-6666', NULL, 'Centro', '12345-678', 'Rua A', 'Apto 802', '802', 1700.50, 3000.00,6,3),
    ('Xavier Pereira', '987.654.321-09', '1986-05-03', 'MASCULINO', 'xavier@example.com', '(31)9999-9999', NULL, NULL, 'Copacabana', '54321-987', 'Av. B', 'Bloco 7', '456', 2300.75, 3100.50,1,2),
    ('Yasmin Gonçalves', '456.789.123-45', '1992-11-20', 'FEMININO', 'yasmin@example.com', '(41)7777-7777', NULL, TRUE, 'São João', '65432-109', 'Avenida X', 'Apto 901', '901', 2500.00, 3200.75,2,1),
    ('Zeca Santos', '123.456.789-01', '1993-03-15', 'MASCULINO', 'zeca@example.com', NULL, '(51)6666-6666', FALSE, 'Centro', '12345-678', 'Rua A', 'Casa 789', '789', 1800.75, 3300.25,3,4);
    
    
    
/****************************************************************/

CREATE TABLE experiencia (
	id_experiencia BIGINT UNSIGNED auto_increment NOT NULL,
	DATA_CONTRATACAO DATE NOT NULL,
	DATA_DESLIGAMENTO DATE NULL,
	emprego_atual BOOL NULL,
	regime_contratacao ENUM ('CLT','PJ','COP','AUT') NOT NULL,
	salario DOUBLE NULL,
	candidato_id BIGINT UNSIGNED NOT NULL,
	empresa_id BIGINT UNSIGNED NOT NULL,
	CONSTRAINT experiencia_pk PRIMARY KEY (id_experiencia),
	CONSTRAINT experiencia_FK FOREIGN KEY (candidato_id) REFERENCES hrregister.candidato(id_candidato) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT experiencia_FK_1 FOREIGN KEY (empresa_id) REFERENCES hrregister.empresa(id_empresa) ON DELETE CASCADE ON UPDATE CASCADE
)


INSERT INTO experiencia (DATA_CONTRATACAO, DATA_DESLIGAMENTO, emprego_atual, regime_contratacao, salario, candidato_id, empresa_id) VALUES
('2023-01-15', NULL, 1, 'CLT', 5000.00,33,1),
('2022-09-20', '2023-07-10', 0, 'PJ', 8000.00,32,2),
('2023-02-10', NULL, 1, 'CLT', 4500.00,31,3),
('2023-03-05', NULL, 1, 'COP', 3000.00,30,4),
('2022-06-12', '2023-01-25', 0, 'PJ', 6500.00,29,4),
('2023-04-02', NULL, 1, 'AUT', 3500.00,28,3),
('2022-11-18', '2023-06-30', 0, 'PJ', 7200.00,27,2),
('2023-05-10', NULL, 1, 'CLT', 4800.00,26,1),
('2022-10-05', '2023-03-15', 0, 'PJ', 5500.00,25,4),
('2022-12-30', '2023-07-05', 0, 'PJ', 6700.00,24,3),
('2023-06-22', NULL, 1, 'CLT', 5200.00,23,2),
('2023-01-05', NULL, 1, 'CLT', 4200.00,21,1),
('2022-08-25', '2023-06-20', 0, 'PJ', 7800.00,20,4),
('2023-03-15', NULL, 1, 'COP', 3200.00,19,3),
('2023-04-20', NULL, 1, 'AUT', 3800.00,18,2),
('2022-11-02', '2023-05-12', 0, 'PJ', 6900.00,17,1),
('2023-05-30', NULL, 1, 'CLT', 5100.00,16,4),
('2022-12-15', '2023-07-01', 0, 'PJ', 6500.00,15,3),
('2023-07-10', NULL, 1, 'CLT', 5300.00,14,2),
('2023-02-20', NULL, 1, 'CLT', 4700.00,13,1),
('2022-09-10', '2023-04-30', 0, 'PJ', 7200.00,11,4),
('2023-06-05', NULL, 1, 'COP', 3500.00,10,3),
('2022-08-20', '2023-05-31', 0, 'PJ', 7600.00,9,2),
('2023-03-02', NULL, 1, 'AUT', 4000.00,8,1),
('2023-04-10', NULL, 1, 'CLT', 5000.00,7,4),
('2022-10-18', '2023-06-25', 0, 'PJ', 7100.00,6,3),
('2022-12-10', '2023-07-15', 0, 'PJ', 6600.00,5,2),
('2023-07-02', NULL, 1, 'CLT', 5400.00,4,1),
('2023-02-28', NULL, 1, 'CLT', 4900.00,3,4),
('2022-09-02', '2023-04-15', 0, 'PJ', 7000.00,2,3);


/***************************************************************/


CREATE table candidato_habilidade (
	id_candidato_habilidade BIGINT UNSIGNED auto_increment NOT NULL,
	candidato_id BIGINT UNSIGNED NOT NULL,
	habilidade_id BIGINT UNSIGNED NOT NULL,
	CONSTRAINT candidato_habilidade_pk PRIMARY KEY (id_candidato_habilidade),
	CONSTRAINT candidato_habilidade_FK FOREIGN KEY (candidato_id) REFERENCES hrregister.candidato(id_candidato) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT candidato_habilidade_FK_1 FOREIGN KEY (habilidade_id) REFERENCES hrregister.habilidade(id_habilidade) ON DELETE CASCADE ON UPDATE CASCADE
)


INSERT INTO candidato_habilidade (candidato_id, habilidade_id) VALUES
(1,1),
(1,2),
(1,3),
(1,5),
(2,4),
(2,6),
(2,7),
(2,8),
(2,1),
(3,2),
(3,3),
(3,5),
(3,4),
(3,6),
(4,7),
(4,8),
(4,1),
(4,2),
(5,3),
(5,5),
(5,4),
(5,6),
(6,7),
(6,8),
(6,1),
(6,2),
(7,3),
(7,5),
(7,4),
(7,6),
(8,7),
(8,8),
(8,1),
(8,2),
(9,3),
(9,5),
(9,4),
(9,6),
(10,7),
(10,8),
(10,1),
(10,2),
(11,3),
(11,5),
(11,4),
(11,6),
(11,7),
(12,8),
(12,1),
(12,2),
(12,3),
(13,5),
(13,4),
(14,6),
(14,7),
(14,8),
(15,1),
(15,2),
(15,3),
(15,5),
(16,4),
(16,6),
(16,7),
(16,8),
(17,1),
(17,2),
(17,3),
(17,5),
(17,4),
(18,6),
(18,7),
(18,8),
(18,1),
(18,2),
(19,3),
(19,5),
(19,4),
(19,6),
(20,7),
(20,8),
(20,1),
(20,2),
(20,3),
(21,5),
(21,4),
(21,6),
(22,7),
(22,8),
(23,1),
(23,2),
(23,3),
(23,5),
(23,4),
(24,6),
(24,7),
(24,8),
(24,1),
(24,2),
(25,3),
(25,5),
(25,4),
(25,6),
(25,7),
(25,8),
(26,1),
(26,2),
(26,3),
(26,5),
(27,4),
(27,6),
(27,7),
(27,8),
(27,1),
(27,2),
(28,3),
(28,5),
(28,4),
(28,6),
(28,7),
(29,8),
(29,1),
(29,2),
(29,3),
(30,5),
(30,4),
(30,6),
(30,7),
(31,8),
(31,1),
(31,2),
(31,3),
(31,5),
(32,4),
(32,6),
(32,7),
(32,8),
(32,1),
(33,2),
(33,3),
(33,5),
(33,4);



