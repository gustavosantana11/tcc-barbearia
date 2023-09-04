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

INSERT INTO Barbeiro VALUES ('Aquiles','11927523144','donking01@gmail.com','12345','05/06/2005','Barbeiro',NULL)
GO
INSERT INTO Barbeiro VALUES('Kaiky','11921784596','donking02@gmail.com','54321',NULL,'ADM',NULL)
GO


INSERT INTO Cliente VALUES ('Jhonata dos Santos','11921946670','jhow_cli@gmail.com','jhow_123','01/05/2005',NULL)
GO
INSERT INTO Cliente VALUES('Gustavo dos Santos','11921946671','guxta_cli@hotmail.com','guxta_123',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Guilherme Rosendo','11921946472','guilherme_cli@gmail.com','gui_123','08/03/2004',NULL)
GO
INSERT INTO Cliente VALUES('Gabriel Felisdoro','11921946573','gabriel@hotmail.com','gab123',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Pedro Almeida','11921946676','pedrao123@gmail.com','pdr123',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Vinicius Moises','11921946674','vinimoises@hotmail.com','vini321','25/06/2001',NULL)
GO
INSERT INTO Cliente VALUES('Rafael Pinto','11921946680','rafaelpinto@gmail.com','rpinto123','24/07/1988',NULL)
GO
INSERT INTO Cliente VALUES('Cristiano Ronaldo','11921945027','cr7@hotmail.com','ccr7rei',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Marcio Silva','11921945029','marciosilva@gmail.com','marcio321','30/04/1999',NULL)
GO
INSERT INTO Cliente VALUES('Ordinael Zurc','11921945030','ordinaelzurc@hotmail.com','ordi123',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Marcos Santos','11921945033','marcossantos@hotmail.com','marcao123','14/03/2003',NULL)
GO
INSERT INTO Cliente VALUES('Fernando Jose','11921945036','fjose@hotmail.com','fernando123',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Malaquias Junior','11921945037','malaquiasjunior@gmail.com','malaquias123','17/09/1978',NULL)
GO
INSERT INTO Cliente VALUES('Bruno Costa','11921945038','bruninho@hotmail.com','bruno123','12/01/2000',NULL)
GO
INSERT INTO Cliente VALUES('Jose Alves','11921945039','josealves@gmail.com','jose123',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Lucas Nogueira','11933315811','lucasnog@gmail.com','lucaslindo',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Kaiky Silva','11984354358','kaikaosilva@gmail.com','kaikysilva123',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Guilherme Bruno','11984354359','gbrunao@gmail.com','guilhermebruno66',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Gustavo Souza','11933315812','gustavaosouza@gmail.com','gustavos',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Andre Costa','11933315813','andrecosta@gmail.com','andrecosta88',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Ademar Silva','11937315815','ademarsilva@hotmail.com','ademarsilva55',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Yuri Santos','11937315817','yurisantos@gmail.com','yurisantos53',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Hugo Gabriel','11937315816','hugogabriel@gmail.com','157hugo',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Julio Almeida','11937315417','julioalmeida@hotmail.com','julioalmeida',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Leandro Geraldo','11937315418','leandrogeraldo@gmail.com','leandrog684',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Ismael Gonzaga','11937315419','ismaelgonzaga@gmail.com','ismael157',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Richard Farias','11937315420','richardfarias@hotmail.com','richardquim',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Emidio Pires','11937315421','emidiopires@hotmail.com','emidiozera100',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Carlos Rocha','11937315422','carlosrocba@gmail.com','carlosr23',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Cristiano Santos','11937315423','cristiano7santos@hotmail.com','cristianos66',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Kauan Jesus','11937315424','kjesus@gmail.com','kaunzada67854',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Alan Jesus','11937315425','alanjesusempreendedor@gmail.com','alanj123',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Iran Jose','11937315426','iranluva@gmail.com','iranreceba',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Fabiano Chaves','11937315427','fchaves@gmail.com','fchaves53',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Jailson Mendes','11937315428','jailsonmendes@hotmail.com','jailsonmendes200',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Astolfo Miguel','11937315429','astolfom@hotmail.com','astolfeira',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Miguel Mendes','11924030785','mmendes@hotmail.com','astolfeira',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Arthur Costa','11924030770','arthurcosta@hotmail.com','astolfeira',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Bruno Silva','11924030786','brunosilva@hotmail.com','astolfeira',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Breno Lopes','11924030787','brenolopes19@gmail.com','astolfeira',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Jhonata Rocha','11924030788','jhonatar@gmail.com','astolfeira',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Jhon Santos','11924030089','jhonjhon@gmail.com','astolfeira',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Vinicius Almeida','11924050478','vinialmeida@gmail.com','astolfeira',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Gustavo Brito','11924050471','gbrito@hotmail.com','astolfeira',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Paulo Plinio','11924050472','pauloplinio150@gmail.com','astolfeira',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Gerson Mendes','11924050473','gersonmendes@hotmail.com','astolfeira',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Osvaldo Veiga','11924050474','oveiga20@hotmail.com','astolfeira',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Rafael Henrique ','11924050475','rafaelmarques@gmail.com','astolfeira',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Pedro Henrique','11924050499','pedrohenrique66@hotmail.com','astolfeira',NULL,NULL)
GO
INSERT INTO Cliente VALUES('Vitor Guedes','11924050490','vitorguedes50@gmail.com','astolfeira',NULL,NULL)
GO


INSERT INTO Forma_Pagamento VALUES('DINHEIRO')
GO
INSERT INTO Forma_Pagamento VALUES('CARTÃO')
GO
INSERT INTO Forma_Pagamento VALUES('PIX')
GO

INSERT INTO Contato_Barbeiro VALUES('11927523144', 'TELEFONE', '1')
GO
INSERT INTO Contato_Barbeiro VALUES('11921784596', 'TELEFONE', '2')
GO



INSERT INTO Contato_Cliente VALUES('11921946670', 'TELEFONE', '10')
GO
INSERT INTO Contato_Cliente VALUES('11921946671', 'TELEFONE', '11')
GO
INSERT INTO Contato_Cliente VALUES('11921946472', 'TELEFONE', '12')
GO
INSERT INTO Contato_Cliente VALUES('11921946573', 'TELEFONE', '13')
GO
INSERT INTO Contato_Cliente VALUES('11921946676', 'TELEFONE', '14')
GO
INSERT INTO Contato_Cliente VALUES('11921946674', 'TELEFONE', '15')
GO
INSERT INTO Contato_Cliente VALUES('11921946680', 'TELEFONE', '16')
GO
INSERT INTO Contato_Cliente VALUES('11921945027', 'TELEFONE', '17')
GO
INSERT INTO Contato_Cliente VALUES('11921945029', 'TELEFONE', '18')
GO
INSERT INTO Contato_Cliente VALUES('11921945030', 'TELEFONE', '19')
GO
INSERT INTO Contato_Cliente VALUES('11921945033', 'TELEFONE', '20')
GO
INSERT INTO Contato_Cliente VALUES('11921945036', 'TELEFONE', '21')
GO
INSERT INTO Contato_Cliente VALUES('11921945037', 'TELEFONE', '22')
GO
INSERT INTO Contato_Cliente VALUES('11921945038', 'TELEFONE', '23')
GO
INSERT INTO Contato_Cliente VALUES('11921945039', 'TELEFONE', '24')
GO
INSERT INTO Contato_Cliente VALUES('11933315811', 'TELEFONE', '25')
GO
INSERT INTO Contato_Cliente VALUES('11984354358', 'TELEFONE', '26')
GO
INSERT INTO Contato_Cliente VALUES('11984354359', 'TELEFONE', '27')
GO
INSERT INTO Contato_Cliente VALUES('11933315812', 'TELEFONE', '28')
GO
INSERT INTO Contato_Cliente VALUES('11933315813', 'TELEFONE', '29')
GO
INSERT INTO Contato_Cliente VALUES('11937315815', 'TELEFONE', '30')
GO
INSERT INTO Contato_Cliente VALUES('11937315817', 'TELEFONE', '31')
GO
INSERT INTO Contato_Cliente VALUES('11937315816', 'TELEFONE', '32')
GO
INSERT INTO Contato_Cliente VALUES('11937315417', 'TELEFONE', '33')
GO
INSERT INTO Contato_Cliente VALUES('11937315418', 'TELEFONE', '34')
GO
INSERT INTO Contato_Cliente VALUES('11937315419', 'TELEFONE', '35')
GO
INSERT INTO Contato_Cliente VALUES('11937315420', 'TELEFONE', '36')
GO
INSERT INTO Contato_Cliente VALUES('11937315421', 'TELEFONE', '37')
GO
INSERT INTO Contato_Cliente VALUES('11937315422', 'TELEFONE', '38')
GO
INSERT INTO Contato_Cliente VALUES('11937315423', 'TELEFONE', '39')
GO
INSERT INTO Contato_Cliente VALUES('11937315424', 'TELEFONE', '40')
GO
INSERT INTO Contato_Cliente VALUES('11937315425', 'TELEFONE', '41')
GO
INSERT INTO Contato_Cliente VALUES('11937315426', 'TELEFONE', '42')
GO
INSERT INTO Contato_Cliente VALUES('11937315427', 'TELEFONE', '43')
GO
INSERT INTO Contato_Cliente VALUES('11937315428', 'TELEFONE', '44')
GO
INSERT INTO Contato_Cliente VALUES('11937315429', 'TELEFONE', '45')
GO
INSERT INTO Contato_Cliente VALUES('11924030785', 'TELEFONE', '46')
GO
INSERT INTO Contato_Cliente VALUES('11924030770', 'TELEFONE', '47')
GO
INSERT INTO Contato_Cliente VALUES('11924030786', 'TELEFONE', '48')
GO
INSERT INTO Contato_Cliente VALUES('11924030787', 'TELEFONE', '49')
GO
INSERT INTO Contato_Cliente VALUES('11924030788', 'TELEFONE', '50')
GO
INSERT INTO Contato_Cliente VALUES('11924030089', 'TELEFONE', '51')
GO
INSERT INTO Contato_Cliente VALUES('11924050478', 'TELEFONE', '52')
GO
INSERT INTO Contato_Cliente VALUES('11924050471', 'TELEFONE', '53')
GO
INSERT INTO Contato_Cliente VALUES('11924050472', 'TELEFONE', '54')
GO
INSERT INTO Contato_Cliente VALUES('11924050473', 'TELEFONE', '55')
GO
INSERT INTO Contato_Cliente VALUES('11924050474', 'TELEFONE', '56')
GO
INSERT INTO Contato_Cliente VALUES('11924050475', 'TELEFONE', '57')
GO
INSERT INTO Contato_Cliente VALUES('11924050499', 'TELEFONE', '58')
GO
INSERT INTO Contato_Cliente VALUES('11924050490', 'TELEFONE', '59')
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
