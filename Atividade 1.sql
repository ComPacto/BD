create database supermercado;
use supermercado;
show databases;

create table fabricante(
	idfabricante int not null auto_increment,
    nomefabricante varchar(50) not null,
    razaosocial varchar(60) not null,
    cnpj char(14) not null unique,
    constraint pkfabricante primary key(idfabricante));
    
create table fornecedor(
	idfornecedor int not null auto_increment,
    nomefornecedor varchar(50) not null,
    cnpj char(14) not null unique,
    cidade varchar(60) not null,
    estado char(2) not null,
    telefone varchar(20) not null,
    constraint pkfornecedor primary key(idfornecedor));
    
create table produto(
	idproduto int not null auto_increment,
    codbarras varchar(30) not null unique,
    descricao varchar(30) not null,
    quantidade int not null,
    valor float not null,
    idfabricante int not null,
    idfornecedor int not null,
    constraint pkproduto primary key(idproduto),
    constraint fkfabricante foreign key(idfabricante) references fabricante(idfabricante),
    constraint fkfornecedor foreign key(idfornecedor) references fornecedor(idfornecedor));
    
insert into fornecedor(idfornecedor, nomefornecedor, cnpj, cidade, estado, telefone)
values(null, 'Big', 856744, 'Porto Alegre', 'RS', 3523623);

insert into fabricante(idfabricante, nomefabricante, razaosocial, cnpj)
values(null, 'Logitec', 'Logitec FQ', 7526533);

insert into fabricante(idproduto, codbarras, descricao, quantidade, valor, idfabricante, idfornecedor)
values(null, '8754BC44', 'Bis', 'Caixa de chocolates', 300, 3.50, 1, 1);
    
