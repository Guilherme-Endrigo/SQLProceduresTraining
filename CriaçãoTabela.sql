CREATE DATABASE LETSCARROS

USE LETSCARROS

CREATE TABLE FORMULARIO_CONTATO
(
	IdContato int IDENTITY PRIMARY KEY,
	IdModeloCarro int NOT NULL,
	NomeCompleto varchar (60) NOT NULL,
	EmailContato varchar(256) NOT NULL,
	TelefoneContato bigint NOT NULL,
	MensagemContato varchar(500) NOT NULL
)

ALTER TABLE FORMULARIO_CONTATO
	ADD CONSTRAINT FK_Modelo_Carro 
	FOREIGN KEY (IdModeloCarro) 
	REFERENCES CARRO(IdCarro)


CREATE TABLE CARRO
(
	IdCarro int IDENTITY PRIMARY KEY,
	IdConcessionariaCarro int NOT NULL,
	IdMarcaCarro int NOT NULL,
	ModeloCarro varchar (60) NOT NULL,
	DataCarro int NOT NULL,
	AdicionaisCarro varchar(150) NOT NULL
)

--CHAVES ESTRANGEIRAS

--CHAVE ENDEREÇO CARRO
ALTER TABLE CARRO
	ADD CONSTRAINT FK_Origem_Carro 
	FOREIGN KEY (IdConcessionariaCarro) 
	REFERENCES CONCESSIONARIA(IdConcessionaria)


CREATE TABLE CONCESSIONARIA
(
	IdConcessionaria int IDENTITY PRIMARY KEY,
	CNPJ bigint NOT NULL,
	NomeConcessionaria varchar (60) NOT NULL,
	EnderecoConcessionaria varchar(60) NOT NULL,
)

CREATE TABLE PAGAMENTO
(
	IdPagamento int IDENTITY PRIMARY KEY,
	DesPagamento varchar(25) NOT NULL
)

CREATE TABLE USUARIO
(
	IdCliente int IDENTITY PRIMARY KEY,
	NomeCompletoCliente varchar (60) NOT NULL,
	EmailCliente varchar(256) NOT NULL,
	TelefoneCliente bigint NOT NULL,
	idadeCliente int NOT NULL
)

ALTER TABLE USUARIO
	ADD CHECK (idadeCliente >= 18)


CREATE TABLE FAVORITOS
(
	IdFavoritado int IDENTITY PRIMARY KEY,
	IdCliente int NOT NULL,
	IdCarro int NOT NULL
)

--CHAVES FK
--CHAVE_USUARIO
ALTER TABLE FAVORITOS
	ADD CONSTRAINT FK_Cliente_Favoritos 
	FOREIGN KEY (IdCliente) 
	REFERENCES USUARIO(IdCliente)

--CHAVE_CARRO
ALTER TABLE FAVORITOS
	ADD CONSTRAINT FK_Carro_Favoritado 
	FOREIGN KEY (IdCarro) 
	REFERENCES CARRO(IdCarro)
	


CREATE TABLE VENDA
(
	IdContrato int IDENTITY PRIMARY KEY,
	IdCliente int NOT NULL,
	IdCarro int NOT NULL,
	IdFormaDePagamento int NOT NULL,
	ValorVenda bigint NOT NULL,
	DataVenda DATE NOT NULL 
)


--CHAVES FK

--CHAVE_USUARIO
ALTER TABLE VENDA
	ADD CONSTRAINT FK_Cliente_Compra 
	FOREIGN KEY (IdCliente) 
	REFERENCES USUARIO(IdCliente)

--CHAVE_CARRO
ALTER TABLE VENDA
	ADD CONSTRAINT FK_Carro_Comprado 
	FOREIGN KEY (IdCarro) 
	REFERENCES CARRO(IdCarro)

--CHAVE_PAGAMENTO
ALTER TABLE VENDA
	ADD CONSTRAINT FK_Forma_Compra 
	FOREIGN KEY (IdFormaDePagamento) 
	REFERENCES PAGAMENTO(IdPagamento)
