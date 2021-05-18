Considere o seguinte esquema relacional e responda às questões apresentando o respectivo SQL1:

Cliente( cod_cliente, cliente, profissao, localidade)
Agencia( cod_agencia, agencia, localidade)
Conta( num_conta, tipo_conta, cod_cliente, cod_agencia, saldo)
Emprestimo( num_emprestimo, cod_cliente, cod_agencia, valor)



CREATE DATABASE banco_cidade;
USE banco_cidade;

CREATE TABLE cliente(
	cod_cliente int Primary Key Auto_Increment,
	cliente varchar(30) Not Null,
	profissao varchar(30),
	localidade varchar(30) Not Null
);

CREATE TABLE agencia(
	cod_agencia int Primary Key Auto_Increment,
	agencia char(6) Not Null,
	localidade varchar(30) Not Null
);

CREATE TABLE conta(
	num_conta int Primary Key Auto_Increment,
	tipo_conta varchar(10),
	saldo float(10,2),
	cod_cliente_F int,
	cod_agencia_F int,

	foreign key (cod_cliente_F)
	references cliente(cod_cliente),

	foreign key (cod_agencia_F)
	references agencia(cod_agencia)
);

CREATE TABLE emprestimo(
	num_emprestimo int Primary Key Auto_Increment,
	valor float(10,2),
	cod_cliente_F int,
	cod_agencia_F int,

	foreign Key(cod_cliente_F)
	references cliente(cod_cliente),

	foreign Key(cod_agencia_F)
	references agencia(cod_agencia)

);

-- TABLE CLIENTE
INSERT INTO CLIENTE VALUES(null, 'João Almeida', 'Padeiro', 'Lapa');
INSERT INTO CLIENTE VALUES(null, 'Carlos Antonio', 'Professor', 'Centro');
INSERT INTO CLIENTE VALUES(null, 'Lucília de medeiros', 'Secretária', 'Pavuna');
INSERT INTO CLIENTE VALUES(null, 'Jessica Aguilar', 'Arquiteta', 'Copacabana');
INSERT INTO CLIENTE VALUES(null, 'Rubens de Moura Sobral', 'Eletricista', 'Gávea');
INSERT INTO CLIENTE VALUES(null, 'Carlos Silva', Null, 'Braga');
INSERT INTO CLIENTE VALUES(null, 'Ana Beatriz', 'Doméstica', 'Lisboa');
INSERT INTO CLIENTE VALUES(null, 'Suzana Fontes', 'Confeiteira', 'Lisboa');
INSERT INTO CLIENTE VALUES(null, 'Lilian Ribeiro', Null, 'Braga');

);

-- TABLE AGENCIA
INSERT INTO AGENCIA VALUES(null, '213', 'Lapa');
INSERT INTO AGENCIA VALUES(null, '113', 'Centro');
INSERT INTO AGENCIA VALUES(null, '002', 'Pavuna');
INSERT INTO AGENCIA VALUES(null, '233', 'Copacabana');
INSERT INTO AGENCIA VALUES(null, '089', 'Gávea');
INSERT INTO AGENCIA VALUES(null, '123', 'Braga');
INSERT INTO AGENCIA VALUES(null, '011', 'Lisboa');
INSERT INTO AGENCIA VALUES(null, '011', 'Lisboa');


+-------------+---------+------------+
| cod_agencia | agencia | localidade |
+-------------+---------+------------+
|           1 | 213     | Lapa       |
|           2 | 113     | Centro     |
|           3 | 002     | Pavuna     |
|           4 | 233     | Copacabana |
|           5 | 089     | Gávea      |
|           6 | 123     | Braga      |
|           7 | 011     | Lisboa     |
+-------------+---------+------------+

-- TABLE CONTA
INSERT INTO CONTA VALUES(null, 'Corrente', 1200.00);

ALTER TABLE CONTA 
MODIFY SALDO DECIMAL(10,2) Not Null;

INSERT INTO CONTA VALUES(null, 'Corrente', 1200.00, 1,1);
INSERT INTO CONTA VALUES(null, 'Corrente', 100.50, 2,2);
INSERT INTO CONTA VALUES(null, 'Corrente', 3000.23, 3,3);
INSERT INTO CONTA VALUES(null, 'Corrente', 40.00, 4,4);
INSERT INTO CONTA VALUES(null, 'Corrente', 500.000.00, 5,5);
INSERT INTO CONTA VALUES(null, 'Corrente', 4320.32, 6,6);
INSERT INTO CONTA VALUES(null, 'Corrente', 10.01, 7,7);
INSERT INTO CONTA VALUES(null, 'Corrente', 741.35, 8,8);
INSERT INTO CONTA VALUES(null, 'Corrente', 0.00, 9,9);


