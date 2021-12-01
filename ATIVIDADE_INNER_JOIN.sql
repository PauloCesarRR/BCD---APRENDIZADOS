use dbfilmes;

# NO WHERE
select tblFilme.nome as nomeFilme, tblFilme.nomeOriginal, tblclassificacao.nome as nomeClassificacao, tblGenero.nome as nomeGenero, tblAtor.nome as nomeAtor 
       from tblFilme, tblGenero, tblfilme_genero, tblclassificacao, tblator
       where tblFilme.idFilme = tblfilme_genero.idFilme and
       tblGenero.idGenero = tblfilme_genero.idGenero and tblFilme.idClassificacao = tblclassificacao.idClassificacao and tblAtor.dataNascimento >= "1940-01-01"
       order by nomeAtor;
       
# NO JOIN
select tblFilme.nome as nomeFilme, tblFilme.nomeOriginal, tblclassificacao.nome as nomeClassificacao, 
	   tblGenero.nome as nomeGenero, tblAtor.nome as nomeAtor from tblFilme 
       inner join tblFilme_Genero on tblFilme.idFilme = tblfilme_genero.idFilme 
       inner join tblGenero on tblGenero.idGenero = tblfilme_genero.idGenero 
       inner join tblclassificacao on tblFilme.idClassificacao = tblclassificacao.idClassificacao 
       inner join tblAtor on tblAtor.dataNascimento >= "1940-01-01"
       order by nomeAtor;      