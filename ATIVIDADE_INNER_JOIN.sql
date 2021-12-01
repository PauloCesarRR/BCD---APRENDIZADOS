use dbfilmes;

# NO WHERE
select tblFilme.nome as nomeFilme, tblFilme.nomeOriginal, tblclassificacao.nome as nomeClassificacao, tblGenero.nome as nomeGenero, tblAtor.nome as nomeAtor 
       from tblFilme, tblGenero, tblfilme_genero, tblclassificacao, tblator, tblfilme_ator
       where tblFilme.idFilme = tblfilme_genero.idFilme and 
       tblfilme_ator.idAtor = tblator.idAtor and 
       tblFilme.idFilme = tblfilme_ator.idFilme and
       tblGenero.idGenero = tblfilme_genero.idGenero and 
       tblFilme.idClassificacao = tblclassificacao.idClassificacao and 
       tblAtor.dataNascimento >= "1940-01-01"
       order by nomeAtor;
       
# NO JOIN
select tblFilme.nome as nomeFilme, tblFilme.nomeOriginal, 
	   tblclassificacao.nome as nomeClassificacao, 
	   tblGenero.nome as nomeGenero, tblAtor.nome as nomeAtor 
       from tblFilme 
       inner join tblFilme_Genero on tblFilme.idFilme = tblfilme_genero.idFilme 
       inner join tblfilme_ator on tblFilme.idFilme = tblfilme_ator.idFilme
       inner join tblGenero on tblGenero.idGenero = tblfilme_genero.idGenero 
       inner join tblclassificacao on tblFilme.idClassificacao = tblclassificacao.idClassificacao 
       inner join tblAtor on tblfilme_ator.idAtor = tblator.idAtor
       where year(tblAtor.dataNascimento) >= '1940'
       order by nomeAtor;      
       
       
       
    