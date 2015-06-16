CREATE DATABASE TDI
USE TDI


-- -----------------------------------------------------
-- Table TipoQuarto
-- -----------------------------------------------------
DROP TABLE  TipoQuarto 
GO
CREATE TABLE TipoQuarto (
  idTipoQuarto INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  observacao VARCHAR(500) NULL,
  valor DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (idTipoQuarto))
GO
 alter table TipoQuarto add constraint pk_tipo_quarto primary key (idTipoQuarto)
 create index idx_descricao on TipoQuarto (descricao)
 GO
-- -----------------------------------------------------
-- Table Quarto
-- -----------------------------------------------------
DROP TABLE  Quarto 
GO
CREATE TABLE Quarto (
  idQuarto INT IDENTITY(1,1) NOT NULL,
  idTipoQuarto INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  capacidade INT NOT NULL,
  ativo BIT NOT NULL DEFAULT 1,
  status CHAR(1) CHECK (status in ('L','O','R','D')))
go
-- adicionando primary key
alter table Quarto add constraint pk_quarto 
primary key (idQuarto)
-- -------------------------------------------------------
-- adicionando foreign key
alter table Quarto 
add constraint fk_tipo_quarto 
foreign key (idTipoQuarto) 
references TipoQuarto (idTipoQuarto)

alter table Quarto 
add constraint fk_status_acessorio  
foreign key (idstatusacessorio) 
references  StatusAcessorio (idStatusAcessorio)
--  -------------------------------------------------------
-- criacao dos index
create index idx_fk_id_tipo_quarto on Quarto (idTipoQuarto )
create index idx_fk_status_acessorio on Quarto (idStatusAcessorio)
go

-- -----------------------------------------------------
-- Table Cargo
-- -----------------------------------------------------
DROP TABLE  Cargo 
GO
CREATE TABLE  Cargo (
  idCargo INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  observacao VARCHAR(45) NULL,
  ativo BIT NOT NULL DEFAULT 1)

go
alter table Cargo add constraint pk_cargo  primary key (idCargo)
go
 
-- -----------------------------------------------------
-- Table Pessoa
-- -----------------------------------------------------
DROP TABLE  Pessoa 
GO
CREATE TABLE Pessoa (
  idPessoa INT IDENTITY(1,1) NOT NULL,
  idCargo INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  cpfCnpj VARCHAR(14) NOT NULL,
  rg VARCHAR(14) NULL,
  dataNascimento DATE NOT NULL,
  estadoCivil VARCHAR(20) NULL,
  telefoneFixo VARCHAR(14) NULL,
  telefoneMovel VARCHAR(14) NULL,
  emailPimario VARCHAR(45) NULL,
  emailSecundario VARCHAR(45) NULL,
  salario DECIMAL(10,2) NOT NULL DEFAULT 788,
  bairro VARCHAR(45) NULL,
  cidade VARCHAR(45) NULL,
  rua VARCHAR(45) NULL,
  numero INT NULL,
  cep VARCHAR(9) NULL,
  dataCadastro DATETIME NOT NULL DEFAULT GETDATE(),
  ativo BIT NOT NULL DEFAULT 1,
  isFuncionario BIT NOT NULL)
  go
-- criando primary key
alter table Pessoa add constraint pk_pessoa primary key (idPessoa)

-- criando foreign key
alter table Pessoa 
add constraint fk_cargo 
foreign key (idCargo)
references   Cargo (idCargo)

-- craindo index
create index fk_idx_cargo on Pessoa (idCargo)

-- unique
alter table Pessoa add constraint uq_cpf_cpj unique (cpfCnpj)
go

-- -----------------------------------------------------
-- Table Usuario
-- -----------------------------------------------------
DROP TABLE  Usuario 
GO
CREATE TABLE Usuario (
  idUsuario INT IDENTITY(1,1) NOT NULL,
  idFuncionario INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  senha VARCHAR(45) NOT NULL,
  dataCadastro DATETIME NOT NULL,
  ativo BIT NOT NULL DEFAULT 1,
  nivelAcesso CHAR(1) CHECK(nivelAcesso IN ('A','M','B','L')))
GO
-- craindo primary key
alter table Usuario add constraint pk_usuario primary key (idUsuario)

-- craindo foreign key
alter table Usuario 
add constraint fk_funcionario
foreign key (idFuncionario)
references   Pessoa (idPessoa)

-- craindo index
create index fk_idx_funcionario on Usuario (idFuncionario)
create index idex_nivel_acesso on Usuario (nivelAcesso)

go

-- -----------------------------------------------------
-- Table PacoteHospedagem
-- -----------------------------------------------------
DROP TABLE  PacoteHospedagem 
go
CREATE TABLE PacoteHospedagem (
  idPacoteHospedagem INT IDENTITY(1,1) NOT NULL,
  valorTotal DECIMAL(10,2) ZEROFILL NOT NULL,
  subTotal DECIMAL(10,2) NOT NULL,
  observacao VARCHAR(45) NULL,
  dataLiberacao DATETIME NULL,
  dataEntrada DATE NOT NULL,
  dataSaida DATE NULL,
  dataCadastro DATETIME NOT NULL,
  ativo BIT NOT NULL DEFAULT 1,
  tipoPacote CHAR(1) CHECK(tipoPacote IN ('R','C','K')))
  GO
