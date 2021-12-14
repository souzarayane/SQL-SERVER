CREATE TABLE Produtos(
	Codigo				int				NOT NULL,
	Descricao			varchar(50)		NOT NULL,
	Data_Validade		datetime,
	EAN					varchar(15)		NOT NULL,
	Ind_Inativo			int				NOT NULL DEFAULT 0
)

ALTER TABLE Produtos
	ADD CONSTRAINT PK_Produtos
		PRIMARY KEY (Codigo);

CREATE INDEX IDX_Produtos_EAN
	ON Produtos(EAN);

INSERT INTO Produtos VALUES (1, 'Descricao do produto', GETDATE(), '1234567890', 0);
INSERT INTO Produtos VALUES (2, 'Nome do produto', GETDATE(), '32165498970', 0);

SELECT * FROM Produtos; 

SELECT *
	FROM Produtos
		WHERE Descricao LIKE '%Produto'

CREATE TABLE Lojas(
	Codigo			Int				NOT NULL,
	Nome			varchar(50)		NOT NULL,
	IND_Inativo		Int				NOT NULL DEFAULT 0,
	CONSTRAINT Lojas_PK PRIMARY KEY(Codigo)
)

INSERT INTO Lojas(Codigo, Nome) VALUES (1000, 'Filial Nova Iguaçú');
INSERT INTO Lojas(Codigo, Nome) VALUES (2000, 'Filial São Paulo');
INSERT INTO Lojas(Codigo, Nome) VALUES (3000, 'Filial Recife');

SELECT * FROM Lojas;

USE DIO

SELECT Codigo, Nome FROM Loja WHERE IND_Inativo = 0

CREATE TABLE Estoque(
	Codigo_Produto		int			NOT NULL,
	Codigo_Filial		int			NOT NULL,
	Quantidade			Decimal		NOT NULL DEFAULT 0,
	CONSTRAINT Estoque_PK PRIMARY KEY(Codigo_Produto, Codigo_Filial)
);

INSERT INTO Estoque(Codigo_Produto, Codigo_Filial, Quantidade) VALUES (1, 1000, 10);

SELECT * FROM Estoque;

DELETE FROM Estoque

ALTER TABLE Estoque 
	ADD CONSTRAINT FK_Estoque_Produtos
	FOREIGN KEY		(Codigo_Produto)
	REFERENCES		Produtos(Codigo)

ALTER TABLE Estoque
	ADD CONSTRAINT FK_Estoque_Lojas
	FOREIGN KEY		(Codigo_Filial)
	REFERENCES		Lojas(Codigo)

DROP Table Loja

DELETE FROM Estoque

ALTER TABLE Estoque
	DROP CONSTRAINT FK_Estoque_Lojas

SELECT * FROM Estoque E INNER JOIN Lojas J ON E.Codigo_Filial = J.Codigo