 insert into tblGenero (nome) values('Drama');
 
 insert into tblGenero (nome) values('Aventura'), ('Fantasia'), ('Policial'), ('Musical');
 
  insert into tblClassificacao (nome) values('+10'), ('+12'), ('+14'), ('+16'), ('+18'), ('livre');
  
  insert into tblFilme
  (nome, nomeOriginal, duracao,
  dataLancamento, dataRelancamento,
  sinopse, fotoCapa, idClassificacao, qtde) values
  ('UM SONHO DE LIBERDADE',
  'The Shawshank Redemption',
  '02:20:00',
  '1995-01-25',
  null,
  'Andy Dufresne faz amizade com Red, sofre as brutalidades da vida na cadeia, se adapta, ajuda os carcereiros.',
  'filme01.jpg',
  1,
  23);
  
  alter table tblFilme add column qtde INT;
  
    insert into tblFilme
  (nome, nomeOriginal, duracao,
  dataLancamento, dataRelancamento,
  sinopse, fotoCapa, idClassificacao, qtde) values
  ('À Espera de um Milagre',
  'The Green Mile',
  '03:09:00',
  '2000-03-10',
  null,
  'Andy Dufresne faz amizade com Red, sofre as brutalidades da vida na cadeia, se adapta, ajuda os carcereiros.',
  'filme02.jpg',
  1,
  1);
  
  insert into tblFilme_Diretor (idFilme, idDiretor)
  values (2,1);
         
insert into tblFilme_Roteirista (idFilme, idRoteirista)
  values (2,3),
		 (1,2),
         (1,1);
         
insert into tblFilme_Ator (idFilme, idAtor)
  values (2,1),
		 (2,5);
              

insert into tblFilme_Estudio (idFilme, idEstudio)
  values (2,2);
  
 insert into tblfilme_genero (idFilme, idGenero)
  values (4,1);
 
 update tblFilme set sinopse = 'Forrest Gump' where idFilme = 3;
 
 
 delete from tblFilme where idFilme = 4;
 
 select * from tblGenero;
  select * from tblFilme_Genero;
   select * from tblFilme;