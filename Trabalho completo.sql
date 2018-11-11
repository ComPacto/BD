create database escola;

use escola;

create table professor(
	chapa int(3) zerofill not null auto_increment,
    nome varchar(60) not null,
    telefone varchar(10) not null,
    email varchar(40) not null,
    constraint pkchapa primary key(chapa));
    
create table disciplina(
	cod_disciplina int(3) not null auto_increment,
    nome varchar(60) not null,
    carga_horaria decimal(10,2) not null,
    constraint pkcod_disciplina primary key(cod_disciplina));
    
create table turno(
	id_turno char(1) not null,
    descricao enum('Manhã','Tarde','Noite') not null,
    constraint pkid_turno primary key(id_turno));
    
create table turma(
	cod_turma int(4) zerofill not null,
    id_turno char(1) not null,
    ano_inicio int(4) not null,
    semestre int(2) not null,
    cod_disciplina int(3) not null,
    chapa int(3) zerofill not null,
    constraint pkcod_turma primary key(cod_turma),
    constraint fkid_turno foreign key(id_turno) references turno(id_turno),
    constraint fkcod_disciplina foreign key(cod_disciplina) references disciplina(cod_disciplina),
    constraint fkchapa foreign key(chapa) references professor(chapa));
    
create table aluno(
	matricula int(7) not null,
    nome varchar(60) not null,
    telefone varchar(12) null,
    constraint pkmatricula primary key(matricula));
    
create table aluno_turma(
		cod_turma int(4) zerofill not null,
        matricula int(7) not null,
        n1 decimal(10,2) not null,
        n2 decimal(10,2) not null,
        constraint pkalunoturma primary key(cod_turma, matricula),
        constraint fkcod_turma foreign key(cod_turma) references turma(cod_turma),
        constraint fkmatricula foreign key(matricula) references aluno(matricula));
        
insert into professor
	values(null, 'Aline', 95478521, 'aline.zenker@qi.edu.br'),
		  (null, 'Andressa', 94874787, 'andressa.dellay@qi.edu.br'),
          (null, 'Frodo', 84214778, 'leandro.silva@qi.edu.br'),
          (null, 'Jonatas', 94051980, 'jonatas.alcalay@qi.edu.br'),
          (null, 'Rita', 81245478, 'rita.gaieski@qi.edu.br');
          
insert into disciplina
	values(null, 'Lógica de Programação', 133),
		  (null, 'Internet 1', 67),
          (null, 'Banco de Dados 1', 33.5),
          (null, 'Computação Gráfica', 67),
          (null, 'Linguagem de Banco de Dados', 33.5),
          (null, 'Linguagem de Programação Web', 67);
          
insert into turno
	values('M', 'Manhã'),
		  ('T', 'Tarde'),
          ('N', 'Noite');

insert into turma
	values(0547, 'M', 2015, 02, 002, 004),
		  (0235, 'M', 2016, 01, 001, 001),
          (1475, 'T', 2016, 02, 004, 004),
		  (2698, 'N', 2017, 01, 006, 002),
          (2173, 'N', 2015, 02, 005, 003);
         
insert into aluno
	values(2014159, 'Cassio', 34841598),
		  (2014324, 'Amanda', 34902476),
          (2015817, 'Cristiano', null),
          (2015369, 'Fernanda', 34882014),
          (2014474, 'Pablo', 34698720),
          (2014198, 'Luiza', null);
          
insert into aluno_turma
	values(2698, 2015369, 6, 7),
		  (1475, 2014159, 10, 8),
          (0547, 2014474, 5.5, 7),
          (2698, 2015817, 10, 10),
          (2173, 2015369, 9.5, 9.8),
          (2173, 2014198, 8, 4.5);
          
select * from aluno;

select nome,email from professor;

select sum(carga_horaria) from disciplina;

select cod_turma,avg(n1) from aluno_turma;

select cod_turma,avg(n2) from aluno_turma;

select nome,telefone from aluno order by nome;

select max(n1) from aluno_turma;

select min(n2) from aluno_turma;

select count(*) from aluno_turma;

select aluno.nome as Nome_Aluno
	from aluno,aluno_turma,turma,professor
		where aluno.matricula = aluno_turma.matricula
			and aluno_turma.cod_turma = turma.cod_turma
				and turma.chapa = professor.chapa
					and professor.nome = 'Aline';
                    
select aluno.nome as Nome_Aluno, professor.nome as Nome_Professor
	from aluno inner join aluno_turma
		on aluno.matricula = aluno_turma.matricula
			inner join turma
				on aluno_turma.cod_turma = turma.cod_turma
					inner join professor
						on turma.chapa = professor.chapa;
                        
select professor.nome as Nome_Professor, turma.ano_inicio as Ano_Inicio
	from professor inner join turma
		on professor.chapa = turma.chapa
			where ano_inicio = 2016;
            
select aluno.nome as Nome_Aluno, aluno_turma.n1 as N1, aluno_turma.n2 as N2
	from aluno inner join aluno_turma
		on aluno.matricula = aluno_turma.matricula
			where n1 = 10 
				or n2 = 10;

select professor.nome as Professor_Nome, aluno.nome as Nome_Aluno
	from professor inner join turma
		on professor.chapa = turma.chapa
			inner join aluno_turma
				on turma.cod_turma = aluno_turma.cod_turma
					inner join aluno
						on aluno_turma.matricula = aluno.matricula
							where aluno.nome = 'Cristiano';
                            
select aluno.nome as Nome_Aluno, turma.id_turno as Turno
	from aluno inner join aluno_turma
		on aluno.matricula = aluno_turma.matricula
			inner join turma
				on aluno_turma.cod_turma = turma.cod_turma
					where id_turno = 'N';
                    
select aluno.nome as Nome_Aluno, aluno.telefone as Telefone
	from aluno inner join aluno_turma
		on aluno.matricula = aluno_turma.matricula
			inner join turma
				on aluno_turma.cod_turma = turma.cod_turma
					where cod_disciplina = 004;