alter table PacoteHospedagem add constraint pk_pacote_hospedagem primary key (idPacoteHospedagem)
create index idx_tipo_pacote_hospedagem on PacoteHospedagem (tipoPacote)
GO
-- -----------------------------------------------------
-- Table Pendencia
-- -----------------------------------------------------
DROP TABLE  Pendencia 
GO
CREATE TABLE  Pendencia (
  idPendencia INT IDENTITY(1,1) NOT NULL,
  idPacoteHospedagem INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  dataPagamento DATETIME NULL,
  valorPendencia DECIMAL(10,2) NOT NULL,
  dataCadastro DATETIME NOT NULL,
  valorPago DECIMAL(10,2) NULL,
  status CHAR(1)  CHECK(status ('P','F','E','C')))
go

 alter table Pendencia add constraint pk_pendencia primary key (idPendencia)

 create index idx_fk_pacote_hospedagem on Pendencia (idPacoteHospedagem)
 create index idx_status_pendencia on Pendencia (status)

 alter table Pendencia 
 add constraint fk_pacote_hospedagem
 foreign key (idPacoteHospedagem)
 references   PacoteHospedagem (idPacoteHospedagem)


go

-- -----------------------------------------------------
-- Table FormaPagamento
-- -----------------------------------------------------
DROP TABLE  FormaPagamento 
go
CREATE TABLE FormaPagamento (
  idFormaPagamento INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  observacao VARCHAR(45) NULL,
  numeroMaximoParcela INT NOT NULL,
  ativo BIT NOT NULL DEFAULT 1)

go 
alter table FormaPagamento add constraint pk_forma_pagamento primary key (idFormaPagamento)
go

-- -----------------------------------------------------
-- Table Produto
-- -----------------------------------------------------
DROP TABLE  Produto 
go
CREATE TABLE Produto (
  idProduto INT IDENTITY(1,1) NOT NULL,
  tamanho DECIMAL(10,2) NOT NULL,
  quantidade INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  observacao VARCHAR(45) NULL,
  valor DECIMAL(10,2) NOT NULL)

 go
 alter table Produto add constraint pk_produto primary key (idProduto)
 go

-- -----------------------------------------------------
-- Table Hospedagem
-- -----------------------------------------------------
DROP TABLE  Hospedagem 

CREATE TABLE Hospedagem (
  idHospedagem INT IDENTITY(1,1) NOT NULL,
  idPacoteHospedagem INT NOT NULL,
  idQuarto INT NOT NULL,
  dataAbertura DATETIME NOT NULL,
  dataLliberacao DATETIME NULL,
  placaVeiculo VARCHAR(20) NULL,
  observacao VARCHAR(30) NULL,
  valorHospedagem DECIMAL(10,2) NOT NULL,
  aberto BIT NOT NULL DEFAULT 1)

go
 alter table Hospedagem add constraint pk_hospedagem primary key (idHospedagem)

create index idx_fk_pacote_hospedagem on Hospedagem (idPacotehosPedagem)
create index idx_fk_quarto on Hospedagem (idQuarto)

  alter table Hospedagem 
  add constraint fk_quarto_hospedagem
  foreign key (idPacoteHospedagem)
  references   PacoteHospedagem (idPacoteHospedagem)
  
  alter table Hospedagem 
  add constraint fk_quarto
  foreign key (idQuarto)
  references   Quarto (idQuarto)
  go

-- -----------------------------------------------------
-- Table Item
-- -----------------------------------------------------
DROP TABLE  Item 
go
CREATE TABLE Item (
  idItem INT IDENTITY(1,1) NOT NULL,
  idHospedagem INT NOT NULL,
  idProduto INT NOT NULL,
  quantidade INT NOT NULL,
  valorTotal DECIMAL(10,2) NOT NULL,
  dataCadastro DATETIME NOT NULL DEFAULT GETDATE(),
  cancelado BIT NOT NULL DEFAULT 0)
go
 alter table Item add constraint pk_item  primary key (iditem, idhospedagem)
 
 create index idx_fk_produto on Item (idProduto)
 create index idx_fk_hospedagem on Item (idHospedagem)

  alter table Item 
  add constraint fk_produto
  foreign key (idProduto)
  references   Produto (idProduto)
    
  alter table Item 
  add constraint fk_hospedagem
  foreign key (idHospedagem)
  references   Hospedagem (idHospedagem)
  go


-- -----------------------------------------------------
-- Table Servico
-- -----------------------------------------------------
DROP TABLE  Servico 
go
CREATE TABLE Servico (
  idServico INT IDENTITY(1,1) NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  observacao VARCHAR(45) NULL,
  valor DECIMAL(10,2) NOT NULL,
  ativo BIT NOT NULL DEFAULT 1)
