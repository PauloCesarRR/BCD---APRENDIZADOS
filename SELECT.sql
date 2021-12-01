#Permite visualizar todas as colunas e os registros de uma Tabela
select * from tblFilme;

alter table tblFilme add column qtde int;

update tblFilme set qtde = 14 where idFilme = 3;

select * from tblFilme where qtde <=6;

select * from tblFilme where qtde >=4 and qtde <=6;

select * from tblFilme where not (qtde >=3 and qtde <=6);

select * from tblFilme where
qtde = 3 or
qtde = 14 or
qtde = 8 or
qtde = 1;


#in - permite buscar no mesmo atributo por varios valores, não precisando escerever o atributo varias vezes. OBS(só funciona com o operador logico OR)
select * from tblFilme where qtde in (3,5,8,10);

select * from tblFilme where qtde not in (3,5,8,10);


#BETWEEN
select * from tblFilme where qtde between 6 and 15;

select * from tblFilme where qtde not between 6 and 15;


#Ordenação de Dados

# order by asc - orderna de forma crescente
# order by desc - orderna de forma decrescente
select * from tblFilme order by nome asc;
select * from tblFilme order by nome desc;

select * from tblFilme order by nome asc, duracao desc;

#LIMIT

select * from tblFilme limit 2;

#somente o 1° registro da tabela
select * from tblFilme order by idFilme asc limit 1;

#Somente o ultimo registro da tabela
select * from tblFilme order by idFilme desc limit 1;

#count - retorna a qtde de intens no select
select count(*) as qtdeFilmes from tblFilme;

select count(nome) as qtdeNomeFilmes, count(dataRelancamento) as qtdeFilmesDataRelacanmento from tblFilme;

select count(*) as qtdeClassificacaoFilmes from tblFilme where idClassificacao = 13;

#min - retorna o menor valor do select
#max - retorna o maior valor do select

select min(qtde) as qtdeMinima from tblFilme;
select max(qtde) as qtdeMax from tblFilme;

select min(nome) as qtdeMin from tblFilme;
select max(nome) as qtdeMax from tblFilme;


select sum(qtde) as SomaQtdeFilmes from tblFilme;

select round(avg(qtde), 1) as MediaQtdeFilmes from tblFilme;

 #Permite visualizar apenas as colunas especificas da tabela
select nome, sinopse from tblFilme;

 #Permite visualizar apenas as colunas especificas de uma tabela especificas
select tblFilme.nome, tblFilme.sinopse from tblFilme;

# as - significa alias (permite criar um apelido para o nome de uma coluna ou de uma tabela)
select filme.nome as nomeFilme, filme.duracao, filme.sinopse from tblFilme as filme;

select nome, sinopse from tblFilme where idFilme = 1;


select nome, sinopse from tblFilme where nome like '%SONHO%';

/*
OPERADORES 

=
<
>
<=
>=

like
*/

/*
OPERADORES LOGICOS

and
or
not
*/

