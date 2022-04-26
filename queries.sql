SELECT * FROM agiledb.colaborador;
SELECT * FROM agiledb.Tarefa;
SELECT * FROM agiledb.Equipa;


SELECT * FROM agiledb.colaborador
	ORDER BY anos_na_empresa DESC; 
    -- DESC / ASC

SELECT Nome,local_de_trabalho FROM agiledb.colaborador;
SELECT NOME,Area,anos_na_empresa
	FROM agiledb.colaborador
	WHERE IDcolab = 1
    ;
SELECT Nome,local_de_trabalho FROM agiledb.colaborador
	WHERE Nome = 'João Castro';
    
SELECT Nome,local_de_trabalho FROM agiledb.colaborador;
SELECT NOME,Area,anos_na_empresa
	FROM agiledb.colaborador
	WHERE IDcolab = 1
    ;
    
SELECT Nome,Area,local_de_trabalho,anos_na_empresa FROM agiledb.colaborador
    WHERE local_de_trabalho='Osaka'
		AND anos_na_empresa>=2;
        
-- juncao das tabelas cujas entradas do nome e do scrum master sao iguais
-- (ou seja nem todas as entradas das tabelas vao aparecer ao contrario dos atributos que vao aparecer todos )
   SELECT * FROM agiledb.colaborador AS C
		INNER JOIN agiledb.projeto AS P ON C.Nome=P.Scrum_master;
   -- possivel verificar a informacao da tarefa referente ao bug em questao
   SELECT * FROM agileDB.Seccao_bug AS S
		INNER JOIN agileDB.Tarefa AS T ON S.fk_Tarefa_ID=T.ID; 
        
   SELECT * FROM agileDB.Equipa AS A
		INNER JOIN agileDB.Projeto AS P ON A.fk_Projeto_IDprojeto=P.IDProjeto
		INNER JOIN agileDB.Colaborador AS C ON P.Scrum_master=C.Nome
        WHERE local_de_trabalho ='Osaka'
			AND anos_na_empresa>=2;         
            
   SELECT * FROM agileDB.Equipa AS A
		INNER JOIN agileDB.Projeto AS P ON A.fk_Projeto_IDprojeto=P.IDProjeto
		INNER JOIN agileDB.Colaborador AS C ON P.Scrum_master=C.Nome;
