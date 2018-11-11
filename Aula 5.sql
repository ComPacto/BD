create database bd_aula5;

use bd_aula5;

create table categoria(
	idcategoria int not null auto_increment,
    nome varchar(60) not null,
    constraint pkcategoria primary key(idcategoria));
    
create table editora(
	ideditora int not null auto_increment,
    nome varchar(80) not null,
    estado char(2) not null,
    constraint pkeditora primary key(ideditora));
    
create table livro(
	idlivro int not null auto_increment,
    titulo varchar(80) not null,
    numpaginas int not null,
    idcategoria int not null,
    ideditora int not null,
    constraint pklivro primary key(idlivro),
    constraint fkcategoria foreign key(idcategoria) references categoria(idcategoria),
    constraint fkeditora foreign key(ideditora) references editora(ideditora));
    
create table autor(
	idautor int not null auto_increment,
    nome varchar(60),
    telefone varchar(20) null,
    constraint pkautor primary key(idautor));
    
create table livro_autor(
	idlivro int not null,
    idautor int not null,
    constraint pklivroautor primary key(idlivro,idautor),
    constraint fklivro foreign key(idlivro) references livro(idlivro),
    constraint fkautor foreign key(idautor) references autor(idautor));
    
insert into categoria
	values(null, 'Didático'),
		  (null, 'Infantil');
          
insert into editora
	values(null, 'Bah Tchê', 'RS'),
		  (null, 'Que Bala', 'RS');
          
insert into autor
	values(null, 'Cury', null),
		  (null, 'Aline', '9999'),
          (null, 'Claudio', '8888');
          
insert into livro
	value(null, 'Java the Best', 230, 1, 1),
		 (null, 'Alice no Brasil', 20, 2, 2),
         (null, 'BD na Veia', 300, 1, 1);
         
insert into livro_autor
	value(1,1),
		 (1,2),
         (2,3),
         (3,2),
         (3,3);
         
select titulo
	from livro
		where numpaginas > 100;
        
select nome
	from editora
		where estado = 'RS';
        
select *
	from autor
		where telefone is null;
        
select count(*) as LivrosCadastrados
	from livro;
    
select sum(numpaginas) as TotalNumPáginas
	from livro;
    
select numPaginas/2 as Metade
	from livro;
    
select idcategoria, sum(numpaginas)
	from livro
		group by idcategoria;
        
select idcategoria, avg(numpaginas) as Média_Páginas
	from livro
		group by idcategoria
			having Media_Páginas > 30;
            
select livro.titulo, categoria.nome
	from livro,categoria
		where livro.idcategoria = categoria.idcategoria;
        
select livro.titulo, editora.nome,estado
	from livro,editora
		where livro.ideditora = editora.ideditora;
        
select livro.titulo, editora.nome,estado
	from livro,editora
		where livro.ideditora = editora.ideditora and estado = 'RS';
        
SELECT categoria.nome AS Categoria, livro.titulo, editora.nome AS Editora,
  autor.nome AS Autor
	FROM categoria,livro,editora,livro_autor,autor
		WHERE categoria.idcategoria = livro.idcategoria AND
			livro.ideditora = editora.ideditora AND
				livro.idlivro = livro_autor.idlivro AND
					livro_autor.idautor = autor.idautor;