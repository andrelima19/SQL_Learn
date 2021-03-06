/* PRIMEIRA FORMA NORMAL */

/*

1 - TODO CAMPO VETORIZADO SE TORNARÁ OUTRA TABELA

[AMARELO, AZUL, LARANJA, VERDE] -> CORES
[KA, FIESTA, UNO, CIVIC]-> CARROS

2 - TODO CAMPO MULTIVALORADO SE TORNARÁ OUTRA TABELA.
QUANDO O CAMPO FOR DIVIS'IVEL

3 - TODA TABELA NECESSITA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE
TODO O REGISTRO COMO SENDO UNICO.
ISSO ;E O QUE CHAMAMOS DE CHAVE PRIMARIA OU PRIMARY KEY.

-- Existem dois tipos de chaves:
-- Natural - É uma chave que pertence ao usuário ou registro como CPF
	Não recomenda-se usar chaves naturais com chaves primárias pq são institucionais
	e se a instituição muda o procedimento isso prejudica todo o banco.
	Ex: CPF deixar de existir.
	
-- Artificial - É uma chave que é criada.

*/

/* CARDINALIDADE E OBRIGATORIEDADE */
-- QUEM DEFINE A CARDANILIDADE  É A REGRA DE NEGOCIO NÃO É VOCÊ
-- QUEM CONTROLA A OBRIGATORIEDADE DE DADOS É A LINGUAGEM DE PROGRAMAÇÃO NÃO O BANCO
-- ELE CONTROLA A CARDANILIDADE
-- A OBRIGATORIEDADE DEFINE SE UM DADO É OBRIGATÓRIO
-- A CARDANILIDADE DEFINE A QUANTIDADE (1 - QUE É O MÁXIMO OU N - QUE É MAIS DE UM)

-- 0, N (Não é obrigatório e pode entrar com muitos dados)
-- 0, 1 (Não é obrigatório e pode entrar com no máximo 1)
-- 1, N (É obrigatório e pode entrar com muitos dados)
-- 1, 1 (É obrigatório e pode entrar com no máximo 1)

-- Primeiro algarismo tem a ver com a OBRIGATORIEDADE
-- Segundo algarismo tem a ver com a CARDINALIDADE

-- 0 - FALSO
-- 1 - VERDADEIRO

-- A relação é lida sempre do segundo número do par
-- Ex1: Entidade telefone(0,n) - Entidade Cliente(1,1)
-- Leia-se 1 pra n (Um cliente pra muitos telefones)

-- Ex2: Entidade Endereço(1,1) - Entidade Cliente(1,1)
-- Leia-se 1 pra 1 (Um cliente pra um endereço)



CREATE DATABASE COMERCIO;
USE COMERCIO;

/*
CREATE TABELA CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT, 
	NOME VARCHAR(30) NOT NULL -- Obrigatório,
	SEXO ENUM('M', 'F') NOT NULL, -- ENUM é um domínio, caixa
	-- de texto com valor fixo. Em outras linguagens O ENUM se chama Constraint de check
	EMAIL VARCHAR(50) UNIQUE -- Não permite dados repetidos.
);

*/


CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	
	
	-- O campo abaixo não é uma coluna, sim uma regra aplicada a coluna 'ID_CLIENTE'
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

/*
	COMO A REGRA DE NEGÓCIO É DEFINIDA?
	A REGRA DE NEGÓCIO É DEFINIDA NA FOREIGN KEY PELA PRESENÇA OU 
	AUSÊNCIA DA CLASUSA 'UNIQUE'. 
	POR EXEMPLO, SE NESSA TABELA ENDEREÇO INFORAMOS QUE O IDCLIENTE UÉ 
	UNIQUE, DEFINIMOS QUE O RELACIONAMENTO É 1 X 1. O CLIENTE IRÁ APARECER
	APENAS UMA VEZ.
	
	E 1 X N? É SÓ NÃO POSSUIR A CLAUSULA 'UNIQUE'.
*/


CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES', 'CEL', 'COM') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,
	

	-- O campo abaixo não é uma coluna, sim uma regra aplicada a coluna 'ID_CLIENTE'
	FOREIGN KEY(ID_CLIENTE)
	-- QUEM É A SUA CHAVE ESTRANGEIRA? (FOREIGN KEY)
	-- MINHA FOREIGN KEY É ID_CLIENTE.
	
	--O CAMPO ID_CLIENTE SE REFERE A QUAL TABELA?
	REFERENCES CLIENTE(IDCLIENTE)
	--REFERENCES (SE REFERE) A TABELA (CLIENTE)
	-- A QUAL CAMPO DA TABELA CLIENTE (AO CAMPO IDCLIENTE)
);



CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES', 'CEL', 'COM') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,
	
	-- O campo abaixo não é uma coluna, sim uma regra aplicada a coluna 'ID_CLIENTE'
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
	
);



-- Endereço  - Obrigatório
-- Cadastro somente um
-- Telefone - Não obrigatório
-- Cadastro de mais de um (Opcional)

/*
CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA
QUE VAIAT É A OUTRA TABELA PARA FAZER REFERENCIA ENTRE
REGISTROS */

/* EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */

/* EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARA SEMPRE NA
CARDINALIDADE N */

-- Não existe um regra para os nomes de foregein key, isso é uma
-- convenção da empresa.


--APAGANDO UMA TABELA
-- DROP TABLE NOME DA TABELA;

DESC CLIENTE;

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','M','JCELIA@IG.COM','5767876889');
INSERT INTO CLIENTE VALUES(NULL,'MARCIA','F','MCARVALHO@UOL.COM','232336889');


SELECT * FROM CLIENTE;


DESC ENDERECO;
	
INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);

INSERT INTO ENDERECO VALUES(NULL,'RUA BARATA RIBEIRO','COPACABANA','RIO DE JANEIRO','RJ',11);
-- SE EU INSERIR UMA CHAVE ESTRANGEIRA QUE NÃO ESTÁ VINCULADA A ID (NO CASO DA TABELA CLIENTE)
-- IRÁ RETORNAR UM ERRO
-- INTEGRIDADE REFERENCIAL

-- COM O CLIENTE JÁ CRIADO.
INSERT INTO ENDERECO VALUES(NULL,'RUA BARATA RIBEIRO','COPACABANA','RIO DE JANEIRO','RJ',7);


SELECT * FROM ENDERECO;

DESC TELEFONE;

INSERT INTO TELEFONE VALUES(NULL,'CEL','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',2);

SELECT * FROM TELEFONE;
















