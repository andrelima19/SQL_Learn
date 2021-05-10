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







