/* Modelagem Básica */

CLIENTE

NOME - CARACTER(30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDEREÇO - CARACTER(100)
SEXO - CARACTER(1)

/* PROCESSOS DE MODELAGEM */

/* FASE 01 E FASE 02 É FEITA PELO ADM DE DADOS */
MODELAGEM CONCEITUAL - RASCUNHO
MODELAGEM LÓGICA - QUALQUER PROGRAMA DE MODELAGEM

/* FASE 03 - DBA/AD */
MODELAGEM FÍSICA - SCRIPTS DE BANCO

/*Não se escreve diretamente um comando no mysql, usam-se editores de texto*/

/* INICIANDO A MODELAGEM FÍSICA  */
CREATE DATABASE PROJETO;

CREATE DATABASE EXEMPLO;

/* CONECTANDO-SE AO BANCO */
USE PROJETO;

/* CONECTANDO A TABELA DE CLIENTES */
CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	CPF INT(11),
	EMAIL VARCHAR(30),
	TELEFONE VARCHAR(30),
	ENDEREÇO VARCHAR(100),
	SEXO VARCHAR(1)
);


/* VERIFICANDO AS TABELAS DO BANCO */
SHOW TABLES;

/* DESCOBRINDO COMO É A ESTRUTURA DE UMA TABELA */

DESC CLIENTE;


/* Sintaxe básica de inserção - INSERT INTO TABELA */

/* FORMA 01 - OMITINDO AS COLUNAS */
/* Quando se omite as colunas é importante que os valores sejam inseridos na ordem correta
que aparecem na tabela */


INSERT INTO CLIENTE VALUES('JOAO', 988638273, NULL, '22923110', 'DOM HELDER CAMARA - ABOLICAO - RIO DE JANEIRO - RJ', 'M' );

INSERT INTO CLIENTE VALUES('MARIA', 988638273, 'MARIA@GMAIL.COM', '5643345343', ' BARATA RIBEIRO- COPACABANA - RIO DE JANEIRO - RJ', 'F' );

INSERT INTO CLIENTE VALUES('CELIA', NULL, 'CELIA@GMAIL.COM', '22923110', 'MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ', 'F' );

INSERT INTO CLIENTE VALUES('CATARINA', 988775643, 'CATARINA@UOL.COM', NULL, 'LAURA MARTINS - TIJUCA - RIO DE JANEIRO - RJ', 'F' );

INSERT INTO CLIENTE VALUES('CATARINA', 998232643, 'CATARINA.LOPES@UOL.COM', NULL, 'ALVARO RAMOS - BOTAFOGO - RIO DE JANEIRO - RJ', 'F' );


/* FORMA 02 - COLOCANDO AS COLUNAS */

INSERT INTO CLIENTE(NOME,SEXO,ENDEREÇO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);


/* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO CLIENTE VALUES('JOAO', 988638273, 'JOAO@GMAIL.COM', '22923110', 'MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ', 'M' ),
                          ( 'MARIA', 988638273, 'MARIA@GMAIL.COM', '22923110', 'MAIA LACERDA - ESTACIO - SÃO PAULO - SP', 'M');

/* */

/* O COMANDO SELECT
Seleção projeção e junção */

       
SELECT NOW();/* Exibir data e hora*/

/* O comando SHOW TABLES (Que só existe no mysql, é um ponteiramento do comando SELECT, ou seja, ele aponta para 
o comando padrão SELECT só que chama esse comando por esse nome: SHOW TABLES */
 

Utilizamos a projeção para exibir dados que existem e que NÃO EXISTEM numa tabela.
Ex: SELECT NOW();
SELECT NOW() as DATA_HORA; /* Construímos e exibimos as tabelas hora e a tabela data_hora. */

SELECT NOW() DATA_HORA, 'André Lima' as ALUNO;

/* ALIAS ou nome alternativo DE COLUNAS */

SELECT NOME, SEXO, EMAIL FROM CLIENTE; /* Exiba as colunas nome, sexo e email da tabela cliente*/

SELECT NOME as CLIENTE, SEXO, EMAIL FROM CLIENTE;
/* Exiba a coluna nome como sendo cliente, exiba a coluna sexo, etc */

SELECT NOME as CLIENTE, SEXO, EMAIL, ENDEREÇO FROM CLIENTE;

NÃO EXISTE UMA ORDEM DE PROJEÇÃO. VOCE EXIBE AS COLUNAS NA ORDEM QUE QUISER.
	   
SELECT * FROM CLIENTE;
/* Utilize esse comando apenas para fins acadêmicos uma vez que ele consome muitos recursos para exibição dos conteúdos no banco, 
trazendo dados desnecessários e excluíndo um recurso muito importante chamado ÍNDICE */

/* FILTRANDO DADOS COM WHERE E LIKE */

