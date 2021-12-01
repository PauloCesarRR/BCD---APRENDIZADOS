
#concat() - permite realizar a concatenação de dados
select concat('Filme: ', nome) as nomeFiilme, nome, 
concat('O filme ', nome, ' tem duração de ', duracao )
as resultado
from tblFilme;


#concat_ws() - permite realizar a concatenação de dados, utilizando um caractere de separação entre os dados
select concat_ws(' | ', nome, duracao, dataLancamento) as resultado 
from tblFilme;

#locate() - retorna a posiçao da palavra ou caracter desejado
select  locate('Andy', sinopse) as resultado, sinopse 
from tblfilme;

#reverse - permite inverter o conteudo de uma coluna
select reverse(nome) as resultado
from tblFilme;

#length ou char_length - retorna a quantidade de caracteres de uma coluna
select length(nome) as resultado from tblFilme;

#insert(coluna, posição, qtde de caracteres, posiçãa que será removido e novo conteudo) - permite inserir um novo conteudo dentro do texto de uma coluna
select insert(sinopse, 1, 0, ' <b>') as resultado, sinopse from tblFilme;

select insert(sinopse, locate('prisão', sinopse), length('prisão'), '<b>prisão</b>') as resultado, sinopse from tblFilme;
select insert(sinopse, locate('Tom Hanks', sinopse), length('Tom Hanks'), '<b>Tom Hanks</b>') as resultado, sinopse from tblFilme;


#substr() - permite retirar um pedaço de um conteudo
select concat(substr(sinopse, 1, locate('.', sinopse)), 
' <a href="pagina.php>Saiba mais...</a>') as resultado 
from tblFilme;


#replace - permite localizar um conteudo e substituir por outra coisa
select replace(sinopse, 'prisão', '<b>prisão</b>') as resultado 
from tblFilme;

select nome, qtde, concat('R$', valor) as valorOriginal, concat('R$', round((qtde * valor), 2)) as valorTotal, 
concat('R$', round(( valor - ((valor * 50)/100)), 2))
as valorDesconto from tblFilme;

alter table tblfilme
 add column valor float;
 
 update tblFilme set valor = '10.50' where idFilme = 3;
 