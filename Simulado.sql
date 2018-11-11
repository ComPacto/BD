create database bd_simulado;

use bd_simulado;

create table genero(
	id_genero int(3) zerofill not null auto_increment,
    descricao varchar(60) not null,
    constraint pkidgenero primary key(id_genero));
    
create table editora(
	id_editora int(3) zerofill not null auto_increment,
    nome varchar(60) not null,
    cidade varchar(40) not null,
    constraint pkideditora primary key(id_editora));
    
create table livro(
	id_livro int(3) zerofill not null auto_increment,
    isbn int(10) not null unique key,
    titulo varchar(60) not null,
    qtd_paginas int(100) not null,
    valor decimal(10,2) not null,
    id_genero int(3) zerofill not null,
    id_editora int(3) zerofill not null,
    constraint pkidlivro primary key(id_livro),
    constraint fkidgenero foreign key(id_genero) references genero(id_genero),
    constraint fkideditora foreign key(id_editora) references editora(id_editora));
    
create table autor(
	id_autor int(3) zerofill not null auto_increment,
    nome varchar(60) not null,
    telefone varchar(20) null,
    constraint pkidautor primary key(id_autor));
    
create table livro_autor(
	id_livro int(3) zerofill not null,
    id_autor int(3) zerofill not null,
    constraint pklivroautor primary key(id_livro,id_autor),
    constraint fkidlivro foreign key(id_livro) references livro(id_livro),
    constraint fkidautor foreign key(id_autor) references autor(id_autor));
    
insert into genero
	values(null, 'Didático'),
		  (null, 'História');
              
insert into editora
	values(null, 'Atlas', 'São Paulo'),
		  (null, 'Globo', 'Rio de Janeiro');
          
insert into autor
	values(null, 'Aline Zenker', '9999-9999'),
		  (null, 'Jonatas Alcalay', '9898-9898');
          
insert into livro
	values(null, 0000000011, 'MySQL - Forever', 159, 85.9, 001, 001),
		  (null, 0000000012, 'Alice no Pais das Maravilhas', 68, 50.4, 002, 002);
          
insert into livro_autor
	values(001,001),
		  (002,002);
          
select * from editora;

select descricao from genero;

select nome,telefone from autor;

select * from livro
	where valor < 50;
    
select * from livro
	where valor between 20 and 60;
    
select * from livro
	where titulo like 'Estrelas';
    
select sum(valor) from livro;

select avg(valor) from livro;

select titulo from livro
	where valor < 80 
		and qtd_paginas < 100;
        
select livro.titulo as Titulo, autor.nome as Nome_Autor
	from livro inner join livro_autor
		on livro.id_livro = livro_autor.id_livro
			inner join autor
				on livro_autor.id_autor = autor.id_autor;
                
select livro.titulo as Titulo
	from livro inner join livro_autor
		on livro.id_livro = livro_autor.id_livro
			inner join autor
				on livro_autor.id_autor = autor.id_autor
					where autor.nome = 'Aline Zenker';
                    
select *
	from livro inner join editora
		on livro.id_editora = editora.id_editora
			where editora.nome = 'Bah Tchê';
            
select livro.titulo as Titulo, livro.valor as Valor, autor.nome as Nome_autor
	from autor inner join livro_autor
		on autor.id_autor = livro_autor.id_autor
			inner join livro
				on livro_autor.id_livro = livro.id_livro
					inner join genero
						on livro.id_genero = genero.id_genero
							where genero.descricao = 'Infantil';
                            
select titulo from livro 
	where valor in(select max(valor) from livro);
    
select titulo from livro 
	where valor in(select min(valor) from livro);
    
select titulo,valor * 0.5 as Valor_Desconto from livro;