O filtro não funciona em termos de coluna, mas sim de linha


SELECT NOME, SEXO FROM CLIENTE WHERE SEXO = 'M';
/* Exiba na tela as colunas nome e sexo onde apenas o sexo 'm' será mostrado */

SELECT NOME, SEXO FROM CLIENTE WHERE ENDEREÇO = 'RJ'
Vai dar erro porque o endereço não é igual a 'RJ'

/* UTILIZANDO O LIKE */

SELECT NOME, SEXO FROM CLIENTE WHERE ENDEREÇO LIKE 'RJ';
Não iá funcionar

/* CARACTER CORINGA % -> QUALQUER COISA */

/* % NO INÍCIO*/
SELECT NOME, SEXO FROM CLIENTE WHERE ENDEREÇO LIKE '%RJ';
/* %RJ - O endereço começa com qualquer coisa e termina com 'RJ */

/* % NO FINAL*/
SELECT NOME, SEXO FROM CLIENTE WHERE ENDEREÇO LIKE 'MAIA LACERDA%';
/* %RJ - O endereço começa com endereço escolhido e termina com qualquer coisa*/


/* % NO MEIO*/
SELECT NOME, SEXO FROM CLIENTE WHERE ENDEREÇO LIKE '%ESTACIO%';
/* %RJ - O endereço começa com qulquer coisa,  insere-se o dado escolhido, e termina com qualquer coisa*/


/* OPERADORES LÓGICOS 
OR -> PARA QUE A SAIDA DA QUERY SEJA VERDADEIRA, BASTA QUE APENAS UMA CONDICAO SEJA VERDADEIRA.
AND -> PARA QUE A SAIDA SEJA VERDADEIRA TODAS AS CONDICOES PRECISAM SER VERDADEIRAS.
*/

/* OR - OU */



USE PROJETO;
SELECT *FROM CLIENTE;

SELECT NOME, SEXO, ENDEREÇO FROM CLIENTE
WHERE
SEXO = 'M' OR ENDEREÇO LIKE '%RJ';

SELECT NOME, SEXO, ENDEREÇO FROM CLIENTE
WHERE
SEXO = 'M' AND ENDEREÇO LIKE '%RJ';

SELECT NOME, SEXO, ENDEREÇO FROM CLIENTE
WHERE
SEXO = 'F' AND ENDEREÇO LIKE '%RJ';

/* COLOQUE OS STATEMENT SEMPRE NOS MESMOS PARENTESES. USAR OS PARENTESES
PARA PRIORIZAR OS STATEMENT  */


/*FUNÇÕES DE AGREGAÇÃO*/
/*COUNT - CONTA OS REGISTROS DE UMA TABELA*/
SELECT COUNT(*) FROM CLIENTE;

/*Utilizando um alias para ficar mais apresentável*/
SELECT COUNT(*) AS "Quantidade de registros da tabela cliente" FROM CLIENTE;


/* OPERADOR GROUP BY */
SELECT SEXO COUNT(*) FROM CLIENTE;


/* FILTRANDO VALORES NULOS */
-- ERRADO
SELECT NOME, SEXO, ENDEREÇO
FROM CLIENTE
WHERE CPF = NULL;


-- CERTO (Usando IS NULL)
SELECT NOME, SEXO, ENDEREÇO
FROM CLIENTE
WHERE CPF IS NULL;

-- CERTO (Usando IS NOT NULL)
SELECT NOME, SEXO, ENDEREÇO
FROM CLIENTE
WHERE CPF IS NOT NULL;

/* UTILIZANDO O UPDATE PARA ATUALIZAR VALORES */
SELECT NOME, EMAIL
FROM CLIENTE;

-- ERRADO
UPDATE CLIENTE
SET EMAIL = 'LILIAN@GMAIL.COM';

/* WHERE - VAI SER O SEU MELHOR AMIGO DA VIDA
PRA VIDA INTEIRA */

-- CERTO
UPDATE CLIENTE
SET EMAIL = 'JOÃO@UOL.COM'
WHERE NOME = 'JOAO';

UPDATE CLIENTE
SET EMAIL = 'MARIA@BOL.COM.BR'
WHERE NOME = 'MARIA';


/* DELETANDO REGISTROS COM A CLAUSULA DELETE */

DELETE FROM CLIENTE WHERE NOME ='CELIA';

-- DELETANDO REGISTROS PARECIDOS
-- USE OS OPERADORES LÓGICOS

SELECT *FROM CLIENTE
WHERE NOME = 'CATARINA'
AND EMAIL = 'CATARINA.LOPES@UOL.COM';

DELETE FROM CLIENTE
WHERE NOME = 'CATARINA'
AND EMAIL = 'CATARINA.LOPES@UOL.COM';






















