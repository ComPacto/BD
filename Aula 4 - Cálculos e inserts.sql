create database aula4exemplos;
use aula4exemplos;

CREATE TABLE categoria(
 idcategoria INT(4) ZEROFILL NOT NULL AUTO_INCREMENT,
 nome VARCHAR(60) NOT NULL,
 setor VARCHAR(20) NULL,
 CONSTRAINT pk_categoria PRIMARY KEY(idcategoria));
 
CREATE TABLE fornecedor(
 idfornecedor INT(4) ZEROFILL NOT NULL AUTO_INCREMENT,
 nome VARCHAR(60) NOT NULL,
 telefone VARCHAR(20) NULL,
 CONSTRAINT pk_fornecedor PRIMARY KEY(idfornecedor));

CREATE TABLE fabricante(
 idfabricante INT(4) ZEROFILL NOT NULL AUTO_INCREMENT,
 nome VARCHAR(60) NOT NULL,
 uf CHAR(2) NOT NULL,
 CONSTRAINT pk_fabricante PRIMARY KEY(idfabricante));
 
CREATE TABLE produto(
idproduto INT(4) ZEROFILL NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
valor DOUBLE NOT NULL,
quantidade INT NULL,
categoria INT(4) ZEROFILL NOT NULL,
fabricante INT(4) ZEROFILL NOT NULL,
fornecedor INT(4) ZEROFILL NOT NULL,
CONSTRAINT pk_produto PRIMARY KEY(idproduto),
CONSTRAINT fk_categoria FOREIGN KEY(categoria) REFERENCES
categoria(idcategoria),
CONSTRAINT fk_fabricante FOREIGN KEY(fabricante) REFERENCES
fabricante(idfabricante),
CONSTRAINT fk_fornecedor FOREIGN KEY(fornecedor) REFERENCES
fornecedor(idfornecedor));

show tables;

INSERT INTO CATEGORIA
	VALUES (NULL,'Limpeza','A32'),
	(NULL,'Material Escolar','A40');
    
select * from categoria;

INSERT INTO FORNECEDOR
	VALUES(null,'Zé','987987'),
		  (NULL,'Maria',null),
          (null, 'Borigodolfa','99999');
		
select * from fornecedor;

INSERT INTO FABRICANTE
	VALUES (null,'PINHO ltda.','RS'),
	(null,'Faber Castelo','SP'),
	(null,'OMO ltda.','SC');


INSERT INTO PRODUTO
	VALUES(null, "Sabão em pó OMO",12.5, 100, 1,3,1),
	(null, "Confort", 4.5, 1000, 1,3,1),
	(null,"Lápis de cor",15.90,20,2,2,3),
	(null, "Pinho Sol", 3.5,100, 1,1,1),
	(null, "Ace", 5, 650,1,1,2),
	(null, "Fofo", 3.5, 400,1,1,2); 
    
select nome,valor from produto;

select nome,quantidade 
	from produto
		where valor <= 10;
        
select * 
	from produto
		where valor 
			between 5 and 10;
            
select nome as Nome_Produto
	from produto;
    
select nome 
	from produto
		order by nome;
    
select nome
	from produto
		order by nome desc;
        
select sum(valor) as TotalValores
	from produto;

select avg(valor) as Média
	from produto;
    
select max(valor) as Maior_Valor
	from produto;
    
select min(valor) as Menor_Valor
	from produto;
    
select count(telefone) as Total_Telefones
	from fornecedor;
    
select nome,valor from produto 
	where valor in(select max(valor) from produto);
    
select nome,valor from produto
	where valor in(select min(valor) from produto);
    
select fabricante,sum(valor) as Total_Valores
	from produto
		group by fabricante;
        
select fornecedor,avg(valor) as Média_Valores
	from produto
		group by fornecedor;
        
select categoria,sum(valor) as Soma_Valores
	from produto
		group by categoria
			having Soma_Valores > 20;
            
select produto.nome as Nome_Produto, categoria.nome as Nome_Categoria
	from produto,categoria
		where produto.categoria = categoria.idcategoria;
        
select produto.nome as Nome_Produto, fornecedor.nome as Nome_Fornecedor
	from produto,fornecedor
		where produto.fornecedor = fornecedor.idfornecedor;
        
select produto.nome as Nome_Produto, fabricante.nome as Nome_Fornecedor, fabricante.uf as Estado_Fornecedor
	from produto,fabricante
		where produto.fabricante = fabricante.idfabricante;
        
select produto.nome as Nome_Produto, fornecedor.nome as Nome_Fornecedor, fabricante.nome as Nome_Fabricante
	from produto, fornecedor, fabricante
		where produto.fornecedor = fornecedor.idfornecedor
			and produto.fabricante = fabricante.idfabricante;