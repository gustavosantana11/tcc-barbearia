USE MASTER IF EXISTS(SELECT * FROM SYS.databases WHERE NAME = 'bdBarbearia')
DROP DATABASE bdBarbearia
GO

CREATE DATABASE bdBarbearia
GO

USE bdBarbearia
GO

-- Destruir o banco de dados
   DROP DATABASE 
   

-- CRIAR UMA NOVA TABELA

CREATE TABLE Barbeiro
(
	 -- IDENTITY: campo auto numérico
	ID INT IDENTITY,
	NOME        VARCHAR(100) NOT NULL,
	TELEFONE	VARCHAR(11)NOT NULL,
	SENHA		VARCHAR(50)NOT NULL,
	EMAIL	    VARCHAR(100)NULL,
	dataNasc    date NULL,
	FOTO		VARBINARY(max) NULL,

	-- PRIMARY KEY: chave primária
	PRIMARY KEY(ID)
)
GO

CREATE TABLE Cliente
(
	ID INT IDENTITY,
	NOME        VARCHAR(100) NOT NULL,
	TELEFONE	VARCHAR(11)NOT NULL,
	SENHA		VARCHAR(50)NOT NULL,
	EMAIL	    VARCHAR(100)NULL,
	dataNasc    date NULL,
	FOTO		VARBINARY(max) NULL,

	PRIMARY KEY(ID)
)
GO

 CREATE TABLE Servico
(
    -- IDENTITY: campo auto numérico
	ID           INT IDENTITY,
	NOME_SERVICO VARCHAR(50) NOT NULL,
	DESCRICAO    VARCHAR(50) NULL,
	TEMPO        VARCHAR(30) NOT NULL,
	PRECO        DECIMAL(8,2) NOT NULL,
	STATUS       INT NOT NULL,
	
	-- PRIMARY KEY: chave primária
	PRIMARY KEY (ID)
)
GO

CREATE TABLE Contato_Cliente
(
 ID           INT IDENTITY,
 CONTATO      VARCHAR (50) NOT NULL,
 TIPO_CONTATO VARCHAR (50) NOT NULL,
 CLIENTE_ID   INT NOT NULL,

   PRIMARY KEY (ID),
   FOREIGN KEY (CLIENTE_ID) REFERENCES Cliente (ID)
   
)
GO

CREATE TABLE Contato_Barbeiro
(
 ID          INT IDENTITY,
 CONTATO     VARCHAR (50) NOT NULL,
 TIPO_CONTADO VARCHAR (50) NOT NULL,
 BARBEIRO_ID INT NOT NULL,

   PRIMARY KEY (ID),
   FOREIGN KEY (BARBEIRO_ID) REFERENCES Barbeiro (ID)
   
)
GO

CREATE TABLE Agenda
(
     ID				INT IDENTITY,
	 DATA_AGENDA	DATE NOT NULL,
	 HORA_AGENDA	TIME NOT NULL,
	 STATUS			INT NOT NULL,
	 SERVICO_ID		INT NOT NULL,
	 CLIENTE_ID		INT NOT NULL,
	 BARBEIRO_ID	INT NOT NULL,
	 
	 PRIMARY KEY (ID),
	 FOREIGN KEY (SERVICO_ID) REFERENCES Servico(ID),
	 FOREIGN KEY (CLIENTE_ID) REFERENCES Cliente(ID),
	 FOREIGN KEY (BARBEIRO_ID) REFERENCES Barbeiro(ID)
)
GO

/*CREATE TABLE Horario
(
	id INT IDENTITY,
	cliente_id INT NOT NULL,
	barbeiro_id INT NOT NULL,
	horaAgenda TIME NOT NULL,
	status INT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(cliente_id) REFERENCES Cliente(id),
	FOREIGN KEY(barbeiro_id) REFERENCES Barbeiro(id)
)
GO*/

CREATE TABLE Forma_Pagamento
(
	ID INT IDENTITY,
	FORMA_PAGAMENTO VARCHAR(50) NOT NULL,

	PRIMARY KEY (ID)

)
GO

CREATE TABLE Pagamento_Barbearia
(
  ID				 INT IDENTITY,
  FORMA_PAGAMENTO_ID INT not null,
  SERVICO_ID		 INT not null,
  VALOR_PAGO		 DECIMAL (8,2) null,

  PRIMARY KEY (ID),
  foreign key (FORMA_PAGAMENTO_ID) references Forma_Pagamento(ID),
  foreign key (SERVICO_ID) references Servico(ID)

)
GO

CREATE TABLE Checkin
(
	ID INT IDENTITY,
	DATA DATE NOT NULL,
	HORA TIME NOT NULL,
	PRESENCA INT NOT NULL,
	AGENDA_ID INT NOT NULL,

	PRIMARY KEY(ID),
	FOREIGN KEY (AGENDA_ID) REFERENCES Agenda(ID) 
)
GO

INSERT INTO Servico VALUES ('Corte','Corte na Máquina','30min','20','')
GO
INSERT INTO Servico VALUES ('Corte Navalhado','Corte na Navalha','50min','25','')
GO
INSERT INTO Servico VALUES ('Barba','Barba na Navalha','10min','20','')
GO
INSERT INTO Servico VALUES ('Somente Pezinho','Máquina e Navalha','15min','10','')
GO
INSERT INTO Servico VALUES ('Sobracelha','Navalha','5min','5','')
GO

INSERT INTO Barbeiro VALUES ('Aquiles','1121326196','barbeiro01','DONKiNG@BARBEARIA.COM.BR',NULL,NULL)
GO
INSERT INTO Barbeiro VALUES('Nogueira','152036985','barbeiro02','BarbeariaDK@barbeiro.com.br',NULL,NULL)
GO
INSERT INTO Barbeiro VALUES('Kaiky','152754985','barbeiro03','BarbeariaDK@hotmail.com',NULL,NULL)
GO

INSERT INTO Cliente VALUES ('Jhonata','1121784596','jhow123','jhow_cli@gmail.com',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Gustavo','152036784','guxta','guxta_cli@hotmail.com',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Guilherme','115254985','gui123','guilher_cli@gmail.com',NULL,NULL)
GO

INSERT INTO Forma_Pagamento VALUES('DINHEIRO')
GO
INSERT INTO Forma_Pagamento VALUES('CARTÃO')
GO
INSERT INTO Forma_Pagamento VALUES('PIX')
GO

SELECT * FROM Servico
SELECT * FROM Barbeiro
SELECT * FROM Cliente
SELECT * FROM Contato_Cliente
SELECT * FROM Agenda
SELECT * FROM Forma_Pagamento
SELECT * FROM Pagamento_Barbearia
SELECT * FROM Checkin
