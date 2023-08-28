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

INSERT INTO Barbeiro VALUES ('Aquiles','1121326196','donking01@gmail.com','12345','05/06/2005','Barbeiro',NULL)
GO
INSERT INTO Barbeiro VALUES('Kaiky','152754985','donking02@gmail.com','54321',NULL,'ADM',NULL)
GO

INSERT INTO Cliente VALUES ('Jhonata dos Santos','1121784596','jhow_cli@gmail.com','jhow_123','01/05/2005',NULL)
GO
INSERT INTO Cliente VALUES('Gustavo dos Santos','152036784','guxta_cli@hotmail.com','guxta_123',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Guilherme Rosendo','115254985','guilherme_cli@gmail.com','gui_123','08/03/2004',NULL)
GO
INSERT INTO Cliente VALUES('Gabriel Felisdoro','115254942','gabriel@hotmail.com','gab123',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Pedro Almeida','115254961','pedrao123@gmail.com','pdr123',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Vinicius Moises','115254984','vinimoises@hotmail.com','vini321','25/06/2001',NULL)
GO
INSERT INTO Cliente VALUES('Rafael Pinto','115254965','rafaelpinto@gmail.com','rpinto123','24/07/1988',NULL)
GO
INSERT INTO Cliente VALUES('Cristiano Ronaldo','115454985','cr7@hotmail.com','ccr7rei',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Marcio Silva','115654557','marciosilva@gmail.com','marcio321','30/04/1999',NULL)
GO
INSERT INTO Cliente VALUES('Ordinael Zurc','143254984','ordinaelzurc@hotmail.com','ordi123',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Marcos Santos','119843566','marcossantos@hotmail.com','marcao123','14/03/2003',NULL)
GO
INSERT INTO Cliente VALUES('Fernando Jose','114546465','fjose@hotmail.com','fernando123',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Malaquias Junior','119843234','malaquiasjunior@gmail.com','malaquias123','17/09/1978',NULL)
GO
INSERT INTO Cliente VALUES('Bruno Costa','119843437','bruninho@hotmail.com','bruno123','12/01/2000',NULL)
GO
INSERT INTO Cliente VALUES('Jose Alves','1198435435','josealves@gmail.com','jose123',NULL,NULL)
GO


INSERT INTO Forma_Pagamento VALUES('DINHEIRO')
GO
INSERT INTO Forma_Pagamento VALUES('CARTÃO')
GO
INSERT INTO Forma_Pagamento VALUES('PIX')
GO

INSERT INTO Contato_Barbeiro VALUES('11-21326196', 'TELEFONE', '1')
GO
INSERT INTO Contato_Barbeiro VALUES('15-2036784', 'TELEFONE', '2')
GO



INSERT INTO Contato_Cliente VALUES('11-812345677', 'TELEFONE', '10')
GO
INSERT INTO Contato_Cliente VALUES('15-27549856', 'TELEFONE', '11')
GO
INSERT INTO Contato_Cliente VALUES('11-5254985', 'TELEFONE', '12')
GO

INSERT INTO Contato_Cliente VALUES('11-5254985', 'TELEFONE', '13')
GO
INSERT INTO Contato_Cliente VALUES('11-5254942', 'TELEFONE', '14')
GO
INSERT INTO Contato_Cliente VALUES('11-5254961', 'TELEFONE', '15')
GO
INSERT INTO Contato_Cliente VALUES('11-5254984', 'TELEFONE', '16')
GO
INSERT INTO Contato_Cliente VALUES('11-5254965', 'TELEFONE', '17')
GO
INSERT INTO Contato_Cliente VALUES('11-5454985', 'TELEFONE', '18')
GO
INSERT INTO Contato_Cliente VALUES('11-5654557', 'TELEFONE', '19')
GO
INSERT INTO Contato_Cliente VALUES('14-3254984', 'TELEFONE', '20')
GO
INSERT INTO Contato_Cliente VALUES('11-9843566', 'TELEFONE', '21')
GO
INSERT INTO Contato_Cliente VALUES('11-4546465', 'TELEFONE', '22')
GO
INSERT INTO Contato_Cliente VALUES('11-9843234', 'TELEFONE', '23')
GO
INSERT INTO Contato_Cliente VALUES('11-9843437', 'TELEFONE', '24')
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
