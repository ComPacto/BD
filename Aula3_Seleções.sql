create database bd_aula3;
use bd_aula3;

create table fabricante(
	idfabricante int(4) zerofill not null auto_increment,
    nome varchar(60) not null,
    razaosocial varchar(60) not null unique,
    cnpj varchar(15) not null unique,
    constraint pkfabricante primary key(idfabricante)
);

create table fornecedor(
	idfornecedor int(4) zerofill not null auto_increment,
    nome varchar(60) not null,
    cnpj varchar(15) not null unique,
    cidade varchar(60) not null,
    estado varchar(50) not null,
    telefone varchar(20) not null,
    constraint pkfornecedor primary key(idfornecedor)
);

create table produto(
	idproduto int(4) zerofill not null auto_increment,
    codigobarra varchar(30) not null,
    descricao varchar(60) not null,
    quantidade int not null,
    valor double not null,
    idfornecedor int(4) zerofill not null,
    idfabricante int(4) zerofill not null,
    constraint pkproduto primary key(idproduto),
    constraint fkfornecedor foreign key(idfornecedor) references fornecedor(idfornecedor),
    constraint fkfabricante foreign key(idfabricante) references fabricante(idfabricante)
);

insert into fabricante
	values(null,"Lilo","Lilo Ltda","123"),
		  (null,"Lacta","Lacta Ltda","231");
          
insert into fornecedor(nome,cnpj,cidade,estado,telefone)
	values("Zé","12","Porto Alegre","RS","51989800001"),
		  ("Maria","21","Florianópolis","SC","48999990000");
          
insert into produto
	values(null,"1222","Caixa de bis Branco",100,2.98,2,2),
		  (null,"1234","Ruffles",50,4.70,1,2),
		  (null,"2132","Barra de Chocolate Preto",10,4.80,2,2),
		  (null,"1233","Mamadeira 180ml",30,42.20,1,1),
          (null,"1344","Chupeta Rosa",150,32,1,1);
    
select * 
	from fabricante;
    
select descricao,valor
	from produto;
    
select * 
	from produto
    where idproduto=3;
    
select descricao
	from produto
	where quantidade >= 100;
    
select *
	from produto
	where valor<50 and quantidade>20;
    
select descricao
	from produto
    where valor>30
    or quantidade = 100;
     
select *
	from produto
    where valor between
    40 and 100;
    
select *
	from fornecedor
    where telefone is null;
    
select * 
	from produto 
    where idproduto 
    in(1,4);
    
select * 
	from fornecedor 
    where nome 
    like '%santos';
    
select * 
	from fornecedor 
    where estado='RS';
    
select descricao,valor 
	from produto 
    where quantidade 
    between 20 and 50;
    
select descricao 
	from produto 
    where valor>30 or 100;