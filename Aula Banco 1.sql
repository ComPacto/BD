create database bd_aula2_müller;
show databases;
use bd_aula2_müller;
show databases;

create table editora(
	ideditora int(4) zerofill not null auto_increment,
    nomeeditora varchar(60) not null,
    cidade varchar(50) not null,
    constraint pkeditora primary key(ideditora));
    
show tables;

describe editora;

create table livro(
	idlivro int(4) zerofill not null auto_increment,
    titulo varchar(50) not null,
    isbn char(15) not null unique,
    ano year not null,
    ideditora int(4) zerofill null,
    constraint pklivro primary key(idlivro),
    constraint fkeditora foreign key(ideditora) references editora(ideditora));
    
create table autor(
	idautor int(4) zerofill not null auto_increment,
    nomeautor varchar(60) not null,
    rg varchar(15) not null unique,
    email varchar(50) null,
    constraint pkautor primary key(idautor));
    
create table livro_autor(
	idlivro int(4) zerofill not null,
    idautor int(4) zerofill not null,
    constraint pklivroautor primary key(idlivro,idautor),
    constraint fklivro foreign key(idlivro) references livro(idlivro),
    constraint fkautor foreign key(idautor) references autor(idautor));