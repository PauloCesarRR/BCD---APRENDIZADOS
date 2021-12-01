use dbfilmes;

##FORMA 01 DE FAZER RELACIONAMENTO - (NO WHERE)
select tblFilme.nome as nomeFilme, tblFilme.duracao, 
	   tblFilme.dataLancamento, tblGenero.nome as nomeGenero 
       from tblFilme, tblGenero, tblfilme_genero
       where tblFilme.idFilme = tblfilme_genero.idFilme and
       tblGenero.idGenero = tblfilme_genero.idGenero
       order by nomeGenero;
       
##FORMA 02 DE FAZER RELACIONAMENTO - (NO FROM) 
# ESSA FORMA DE RELACIONAR, CRIA UMA PERFORMANCE (PROCESSAMENTO)
# MAIS RÁPIDA NA GERAÇÃO DO RESULTADO

### INNER JOIN - RETORNA DADOS QUE FORAM RELACIONADOS ENTRE 
##				 A TABELA DA ESQUERDA E QUE CONTEM RELAÇÃO 
#				 COM A TABELA DA DIREITA

select tblFilme.nome as nomeFilme, tblFilme.duracao,
	   tblFilme.dataLancamento, tblGenero.nome as nomeGenero
       from tblFilme inner join tblFilme_Genero
       on tblFilme.idFilme = tblFilme_Genero.idFilme
       inner join tblGenero on tblGenero.idGenero = 
       tblFilme_Genero.idGenero;


### LEFT JOIN - RETORNA DADOS QUE FORAM RELACIONADOS ENTRE 
##				 A TABELA DA ESQUERDA E QUE CONTEM RELAÇÃO 
#				 COM A TABELA DA DIREITA, PORÉM TAMBÉM RETORNA OS 
#				 DADOS DA TABELA DA ESQUERDA QUE NÃO FORAM 
#                RELACIONADOS COM A TABELA DA DIREITA

select tblFilme.nome as nomeFilme, tblFilme.duracao,
	   tblFilme.dataLancamento, tblGenero.nome as nomeGenero
       from tblFilme left join tblFilme_Genero
       on tblFilme.idFilme = tblFilme_Genero.idFilme
       left join tblGenero
       on tblGenero.idGenero = tblFilme_Genero.idGenero;



### RIGHT JOIN- RETORNA DADOS QUE FORAM RELACIONADOS ENTRE 
##				 A TABELA DA DIREITA E QUE CONTEM RELAÇÃO 
#				 COM A TABELA DA ESQUERDA, PORÉM TAMBÉM RETORNA OS 
#				 DADOS DA TABELA DA DIREITA QUE NÃO FORAM 
#                RELACIONADOS COM A TABELA DA ESQUERDA

select tblFilme.nome as nomeFilme, tblFilme.duracao,
	   tblFilme.dataLancamento, tblGenero.nome as nomeGenero
       from tblFilme right join tblFilme_Genero
       on tblFilme.idFilme = tblFilme_Genero.idFilme
       right join tblGenero
       on tblGenero.idGenero = tblFilme_Genero.idGenero;

# APLICANDO FULL JOIN NO MYSQL - COMO O MYSQL NÃO POSSUI O COMANDO FULL JOIN, 
#PARA REPRESENTAR ESSE RESULTADO É NECESSÁRIO UTILIZAR O COMANDO UNION.

# UNION ALL - CRIA UMA UNIÃO ENTRE DOIS SELECTS E PODE REPETIR INFORMAÇÕES
# UNION - CRIA UMA UNIÃO ENTRE DOIS SELECTS E NÃO REPETE INFORMAÇÕES

select tblFilme.nome as nomeFilme, tblFilme.duracao,
	   tblFilme.dataLancamento, tblGenero.nome as nomeGenero
       from tblFilme left join tblFilme_Genero
       on tblFilme.idFilme = tblFilme_Genero.idFilme
       left join tblGenero
       on tblGenero.idGenero = tblFilme_Genero.idGenero
UNION 
select tblFilme.nome as nomeFilme, tblFilme.duracao,
	   tblFilme.dataLancamento, tblGenero.nome as nomeGenero
       from tblFilme right join tblFilme_Genero
       on tblFilme.idFilme = tblFilme_Genero.idFilme
       right join tblGenero
       on tblGenero.idGenero = tblFilme_Genero.idGenero;

       
select * from tblFilme;
select * from tblGenero;
select * from tblFilme_Genero;