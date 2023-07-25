
SELECT * FROM candidato;
SELECT * FROM candidato_habilidade;
SELECT * FROM cidade;
SELECT * FROM empresa;
SELECT * FROM experiencia;
SELECT * FROM habilidade;
SELECT * FROM profissao;

ALTER TABLE candidato
RENAME COLUMN dataNascimento TO data_nascimento;

UPDATE empresa SET nome = 'MICROSOFT' WHERE id_empresa = 3;

/*Contar quantos candidatos possuem a habilidade JAVA*/
select Count(c.id_candidato) As Quantidade from candidato c
inner join candidato_habilidade ch inner join habilidade h
on c.id_candidato = ch.candidato_id and ch.habilidade_id = h.id_habilidade
where h.id_habilidade = 1;

/*Selecionar os candidatos que são do sexo FEMININO e que moram nas cidades do estado
sigla SP informando o nome, cpf, dados de endereço e nome da cidade*/
select c.nome, c.cpf, c.bairro, c.cep, c.complemento, c.logradouro, c.numero, ci.nome, ci.sigla, ci.estado
from candidato c
inner join cidade ci on c.cidade_id = ci.id_cidade
where c.SEXO = 'FEMININO'
and ci.estado = 'São Paulo';

/*Agrupar por profissão e contar quantos profissionais que moram na cidade de nome SÃO PAULO*/
SELECT p.nome AS Profissao, COUNT(*) AS total
FROM candidato c
INNER JOIN profissao p ON c.profissao_id = p.id_profissao
INNER JOIN cidade ci ON c.cidade_id = ci.id_cidade
WHERE ci.nome = 'São Paulo'
GROUP BY p.nome;


/*Selecionar candidatos que registram experiências com data de contratação entre 01/01/2020 a 31/12/2023*/
SELECT c.nome, ex.DATA_CONTRATACAO, ex.DATA_DESLIGAMENTO
FROM candidato c
INNER JOIN experiencia ex ON c.id_candidato = ex.candidato_id
WHERE ex.DATA_CONTRATACAO >= '2020-01-01' AND ex.DATA_CONTRATACAO <= '2023-12-31';


/*Selecionar candidatos que estão trabalhando atualmente*/
SELECT c.nome, c.email, c.cpf, em.nome
FROM candidato c
INNER JOIN experiencia ex ON c.id_candidato = ex.candidato_id
INNER JOIN empresa em ON ex.empresa_id = em.id_empresa
WHERE ex.DATA_DESLIGAMENTO is null or  ex.emprego_Atual = 'true';


/* Criar uma consulta que retorne todos os candidatos e nome da sua profissão correspondentemente */
select c.nome, p.nome as Profissão from candidato c
inner join profissao p on c.profissao_id = p.id_profissao;


/*Criar uma consulta que conte a quantidade de profissionais por profissão*/
SELECT p.nome, COUNT(p.nome) AS quantidade
FROM candidato c
INNER JOIN profissao p ON p.id_profissao = c.profissao_id
GROUP BY p.nome;


/*Criar uma consulta que retorne os candidatos ordenados por profissão e salário máximo de forma decrescente*/
SELECT c.nome, p.nome AS profissao, ex.salario
FROM candidato c
INNER JOIN profissao p ON p.id_profissao = c.profissao_id
INNER JOIN experiencia ex ON ex.candidato_id = c.id_candidato
ORDER BY p.nome, ex.salario DESC;


/*Selecionar candidatos que já trabalharam na empresa MICROSOFT*/
SELECT c.nome, c.email, c.cpf, em.nome
FROM candidato c
INNER JOIN experiencia ex ON c.id_candidato = ex.candidato_id
INNER JOIN empresa em ON ex.empresa_id = em.id_empresa
WHERE em.nome = 'MICROSOFT' AND ex.DATA_DESLIGAMENTO is not null;


/*Selecionar candidatos que trabalharam na empresa MICROSOFT*/
SELECT c.nome, c.email, c.cpf, em.nome
FROM candidato c
INNER JOIN experiencia ex ON c.id_candidato = ex.candidato_id
INNER JOIN empresa em ON ex.empresa_id = em.id_empresa
WHERE em.nome = 'MICROSOFT' AND ex.emprego_atual = true;

/* Criar uma consulta que retorne todos os candidatos e nome da sua profissão onde o id da profissão corresponda ao registro ANALISTA DE SISTEMAS */
SELECT candidato.nome, profissao.nome
FROM candidato
INNER JOIN profissao ON candidato.profissao_id = profissao.id_profissao
WHERE profissao.nome = 'Analista de Sistemas';





