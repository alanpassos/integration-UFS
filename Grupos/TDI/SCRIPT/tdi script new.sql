      
Drop database dbtdinewhotel
go
create database dbtdinewhotel
go
use dbtdinewhotel

 
-- -----------------------------------------------------
-- Table PacoteHospedagem
-- -----------------------------------------------------
DROP TABLE  PacoteHospedagem 
go
CREATE TABLE PacoteHospedagem (
  idPacoteHospedagem INT IDENTITY(1,1) NOT NULL,
  valorTotal NUMERIC(10,2) NOT NULL,
  subTotal NUMERIC(10,2) NOT NULL,
  observacao VARCHAR(45) NULL,
  dataLiberacao DATETIME NULL,
  dataEntrada DATE NOT NULL,
  dataSaida DATE NULL,
  dataCadastro DATETIME NOT NULL,
  ativo BIT NOT NULL DEFAULT 1,
  tipoPacote CHAR(1) CHECK(tipoPacote IN ('R','C','K')))
  GO
alter table PacoteHospedagem add constraint pk_pacote_hospedagem primary key (idPacoteHospedagem)
go
create index idx_tipo_pacote_hospedagem on PacoteHospedagem (tipoPacote)
GO
  -- -----------------------------------------------------
-- Table TipoQuarto
-- -----------------------------------------------------
DROP TABLE  TipoQuarto 
GO
CREATE TABLE TipoQuarto (
  idTipoQuarto INT IDENTITY(1,1) NOT NULL,  
  idPacoteHospedagem INT NULL,
  descricao VARCHAR(45) NOT NULL,
  observacao VARCHAR(500) NULL,
  valor NUMERIC(10,2) NOT NULL
  )
  
GO
 alter table TipoQuarto add constraint pk_tipo_quarto primary key (idTipoQuarto)
 go
 create index idx_descricao on TipoQuarto (descricao)
 GO
alter table TipoQuarto 
  add constraint fk_pacote_hospedagem_tipo_quarto
  foreign key (idPacoteHospedagem)
  references   PacoteHospedagem (idPacoteHospedagem)
  go

-- -----------------------------------------------------
-- Table Quarto
-- -----------------------------------------------------
DROP TABLE  Quarto 
GO
CREATE TABLE Quarto (
  idQuarto INT IDENTITY(1,1) NOT NULL,
  idTipoQuarto INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  observacao VARCHAR(100) NULL,
  capacidade INT NOT NULL,
  ativo BIT NOT NULL DEFAULT 1,
  reservado BIT NOT NULL DEFAULT 0,
  status CHAR(1) CHECK (status in ('L','O'))) -- livre, ocupado
go
-- adicionando primary key
alter table Quarto add constraint pk_quarto 
primary key (idQuarto)
go
-- -------------------------------------------------------
-- adicionando foreign key
alter table Quarto 
add constraint fk_tipo_quarto 
foreign key (idTipoQuarto) 
references TipoQuarto (idTipoQuarto)

go
--  -------------------------------------------------------
-- criacao dos index
create index idx_fk_id_tipo_quarto on Quarto (idTipoQuarto )

go

-- -----------------------------------------------------
-- Table Cargo
-- -----------------------------------------------------
DROP TABLE  Cargo 
GO
CREATE TABLE  Cargo (
  idCargo INT IDENTITY(1,1) NOT NULL,
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
  idCargo INT NULL,
  nome VARCHAR(45) NOT NULL,
  cpfCnpj VARCHAR(14) NOT NULL,
  rg VARCHAR(14) NULL,
  dataNascimento DATE NOT NULL,
  estadoCivil VARCHAR(20) NULL,
  sexo CHAR(1) NULL,
  telefoneFixo VARCHAR(14) NULL,
  telefoneMovel VARCHAR(14) NOT NULL,
  emailPimario VARCHAR(45) NULL,
  emailSecundario VARCHAR(45) NULL,
  salario NUMERIC(10,2) NULL ,
  estado char(2) NOT NULL,
  cidade VARCHAR(45) NOT NULL,
  bairro VARCHAR(45) NOT NULL,
  rua VARCHAR(45) NOT NULL,
  complemento VARCHAR(45) NULL,
  numero INT NOT NULL,
  cep VARCHAR(9) NOT NULL,
  dataCadastro DATETIME NOT NULL DEFAULT GETDATE(),
  ativo BIT NOT NULL DEFAULT 1,
  isFuncionario BIT NOT NULL)
  go
-- criando primary key
alter table Pessoa add constraint pk_pessoa primary key (idPessoa)
go
-- criando foreign key
alter table Pessoa 
add constraint fk_cargo 
foreign key (idCargo)
references   Cargo (idCargo)
go
-- craindo index
create index fk_idx_cargo on Pessoa (idCargo)
go
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
go
-- craindo foreign key
alter table Usuario 
add constraint fk_funcionario
foreign key (idFuncionario)
references   Pessoa (idPessoa)
go
-- craindo index
create index fk_idx_funcionario on Usuario (idFuncionario)
create index idex_nivel_acesso on Usuario (nivelAcesso)

go