go
 alter table Servico add constraint pk_servico primary key (idServico)
 go

-- -----------------------------------------------------
-- Table ControleServico
-- -----------------------------------------------------
DROP TABLE  ControleServico 
go
CREATE TABLE ControleServico (
  idHospedagem INT NOT NULL,
  idServico INT NOT NULL,
  idFuncionario INT NOT NULL,
  dataAbertura DATETIME NULL,
  dataLiberacao DATETIME NULL,
  dataCadastro DATETIME NOT NULL,
  cancelado BIT NOT NULL DEFAULT 0)
go
 create index idx_fk_hospedagem on ControleServico (idHospedagem )
 create index idx_fk_funcionario on ControleServico (idFuncionario )
 create index idx_fk_servico on ControleServico (idServico )
  
 alter table ControleServico 
 add constraint fk_hospedagemquarto
 foreign key (idHospedagem)
 references   Hospedagem (idHospedagem)
    
 alter table ControleServico 
 add constraint fk_Pessoa
 foreign key (idFuncionario)
 references   Pessoa (idPessoa)
 
 alter table ControleServico 
 add  constraint fk_servico
 foreign key (idServico)
 references   Servico (idServico)
 go 


-- -----------------------------------------------------
-- Table Pagamento
-- -----------------------------------------------------
DROP TABLE  Pagamento 
GO
CREATE TABLE Pagamento (
  numeroParcela INT IDENTITY(1,1) NOT NULL,
  idFormaPagamento INT NOT NULL,
  idPacoteHospedagem INT NOT NULL,
  dataCadastro DATETIME NOT NULL,
  dataPrevista DATETIME NOT NULL,
  dataPagamento DATETIME NULL,
  valorParcela DECIMAL(10,2) NOT NULL,
  status CHAR(1) CHECK(status in ('P','E','C')))
  
 go
 alter table  Pagamento add constraint pk_pagamento primary key (numeroParcela, idFormapagamento, idPacoteHospedagem)

 create index idx_fk_pacotehospedagem on Pagamento (idPacoteHospedagem )
 create index idx_fk_forma_pagamento on Pagamento (idFormaPagamento)
 create index idx_fk_status_pagamento on Pagamento (status )


alter table Pagamento 
add constraint fk_forma_pagamento
foreign key (idFormaPagamento)
references   FormaPagamento (idFormaPagamento)

alter table Pagamento 
add constraint fk_pacote_hospedagem
foreign key (idPacoteHospedagem)
references   PacoteHospedagem (idPacoteHospedagem)


go


-- -----------------------------------------------------
-- Table HistoricoAcesso
-- -----------------------------------------------------
DROP TABLE  HistoricoAcesso 
GO
CREATE TABLE HistoricoAcesso (
  idHistoricoAcesso INT IDENTITY(1,1) NOT NULL,
  idUsuario INT NOT NULL,
  idPacoteHospedagem INT NOT NULL,
  observacao VARCHAR(45) NOT NULL,
  dataCadastro DATETIME NOT NULL DEFAULT GETDATE())

 go
 alter table HistoricoAcesso add constraint pk_historico_acesso primary key (idHistoricoAcesso, idUsuario, idPacoteHospedagem)

create index idx_fk_pacote_hospedagem on HistoricoAcesso (idPacoteHospedagem)
create index fk_usuario  on HistoricoAcesso (idUsuario)


alter table HistoricoAcesso 
add constraint fk_usuario
foreign key (idUsuario)
references   Usuario (idUsuario)

alter table HistoricoAcesso 
add  constraint fk_pacote_hospedagem
foreign key (idPacoteHospedagem)
references   PacoteHospedagem (idPacoteHospedagem)
go    
-- ---

-- -----------------------------------------------------
-- Table ControleCliente
-- -----------------------------------------------------
DROP TABLE  ControleCliente 
GO
CREATE TABLE ControleCliente (
  idCliente INT NOT NULL,
  idHospedagem INT NOT NULL)
go
alter table ControleCliente add constraint pk_controle_cliente primary key (idHospedagem)

 create index idx_fk_hospedagem on ControleCliente (idHospedagem )
 create index idx_fkcliente on ControleCliente(idCliente )

 alter table ControleCliente 
 add constraint fk_hospedagem
    foreign key (idHospedagem)
    references   Hospedagem (idHospedagem)
    
  alter table ControleCliente 
 add constraint fk_cliente
    foreign key (idCliente)
    references   Pessoa (idPessoa)
 go   

-- -----------------------------------------------------
-- Table Historico
-- -----------------------------------------------------
DROP TABLE  Historico 

CREATE TABLE Historico (
  idHistorico INT IDENTITY(1,1) NOT NULL,
  idUsuario INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  observacao VARCHAR(70) NOT NULL,
  dataCadastro DATETIME NOT NULL DEFAULT GETDATE())

	go
alter table Historico add constraint pk_historico primary key (idHistorico)

create  index idx_fk_usuario on Historico (idUsuario )

alter table Historico 
add constraint fk_usuario
foreign key (idUsuario)
references   Usuario (idUsuario)