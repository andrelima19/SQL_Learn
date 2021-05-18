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