-- -----------------------------------------------------
-- Table FormaPagamento
-- -----------------------------------------------------
DROP TABLE  FormaPagamento 
go
CREATE TABLE FormaPagamento (
  idFormaPagamento INT IDENTITY(10,10)NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  observacao VARCHAR(45) NULL,
  numeroMaximoParcela INT NOT NULL,
  tipo varchar(30) not null,
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
  tamanho NUMERIC(10,2) NOT NULL,
  quantidade INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  observacao VARCHAR(45) NULL,
  valor NUMERIC(10,2) NOT NULL)

 go
 alter table Produto add constraint pk_produto primary key (idProduto)
 go

-- -----------------------------------------------------
-- Table Hospedagem
-- -----------------------------------------------------
DROP TABLE  Hospedagem 
go
CREATE TABLE Hospedagem (
  idHospedagem INT IDENTITY(1,1) NOT NULL,
  idPacoteHospedagem INT NOT NULL,
  idQuarto INT NOT NULL,
  dataAbertura DATETIME NOT NULL,
  dataLiberacao DATETIME NULL,
  placaVeiculo VARCHAR(20) NULL,
  observacao VARCHAR(30) NULL,
  valorHospedagem NUMERIC(10,2) NOT NULL,
  aberto BIT NOT NULL DEFAULT 1)

go
 alter table Hospedagem add constraint pk_hospedagem primary key (idHospedagem)
 go
create index idx_fk_pacote_hospedagem on Hospedagem (idPacotehosPedagem)
create index idx_fk_quarto on Hospedagem (idQuarto)
go
  alter table Hospedagem 
  add constraint fk_pacote_hospedagem
  foreign key (idPacoteHospedagem)
  references   PacoteHospedagem (idPacoteHospedagem)
  go
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
  valorTotal NUMERIC(10,2) NOT NULL,
  dataCadastro DATETIME NOT NULL DEFAULT GETDATE(),
  cancelado BIT NOT NULL DEFAULT 0)
go
 alter table Item add constraint pk_item  primary key (idItem)
 go
 create index idx_fk_produto on Item (idProduto)
 create index idx_fk_hospedagem on Item (idHospedagem)
 go
  alter table Item 
  add constraint fk_produto
  foreign key (idProduto)
  references   Produto (idProduto)
 go   
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
  observacao VARCHAR(100) NULL,
  valor NUMERIC(10,2) NOT NULL,
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
 go 
 alter table ControleServico 
 add constraint fk_hospedagemquarto
 foreign key (idHospedagem)
 references   Hospedagem (idHospedagem)
 go   
 alter table ControleServico 
 add constraint fk_Pessoa
 foreign key (idFuncionario)
 references   Pessoa (idPessoa)
 go
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
  valorParcela NUMERIC(10,2) NOT NULL,
  status CHAR(1) CHECK(status in ('P','E','C')))
  
 go
 alter table  Pagamento add constraint pk_pagamento primary key (numeroParcela, idFormapagamento, idPacoteHospedagem)
 go
 create index idx_fk_pacotehospedagem on Pagamento (idPacoteHospedagem )
 create index idx_fk_forma_pagamento on Pagamento (idFormaPagamento)
 create index idx_fk_status_pagamento on Pagamento (status )
 go

alter table Pagamento 
add constraint fk_forma_pagamento
foreign key (idFormaPagamento)
references   FormaPagamento (idFormaPagamento)
go
alter table Pagamento 
add constraint fk_pacote_pagamento_hospedagem
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
 go
create index idx_fk_pacote_hospedagem on HistoricoAcesso (idPacoteHospedagem)
create index fk_usuario  on HistoricoAcesso (idUsuario)
go

alter table HistoricoAcesso 
add constraint fk_usuario
foreign key (idUsuario)
references   Usuario (idUsuario)
go
alter table HistoricoAcesso 
add  constraint fk_pacote_historico_hospedagem
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
  idHospedagem INT NOT NULL,
  dataCadastro DATETIME NOT NULL,
  isResponsavel BIT NULL)
go


alter table ControleCliente add constraint pk_controle_cliente primary key (idHospedagem,idCliente)
go
 create index idx_fk_hospedagem on ControleCliente (idHospedagem )
 create index idx_fkcliente on ControleCliente(idCliente )
 go
 alter table ControleCliente 
 add constraint fk_controle_cliente_hospedagem
    foreign key (idHospedagem)
    references   Hospedagem (idHospedagem)
    go
  alter table ControleCliente 
 add constraint fk_cliente
    foreign key (idCliente)
    references   Pessoa (idPessoa)
 go   

-- -----------------------------------------------------
-- Table Historico
-- -----------------------------------------------------
DROP TABLE  Historico 
go
CREATE TABLE Historico (
  idHistorico INT IDENTITY(1,1) NOT NULL,
  idUsuario INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  observacao VARCHAR(70) NOT NULL,
  dataCadastro DATETIME NOT NULL DEFAULT GETDATE())

	go
alter table Historico add constraint pk_historico primary key (idHistorico)
go
create  index idx_fk_usuario on Historico (idUsuario )
go
alter table Historico 
add constraint fk_usuario_hitorico
foreign key (idUsuario)
references   Usuario (idUsuario)
