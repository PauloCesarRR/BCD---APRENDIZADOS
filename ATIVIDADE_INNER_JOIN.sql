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
       
       
select tblFilme.nome as nomeFilme, 
	   tblFilme.dataLancamento, 
       tblFilme.sinopse,
	   tblclassificacao.nome as nomeClassificacao, 
	   tblGenero.nome as nomeGenero, 
       tblAtor.nome as nomeAtor, 
       tblator.dataNascimento as dataNascAtor, 
       tblnacionalidade.nome as nomeNacionalidade,
       tbldiretor.nome as nomeDiretor, 
       tblroteirista.nome as nomeRoterista
       from tblFilme  
       inner join tblFilme_Genero 
						on tblFilme.idFilme = tblfilme_genero.idFilme 
       inner join tblfilme_ator 
						on tblFilme.idFilme = tblfilme_ator.idFilme
       inner join tblfilme_diretor 
						on tblfilme.idFilme = tblfilme_diretor.idFilme
       inner join tblfilme_roteirista 
						on tblFilme.idFilme = tblfilme_roteirista.idFilme
       inner join tblGenero 
						on tblGenero.idGenero = tblfilme_genero.idGenero 
       inner join tblclassificacao 
						on tblFilme.idClassificacao = tblclassificacao.idClassificacao  
	   inner join tblAtor 
						on tblfilme_ator.idAtor = tblator.idAtor  
	   inner join tblator_nacionalidade
						on tblator.idAtor = tblator_nacionalidade.idAtor
       inner join tblNacionalidade
						on tblator_nacionalidade.idNacionalidade = tblNacionalidade.idNacionalidade 
       inner join tbldiretor 
						on tblfilme_diretor.idDiretor = tbldiretor.idDiretor
       inner join tblroteirista 
						on tblfilme_roteirista.idRoteirista = tblroteirista.idRoteirista
       group by tblgenero.nome, tblator.nome
       order by tblfilme.nome asc, tblator.nome desc;   
       
       
       desc tblator_nacionalidade;
       
## group by - permite agrupar o resultdo do select por colunas especificas
       
       
       
#Criando uma view no BD
#view - é uma tabela virtual criada com base em um select, 
##que já é pré processada pelo BD e permite dar uma respota
###muito mais agil do que reesecutar o script manualmente


create view vwListarFilmes as
	select tblFilme.nome as nomeFilme, 
		   tblFilme.dataLancamento, 
		   tblFilme.sinopse,
		   tblclassificacao.nome as nomeClassificacao, 
		   tblGenero.nome as nomeGenero, 
		   tblAtor.nome as nomeAtor, 
		   tblator.dataNascimento as dataNascAtor, 
		   tblnacionalidade.nome as nomeNacionalidade,
		   tbldiretor.nome as nomeDiretor, 
		   tblroteirista.nome as nomeRoterista
		   from tblFilme  
		   inner join tblFilme_Genero 
							on tblFilme.idFilme = tblfilme_genero.idFilme 
		   inner join tblfilme_ator 
							on tblFilme.idFilme = tblfilme_ator.idFilme
		   inner join tblfilme_diretor 
							on tblfilme.idFilme = tblfilme_diretor.idFilme
		   inner join tblfilme_roteirista 
							on tblFilme.idFilme = tblfilme_roteirista.idFilme
		   inner join tblGenero 
							on tblGenero.idGenero = tblfilme_genero.idGenero 
		   inner join tblclassificacao 
							on tblFilme.idClassificacao = tblclassificacao.idClassificacao  
		   inner join tblAtor 
							on tblfilme_ator.idAtor = tblator.idAtor  
		   inner join tblator_nacionalidade
							on tblator.idAtor = tblator_nacionalidade.idAtor
		   inner join tblNacionalidade
							on tblator_nacionalidade.idNacionalidade = tblNacionalidade.idNacionalidade 
		   inner join tbldiretor 
							on tblfilme_diretor.idDiretor = tbldiretor.idDiretor
		   inner join tblroteirista 
							on tblfilme_roteirista.idRoteirista = tblroteirista.idRoteirista
		   group by tblgenero.nome, tblator.nome
		   order by tblfilme.nome asc, tblator.nome desc;   
           
           
show tables;

desc vwListarFilmes;

select * from vwListarFilmes;

alter view vwListarFilmes as 
	select tblFilme.nome as nomeFilme, 
		   tblFilme.dataLancamento, 
		   tblFilme.sinopse,
		   tblclassificacao.nome as nomeClassificacao, 
		   tblGenero.nome as nomeGenero, 
		   tblAtor.nome as nomeAtor, 
		   tblator.dataNascimento as dataNascAtor, 
		   tblnacionalidade.nome as nomeNacionalidade,
		   tbldiretor.nome as nomeDiretor, 
		   tblroteirista.nome as nomeRoterista
		   from tblFilme  
		   inner join tblFilme_Genero 
							on tblFilme.idFilme = tblfilme_genero.idFilme 
		   inner join tblfilme_ator 
							on tblFilme.idFilme = tblfilme_ator.idFilme
		   inner join tblfilme_diretor 
							on tblfilme.idFilme = tblfilme_diretor.idFilme
		   inner join tblfilme_roteirista 
							on tblFilme.idFilme = tblfilme_roteirista.idFilme
		   inner join tblGenero 
							on tblGenero.idGenero = tblfilme_genero.idGenero 
		   inner join tblclassificacao 
							on tblFilme.idClassificacao = tblclassificacao.idClassificacao  
		   inner join tblAtor 
							on tblfilme_ator.idAtor = tblator.idAtor  
		   inner join tblator_nacionalidade
							on tblator.idAtor = tblator_nacionalidade.idAtor
		   inner join tblNacionalidade
							on tblator_nacionalidade.idNacionalidade = tblNacionalidade.idNacionalidade 
		   inner join tbldiretor 
							on tblfilme_diretor.idDiretor = tbldiretor.idDiretor
		   inner join tblroteirista 
							on tblfilme_roteirista.idRoteirista = tblroteirista.idRoteirista
		   group by tblgenero.nome, tblator.nome
		   order by tblfilme.nome asc, tblator.nome desc;   
           
drop view vwListarFilmes;

show create view vwListarFilmes;

       
	
       
       
       
    