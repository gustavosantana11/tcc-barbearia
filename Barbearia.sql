USE MASTER IF EXISTS(SELECT * FROM SYS.databases WHERE NAME = 'bdBarbearia')
DROP DATABASE bdBarbearia
GO

CREATE DATABASE bdBarbearia
GO

USE bdBarbearia
GO

-- CRIAR UMA NOVA TABELA

CREATE TABLE Barbeiro
(
	 -- IDENTITY: campo auto numérico
	ID INT IDENTITY,
	NOME        VARCHAR(100) NOT NULL,
	TELEFONE	VARCHAR(11)NOT NULL,
	EMAIL	    VARCHAR(100)NULL,
	SENHA		VARCHAR(50)NOT NULL,
	dataNasc    date NULL,
	nivelAcesso VARCHAR(10)NOT NULL,
	FOTO		VARBINARY(max) NULL,

	-- PRIMARY KEY: chave primária
	PRIMARY KEY(ID)
)
GO

CREATE TABLE Cliente
(
	ID INT IDENTITY (10, 1),
	NOME        VARCHAR(100) NOT NULL,
	TELEFONE	VARCHAR(11)NOT NULL,
	EMAIL	    VARCHAR(100)NULL,
	SENHA		VARCHAR(50)NOT NULL,
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
	STATUS       BIT NOT NULL,
	
	-- PRIMARY KEY: chave primária
	PRIMARY KEY (ID)
)
GO

CREATE TABLE Disponibilidade_Barbeiro
(
  ID		  INT IDENTITY,
  OBSERVACAO  VARCHAR(100) NOT NULL,
  TEMPO_FORA    TIME,
  BARBEIRO_ID   INT,
  
  PRIMARY KEY(ID),
  FOREIGN KEY(BARBEIRO_ID) REFERENCES Barbeiro(id) 


)

CREATE TABLE Contato_Cliente
(
 ID           INT IDENTITY,
 CONTATO      VARCHAR (50) NOT NULL,
 TIPO_CONTATO VARCHAR (50) NOT NULL,
 CLIENTE_ID   INT NOT NULL,

   PRIMARY KEY (ID),
   FOREIGN KEY (CLIENTE_ID) REFERENCES Cliente(ID)
   
)
GO

CREATE TABLE Contato_Barbeiro
(
 ID          INT IDENTITY,
 CONTATO     VARCHAR (50) NOT NULL,
 TIPO_CONTADO VARCHAR (50) NOT NULL,
 BARBEIRO_ID INT NOT NULL,

   PRIMARY KEY (ID),
   FOREIGN KEY (BARBEIRO_ID) REFERENCES Barbeiro(ID)
   
)
GO

CREATE TABLE Agendamento
(
     ID			    	INT IDENTITY,
	 CLIENTE_ID	     	INT NOT NULL,
	 BARBEIRO_ID    	INT NOT NULL,
	 DATA_AGENDAMENTO	DATE NOT NULL,
	 HORA_AGENDAMENTO	TIME (0) NOT NULL,
	 STATUS			    INT NOT NULL,
	 TEMPO_SERVICO    TIME (0) NOT NULL,
	 SERVICO_ID		    INT NOT NULL,
	 
	 
	 PRIMARY KEY (ID),
	 FOREIGN KEY (SERVICO_ID) REFERENCES Servico(ID),
	 FOREIGN KEY (CLIENTE_ID) REFERENCES Cliente(ID),
	 FOREIGN KEY (BARBEIRO_ID) REFERENCES Barbeiro(ID)
)
GO


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
  CLIENTE_ID         INT NOT NULL,
  VALOR_PAGO		 DECIMAL (8,2) null,

  PRIMARY KEY (ID),
  foreign key (FORMA_PAGAMENTO_ID) references Forma_Pagamento(ID),
  foreign key (SERVICO_ID) references Servico(ID),
  FOREIGN KEY (CLIENTE_ID) REFERENCES CLIENTE(ID)

)
GO

CREATE TABLE Checkin
(
	ID INT IDENTITY,
	DATA DATE NOT NULL,
	HORA TIME NOT NULL,
	PRESENCA INT NOT NULL,
	AGENDAMENTO_ID INT NOT NULL,

	PRIMARY KEY(ID),
	FOREIGN KEY (AGENDAMENTO_ID) REFERENCES Agendamento(ID) 
)
GO

INSERT INTO Servico VALUES ('Corte','Corte na Máquina e Navalha','30min','25','')
GO
INSERT INTO Servico VALUES ('Barba','Barba na Máquina e Navalha','15min','15','')
GO
INSERT INTO Servico VALUES ('Sobrancelha','Sobrancelha na Navalha','10min','5','')
GO

INSERT INTO Barbeiro VALUES ('Aquiles','1121326196','12345','donking01@gmail.com',NULL,'Barbeiro',NULL)
GO
INSERT INTO Barbeiro VALUES('Kaiky','152754985','54321','donking02@gmail.com',NULL,'ADM',NULL)
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

INSERT INTO Contato_Barbeiro VALUES('11-21326196', 'TELEFONE', '1')
GO
INSERT INTO Contato_Barbeiro VALUES('15-2754985', 'TELEFONE', '2')
GO

INSERT INTO Contato_Cliente VALUES('11-812345677', 'TELEFONE', '10')
GO
INSERT INTO Contato_Cliente VALUES('15-27549856', 'TELEFONE', '11')
GO


INSERT INTO Agendamento VALUES (10, 1, GETDATE(), '10:45', 0, '00:30:00', 1)
GO
INSERT INTO Agendamento VALUES (11, 2, GETDATE(), '15:30', 0, '00:15:00', 2)
GO
INSERT INTO Agendamento VALUES (12, 1, GETDATE(), '18:00', 0, '00:10:00', 3)
GO

INSERT INTO Pagamento_Barbearia VALUES (1, 1, 10, 25)
GO
INSERT INTO Pagamento_Barbearia VALUES (2, 2, 11, 15)
GO
INSERT INTO Pagamento_Barbearia VALUES (1, 3, 12, 5)
GO



SELECT * FROM Servico
SELECT * FROM Barbeiro
SELECT * FROM Cliente
SELECT * FROM Contato_Barbeiro
SELECT * FROM Contato_Cliente
SELECT * FROM Agendamento
SELECT * FROM Forma_Pagamento
SELECT * FROM Pagamento_Barbearia
SELECT * FROM Checkin