-- 1. Quais os clientes (cod_cliente e cliente) deste Banco?

SELECT cod_cliente, cliente FROM CLIENTE;
+-------------+------------------------+
| cod_cliente | cliente                |
+-------------+------------------------+
|           1 | João Almeida           |
|           2 | Carlos Antonio         |
|           3 | Lucília de medeiros    |
|           4 | Jessica Aguilar        |
|           5 | Rubens de Moura Sobral |
|           6 | Carlos Silva           |
|           7 | Ana Beatriz            |
|           8 | Suzana Fontes          |
|           9 | Lilian Ribeiro         |
+-------------+------------------------+

-- 2. Quais os clientes que residem em Braga?

SELECT cliente, localidade from CLIENTE
WHERE localidade = 'Braga';
+----------------+------------+
| cliente        | localidade |
+----------------+------------+
| Carlos Silva   | Braga      |
| Lilian Ribeiro | Braga      |
+----------------+------------+

-- 3. Quais os clientes (cod_cliente) com contas na agência cod_agencia = ‘123’?

-- 4. Quais os clientes que residem em localidades onde existem agências?

-- 5. Quais os clientes que residem na mesma localidade das agências onde possuem contas?

-- 6. Quais os clientes com empréstimos de valor superior a 2.500€ ?

-- 7. Quais os nomes dos clientes com a mesma profissão que o cliente com cod_cliente = ‘1234’?

-- 8. Listar as contas (num_conta, saldo) da agência cujo cod_agencia = ‘123’, por ordem decrescente do seu
-- valor de saldo.

-- 9. Quantas contas existem em todas as agências do Banco?

-- 10. Quantos clientes possuem contas na agência cujo cod_agencia = ‘123’?

-- 11. Listar o número de contas existentes em cada agência.

-- 12. Quais os clientes cuja profissão é desconhecida?

-- 13. Para cada agência (cod_agencia) com menos de 1000 contas, listar os valores máximo e mínimo dos
-- saldos dessas contas, assim como o saldo médio.

/*14. Quais os clientes (cod_cliente e cliente) da agência cod_agencia = ‘123’? (solução obtida pressupondo que
um cliente pode ter um empréstimo sem ter uma conta, pensamento errado na prática, contudo se assim não
for esta solução é igual à questão 3 deste mesmo exercicio)*/

/*15. Quais os clientes (cod_cliente e cliente) que são, simultaneamente, depositantes e devedores na agência
cujo cod_agencia = ‘123’? */

-- 16. Quais os clientes (cod_cliente e cliente) da agência com cod_agencia = ‘123’que apenas

-- 17. Quais os clientes (cod_cliente e cliente) com, pelo menos, um empréstimo no banco?

-- 18. Quais as agências (cod_agencia, agencia) com depositantes residentes em Lisboa?

-- 19. Quais os clientes cujo saldo total das suas contas é superior ao valor de qualquer empréstimo contraído
-- neste banco?











-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.
CREATE TABLE TELEFONE(																|		
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,										|	
	TIPO ENUM('RES', 'CEL', 'COM') NOT NULL,										|	
	NUMERO VARCHAR(10) NOT NULL,													|
	ID_CLIENTE INT,																	|
																					-			
																					|										
	-- O campo abaixo não é uma coluna, sim uma regra aplicada a coluna 'ID_CLIENTE'|
	FOREIGN KEY(ID_CLIENTE)															|
	-- QUEM É A SUA CHAVE ESTRANGEIRA? (FOREIGN KEY)								|	
	-- MINHA FOREIGN KEY É ID_CLIENTE.												|
																					|
	--O CAMPO ID_CLIENTE SE REFERE A QUAL TABELA?									|
	REFERENCES CLIENTE(IDCLIENTE)													|	
	--REFERENCES (SE REFERE) A TABELA (CLIENTE)										|
	-- A QUAL CAMPO DA TABELA CLIENTE (AO CAMPO IDCLIENTE)							|	
);																					|
-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-