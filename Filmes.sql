#Cria um database novo no BD
create database dbFilmes;

#permite visualizar os databases existentes no BD
show databases;

#seleciona o database a ser utilizado
use dbFilmes;

 

create table tblClassificacao (
	idClassificacao int not null auto_increment primary key,
    nome varchar(20) not null, 
    unique index(idClassificacao)
);



create table tblSexo (
idSexo int not null auto_increment primary key,
nome varchar(10) not null,
unique index (idSexo)
);

create table tblGenero (
idGenero int not null auto_increment primary key,
nome varchar(30) not null,
unique index (idGenero)
);


create table tblNacionalidade (
	idNacionalidade int not null auto_increment primary key,
    nome varchar(20) not null,
    unique index (idNacionalidade)
);

create table tblFilme (
idFilme int not null auto_increment primary key,
nome varchar(80) not null,
nomeOriginal varchar(80),
duracao time not null,
DataLancamento date not null,
dataRelancamento date,
sinopse text not null,
fotoCapa varchar(45),
idClassificacao int not null,
constraint FK_Classificacao_Filme
foreign key (idClassificacao)
references tblClassificacao (idClassificacao)
);

create table tblAtor (
idAtor int not null auto_increment primary key,
nome varchar(80) not null,
nomeArtistico varchar(80),
dataNasc date not null,
dataFalesc date,
biografia text,
foto varchar(45)
);

create table tblDiretor (
	idDiretor int not null auto_increment primary key,
    nome varchar(80) not null,
    dataNascimento date not null,
    nomeArtistico varchar(80),
    biografia text,
    foto varchar(80),
    idSexo int not null,
    constraint FK_Sexo_Diretor
    foreign key(idSexo)
    references tblSexo (idSexo),
    unique index (idDiretor)
    );
    
create table tblFilme_Diretor (
	idFilmeDiretor int not null auto_increment primary key,
    idFilme int not null,
    idDiretor int not null,
    constraint FK_Filme_FilmeDiretor
    foreign key(idFilme)
	references tblFilme (idFilme),
    
    constraint FK_Diretor_FilmeDiretor
    foreign key (idDiretor)
    references tblDiretor (idDiretor),
    
    unique index (idFilmeDiretor)
    
	);
    

        
        
alter table tblAtor
	modify column nome varchar(80) not null;
    
    
alter table tblAtor
	change column dataNasc dataNascimento date not null;
    
    
alter table tblAtor
	add column codigo varchar(8);
    
    
alter table tblAtor
change column codigo idSexo int not null;
    
    
alter table tblAtor 
    add constraint FK_Sexo_Ator
		foreign key (idSexo)
		references tblSexo (idSexo);
        
alter table tblAtor
	add unique index(idAtor, foto);
    
alter table tblAtor
drop foreign key FK_Sexo_Ator;

alter table tblAtor
	drop column idSexo;
    
    
    desc tblAtor;
    
    #ComoVerificar as constraints existentes em uma tabela
    #SELECT
    #CONSTRAINT NAME
    #REFERENCED_TABLE_NAME,
    #REFERENCED_COLUMN_NAME
    #FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    #WHERE
    #REFERENCED_TABLE_NAME = 'tblFilme';
    
    
    alter table tblAtor 
    add column id int not null,
    add constraint FK_Sexo_Ator
    foreign key (idSexo)
    references tblSexo (idSexo);
    
    
#apagar tabela
#drop table tblRoteirista;    
    
    create table tblRoteirista(
		idRoteirista int not null auto_increment primary key,
        nome varchar(80) not null,
		idSexo int not null,
        constraint FK_Sexo_Roteirista
		foreign key (idSexo)
		references tblSexo (idSexo)
    );
    
    create table tblFilme_Roteirista (
	idFilmeRoteirista int not null auto_increment primary key,
    idRoteirista int not null,
    idFilme int not null,
    
    constraint FK_Filme_FilmeRoteirista
    foreign key(idFilme)
	references tblFilme (idFilme),
    
    constraint FK_Roteirista_FilmeRoteirista
    foreign key (idRoteirista)
    references tblRoteirista (idRoteirista),
    
    unique index (idFilmeRoteirista)
    
	);
    
    create table tblEstudio (
    idEstudio int not null auto_increment primary key,
    nome varchar(50) not null
    );
    
	create table tblFilme_Estudio (
	idFilmeEstudio int not null auto_increment primary key,
    idEstudio int not null,
    idFilme int not null,
    
    constraint FK_Filme_FilmeEstudio
    foreign key(idFilme)
	references tblFilme (idFilme),
    
    constraint FK_Estudio_FilmeEstudio
    foreign key (idEstudio)
    references tblEstudio (idEstudio),
    
    unique index (idFilmeEstudio)
    
	);
    
    
	create table tblFilme_Ator (
	idFilmeAtor int not null auto_increment primary key,
    idAtor int not null,
    idFilme int not null,
    
    constraint FK_Filme_FilmeAtor
    foreign key(idFilme)
	references tblFilme (idFilme),
    
    constraint FK_Ator_FilmeAtor
    foreign key (idAtor)
    references tblAtor (idAtor),
    
    unique index (idFilmeAtor)
    
	);
    
    	create table tblAtor_Nacionalidade (
	idAtorNacionalidade int not null auto_increment primary key,
    idAtor int not null,
    idNacionalidade int not null,
    
    constraint FK_Ator_AtorNacionalidade
    foreign key(idAtor)
	references tblAtor (idAtor),
    
    constraint FK_Nacionalidade_AtorNacionalidade
    foreign key (idNacionalidade)
    references tblNacionalidade (idNacionalidade),
    
    unique index (idAtorNacionalidade)
    
	);
    
    	create table tblDiretor_Nacionalidade (
	idDiretorNacionalidade int not null auto_increment primary key,
    idDiretor int not null,
    idNacionalidade int not null,
    
    constraint FK_Diretor_DiretorNacionalidade
    foreign key(idDiretor)
	references tblDiretor(idDiretor),
    
    constraint FK_Nacionalidade_DiretorNacionalidade
    foreign key (idNacionalidade)
    references tblNacionalidade (idNacionalidade),
    
    unique index (idDiretorNacionalidade)
    
	);
    
        	create table tblRoteirista_Nacionalidade (
	idRoteiristaNacionalidade int not null auto_increment primary key,
    idRoteirista int not null,
    idNacionalidade int not null,
    
    constraint FK_Roteirista_RoteiristaNacionalidade
    foreign key(idRoteirista)
	references tblRoteirista(idRoteirista),
    
    constraint FK_Nacionalidade_RoteiristaNacionalidade
    foreign key (idNacionalidade)
    references tblNacionalidade (idNacionalidade),
    
    unique index (idRoteiristaNacionalidade)
    
	);
    
    create table tblFilme_Genero (
	idFilmeGenero int not null auto_increment primary key,
    idFilme int not null,
    idGenero int not null,
    constraint FK_Filme_FilmeGenero
    foreign key(idFilme)
	references tblFilme (idFilme),
    
    constraint FK_Genero_FilmeGenero
    foreign key (idGenero)
    references tblGenero (idGenero),
    
    unique index (idFilmeGenero)
    
	);
    
    
    
show tables;
