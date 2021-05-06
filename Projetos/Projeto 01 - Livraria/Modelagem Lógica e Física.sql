/* MODELAGEM DE DADOS */


/* 1- MODELAGEM CONCEITUAL
Banco:	LIVRARIA
Tabela:	LIVROS
Atributos:	
NOME DO LIVRO	
NOME DO AUTOR	
SEXO DO AUTOR	
NUMERO DE PÁGINAS	
NOME DA EDITORA	
VALOR DO LIVRO	
ESTADO (UF) DA EDITORA	
ANO PUBLICACAO*/	


/* 2- MODELAGEM LÓGICA*/
NOME_DO_LIVRO - CARACTER(50)	
NOME_DO_AUTOR - CARACTER(30)	
SEXO_DO_AUTOR - CARACTER(10)	
NUMERO_DE_PÁGINAS - NUMERICO(6)	
NOME_DA_EDITORA	- CARACTER(30)
VALOR_DO_LIVRO - NUMERICO(4)	
ESTADO_(UF)_DA_EDITORA - CARACTER(2)	
ANO_PUBLICACAO - NUMERICO(4)


/* 3- MODELAGEM FÍSICA*/
NOME_DO_LIVRO - VARCHAR(50)	
NOME_DO_AUTOR - VARCHAR(30)	
SEXO_DO_AUTOR - VARCHAR(10)	
NUMERO_DE_PÁGINAS - INT(6)	
NOME_DA_EDITORA	- VARCHAR(30)
VALOR_DO_LIVRO - FLOAT(4)	
ESTADO_(UF)_DA_EDITORA - CHAR(2)	
ANO_PUBLICACAO - INT(4)



/*Criação do banco: LIVRARIA*/
CREATE DATABASE LIVRARIA;
USE LIVRARIA;

/*Exibindo bancos */
SHOW DATABASES;

/*Criação da tabela: LIVROS */
CREATE TABLE LIVROS(
	NOME_DO_LIVRO VARCHAR(50),
	NOME_DO_AUTOR VARCHAR(30),
	SEXO_DO_AUTOR VARCHAR(10),
	NUMERO_DE_PÁGINAS INT(6),
	NOME_DA_EDITORA VARCHAR(30),
	VALOR_DO_LIVRO FLOAT(4),
	ESTADO_DA_EDITORA CHAR(2),	
	ANO_PUBLICACAO INT(4)
);

/*Inserindo dados no banco*/

INSERT INTO LIVROS (NOME_DO_LIVRO, NOME_DO_AUTOR, SEXO_DO_AUTOR, NUMERO_DE_PÁGINAS, NOME_DA_EDITORA, VALOR_DO_LIVRO,ESTADO_DA_EDITORA,ANO_PUBLICACAO) 
VALUES('Cavaleiro REAL','Ana Claudia', 'Feminino',465, 'Atlas', 49.9, 'RJ', 2009),
	  ('SQL para leigos', 'João Nunes', 'Masculino', 450,'Addison', 98, 'SP', 2018),
	  ('Receitas Caseiras', 'Celia Tavares', 'Feminino', 210,'Atlas', 45, 'RJ', 2008),
	  ('Pessoas Efetivas', 'Eduardo Santos', 'Masculino', 390, 'Beta', 78.99, 'RJ', 2018),
	  ('Habitos Saudáveis', 'Eduardo Santos', 'Masculino', 630, 'Beta', 150.98, 'RJ', 2019),
	  ('A Casa Marrom','Hermes Macedo', 'Masculino', 250, 'Bubba', 60, 'MG', 2016),
	  ('Estacio Querido', 'Geraldo Francisco', 'Masculino', 310, 'Insignia',100, 'ES', 2015),
	  ('Pra sempre amigas', 'Leda Silva', 'Feminino', 510, 'Insignia', 78.98, 'ES',2011),
	  ('Copas Inesqueciveis', 'Marco Alcantara', 'Masculino', 200, 'Larson', 130.98, 'RS', 2018),
	  ('O poder da mente', 'Clara Mafra', 'Feminino', 120, 'Continental', 56.58, 'SP', 2017);



/*1 – Trazer todos os dados.*/
SELECT *FROM LIVROS;

/*2 – Trazer o nome do livro e o nome da editora*/
SELECT NOME_DO_LIVRO, NOME_DA_EDITORA FROM LIVROS;

/*3 – Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino.*/
SELECT NOME_DO_LIVRO, ESTADO_DA_EDITORA FROM LIVROS WHERE SEXO_DO_AUTOR = 'Masculino';

/*4 - Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino.*/
SELECT NOME_DO_LIVRO, NUMERO_DE_PÁGINAS FROM LIVROS WHERE SEXO_DO_AUTOR = 'Feminino';

/*5 – Trazer os valores dos livros das editoras de São Paulo.*/
SELECT VALOR_DO_LIVRO FROM LIVROS WHERE ESTADO_DA_EDITORA = 'SP';

/*6 – Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio).*/

SELECT NOME_DO_AUTOR, SEXO_DO_AUTOR, ESTADO_DA_EDITORA 
FROM LIVROS 
WHERE SEXO_DO_AUTOR = 'Masculino' 
AND ESTADO_DA_EDITORA = 'RJ' AND ESTADO_DA_EDITORA='SP';

/* VAI DAR ERRADO */

SELECT NOME_DO_AUTOR, SEXO_DO_AUTOR, ESTADO_DA_EDITORA 
FROM LIVROS 
WHERE SEXO_DO_AUTOR = 'Masculino' 
AND (ESTADO_DA_EDITORA = 'RJ' OR ESTADO_DA_EDITORA='SP');






























