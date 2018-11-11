create database bd_cd;

use bd_cd;

create table cds(
	idCds int not null auto_increment,
    nome varchar(30) not null,
    dataCompra date not null,
    valorPago decimal(10,2) not null,
    localCompra varchar(25) not null,
    album varchar(15) not null,
    constraint pk_cds primary key(idCds));

create table musicas(
	idMusicas int not null auto_increment,
    nome varchar(15) not null,
    artista varchar(25) not null,
    tempo time not null,
    idCds int not null,
    constraint pk_musicas primary key(idMusicas),
    constraint pk_cds foreign key(idCds) references cds (idCds));
    
insert into cds
	values(null, 'Teixeirinha', '2017-03-20', 32.50, 'Canoas', 'Volume 1'),
		  (null, 'Nirvana', '2017-03-16', 42.99, 'Porto Alegre', 'Volume 6'),
		  (null, 'Sertanejo Universitário', '2017-02-22', 8.90, 'Gravataí', 'Volume Único');
          
insert into musicas
	values(null, 'Vagal', 'Sla', '00:03:14', 1),
		  (null, 'BTS', 'Sweat', '00:02:56', 1),
          (null, 'Momoland', 'Bboom', '00:03:56', 2),
          (null, 'Sistar', 'Lonely', '00:02:46', 2),
          (null, 'Twice', 'OOOH AAHH', '00:03:00', 3),
          (null, 'Twice', 'TT', '00:03:36', 3);
          
select * from cds;

select nome,dataCompra
	from cds
		order by nome;
        
select nome,dataCompra
	from cds
		order by dataCompra desc;
        
select sum(valorPago) as TotalComprasdeCDS
	from cds;
    
select * 
	from musicas
		where idMusicas = 1;
    
select musicas.nome as Nome_da_Músicas, cds.nome as Nome_do_CD
	from musicas,cds
		where musicas.idCds = cds.idCds;
        
select nome,artista
	from musicas;
    
select sum(tempo) as tempoTotalDeMusica
	from musicas;
    
select nome
	from cds
		where valorPago
			between 20 and 35;
            
/*15*/

select count(*) as TotalMusicasCadastradas
	from musicas;
    
select avg(tempo) as MédiaDeDuração
	from musicas;
        
select count(*) as TotalCdsCadastrados
	from cds;	
	
select nome
	from musicas
		where idCds = 1;
        
select nome
	from cds
		where nome
			like 'n%';
            
select nome
	from cds
		where localCompra = 'Porto Alegre';
        
select *
	from cds
		where nome 
			like '%Sertanejo%';
            
select nome
	from musicas
		order by nome;
        
select *
	from cds
		where valorPago in(select min(valorPago) from cds);
        
select *
	from cds
		where valorPago in(select max(valorPago) from cds);
        
drop database bd_cd;