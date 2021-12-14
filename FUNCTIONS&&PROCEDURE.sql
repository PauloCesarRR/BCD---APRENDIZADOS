# VIEW -> SELECT -> NÃO TRABALHA COM PASSAGEM DE PARAMETROS

# PROCEDURE -> { INSERT, DELETE, UPDATE E SELECT }
#  -> CONDIÇÕES, REPETIÇÕES E VARIAVEIS

# FUNCTIONS -> LÓGICA

#FUNCTIONS

# deterministic - Para Especificar que o retorno da função será o 
# mesmo da entrada de argumentos(caso houver)

# not deterministic - Para Especificar que o retorno da função será diferente do 
# tipo de dados da entrada o de argumentos(caso houver)

# DELIMITER -> Especifica qual será o simbolo para encerramento de uma function
DELIMITER $$


create function saudacao()   
	returns char(15) # Define o tipo de dados de retorno da function
    deterministic
		BEGIN
 
			 declare horaAtual time;
             declare hora char(2);
             declare mensagem char(10);
             
		set horaAtual = curtime();
        set hora = hour(horaAtual);
        
        if hora >=5 and hora < 12 then
			set mensagem = 'Bom dia';
		elseif hora >=12 and hora < 18 then
			set mensagem = 'Boa tarde';
		elseif hora >=18 and hora <= 23 then
			set mensagem = 'Boa noite';
		elseif hora > 23 and hora < 5 then
			set mensagem = 'Vai dormir';
        end if;
        
        return mensagem;
        
		END $$
        
        select saudacao() as mensagem;
        
         drop function saudacao;
         
         
## PROCEDURES

## IN - utiliza quando apenas teremos a chegada de argumentos
## OUT - utilizado quandp a procedure terá apenas retorno saída
## INOUT - utilizado quando temos entrada de argumentos e retorno de saída


DELIMITER $$

create procedure procListarFilmes (IN idGenero int)
	BEGIN
    
    if idGenero > 0 then
		select tblFilme.nome as nomeFilme, tblFilme.dataLancamento, 
		tblGenero.nome as nomeGenero
			from tblFilme
			inner join tblFilme_Genero
				on tblFilme.idFilme = tblFilme_Genero.idFilme
			inner join tblGenero
				on tblGenero.idGenero = tblFilme_Genero.idGenero
		where tblGenero.idGenero = idGenero;
	
	elseif idGenero = 0 then
		select tblFilme.nome as nomeFilme, tblFilme.dataLancamento, 
		tblGenero.nome as nomeGenero
		from tblFilme
		inner join tblFilme_Genero
			on tblFilme.idFilme = tblFilme_Genero.idFilme
		inner join tblGenero
			on tblGenero.idGenero = tblFilme_Genero.idGenero;
    end if;
    
    END $$
    
    call procListarFilmes(1);

 
    
    
   
         
         

