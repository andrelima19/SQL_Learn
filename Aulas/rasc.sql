CREATE TABLE exemplo(
	a int(3),

	b int(3),

	c int(3),

	d varchar(3)

);

INSERT INTO exemplo VALUES

(1, 2, 3, "p"),

(1, 2, 3, "p"),

(2, 3, 4, "q"),

(3, 4, 5, "r"),

(4, 5, 6, "s"),

(5, 6, 7, "t"),

(6, 7, 8, "u"),

(7, 8, 9, "v"),

(8, 9, 10, "x"),

(9, 10, 11, "z");

SELECT SUM(c)
FROM exemplo 
WHERE a>4;

SELECT COUNT(d)
FROM exemplo;

SELECT DISTINCT(d)
FROM exemplo;

SELECT COUNT(DISTINCT d)
FROM exemplo;

SELECT AVG(a)
FROM exemplo;



CREATE TABLE aluno (

id INT NOT NULL PRIMARY KEY,

nome CHAR(50) NOT NULL

);

CREATE TABLE curso (

id INT NOT NULL PRIMARY KEY,

nome CHAR(50) NOT NULL

);

CREATE TABLE nota (

aluno_id INT NOT NULL,

curso_id INT NOT NULL,

dataavaliacao DATE NOT NULL,

nota DOUBLE NOT NULL,

PRIMARY KEY(aluno_id, curso_id, dataavaliacao),

FOREIGN KEY (aluno_id) REFERENCES aluno(id),

FOREIGN KEY (curso_id) REFERENCES curso(id)

);