CREATE DATABASE bdConfeitariaSonho
GO
USE bdConfeitariaSonho

CREATE TABLE tbCliente (
	codCliente INT PRIMARY KEY IDENTITY (1,1) 
	,nomeCliente VARCHAR (50)
	,dataNascCliente DATE 
	,ruaCliente VARCHAR (50)
	,numCasaCliente INT
	,cepCliente CHAR (10)
	,bairroCliente VARCHAR (50)
	,cidadeCliente VARCHAR (20)
	,estadoCliente VARCHAR (20)
	,cpfCliente CHAR(14)
	,sexoCliente CHAR (10)
)
CREATE TABLE tbCategoriaProduto(
	codCategoriaProduto INT PRIMARY KEY IDENTITY (1,1) 
	,nomeCategoriaProduto VARCHAR (50)
)
CREATE TABLE tbProduto(
	codProduto INT PRIMARY KEY IDENTITY (1,1) 
	,nomeProduto VARCHAR (50)
	,precoKiloProduto MONEY 
	,codCategoriaProduto INT FOREIGN KEY REFERENCES tbCategoriaProduto(codCategoriaProduto)
)
CREATE TABLE tbEncomenda(
	codEncomenda INT PRIMARY KEY IDENTITY (1,1)
	,dataEncomenda DATE
	,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
	,valorTotalEncomenda MONEY
	,dataEntregaEncomenda DATE
)
CREATE TABLE tbItensEncomenda(
	codItensEncomenda INT PRIMARY KEY IDENTITY (1,1)
	,codEncomenda INT FOREIGN KEY REFERENCES tbEncomenda(codEncomenda)
	,codProduto INT FOREIGN KEY REFERENCES tbProduto (codProduto)
	,quantidadeKilos DECIMAL
	,subTotal SMALLINT
)

--DROP DATABASE bdConfeitariaSonho