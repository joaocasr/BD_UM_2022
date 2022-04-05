 -- Adição de informação à tabela COLABORADOR
 -- SELECT * FROM agiledb.colaborador;
 -- DROP TABLE agileDB.Colaborador;
INSERT INTO agileDB.Colaborador
(IDcolab,Nome,Area,local_de_trabalho,anos_na_empresa,fk_Colaborador_IDrevisor)
VALUES
(01,"João Castro","Desenvolvimento","Osaka",3,NULL),
(02,"Akahoshi Isoshi","Manutenção","Osaka",3,01),
(03,"Joaquin Phoenix","Desenvolvimento","Australia",2,01),
(04,"Yamasato Erika","Manutenção","Tokyo",1,02),
(05,"Ryusuke Hamaguchi","Manutenção","New York",2,03),
(06,"Nakatomi Masayoshi","Desenvolvimento","Osaka",2,04),
(07,"Shunji Iwai","Desenvolvimento","Osaka",2,01),
(08,"Faye Wong","Desenvolvimento","Beijing",2,04),
(09,"Jun Murakami","Manutenção","Braga",2,03),
(10,"Tony Leung","Desenvolvimento","Pequim",2,01);


 -- Adição de informação à tabela Projeto
 -- SELECT * FROM agiledb.Projeto;
 -- DROP TABLE agileDB.Projeto;
INSERT INTO agileDB.Projeto
(IDprojeto,estado,data_limite,Nome,descricao,Scrum_master)
VALUES
(01,"Manutenção",NULL,"MasterCook","Robot que ajuda na preparação de refeições","João Castro"),
(02,"Em desenvolvimento","22/05/2022","SlapBot","Robot que dá estaladas até acordar a pessoa","Joaquin Phoenix"),
(03,"Em desenvolvimento","03/10/2022","WashYourself","Máquina de lavar a louça telepática","Tony Leung"),
(04,"Manutenção",NULL,"openUP","Máquina que permite abrir qualquer tipo de lata","João Castro"),
(05,"Em desenvolvimento","12/02/2023","cleanUp","Robôt que permite limpar a sua casa por si","Joaquin Phoenix");

 -- Adição de informação à tabela Product Increment
 -- SELECT * FROM agiledb.Projseeto;
 -- DROP TABLE agileDB.Projeto;
INSERT INTO agileDB.Projeto
(PIID,Título,tempo_restante,fk_Projeto_IDprojeto)
VALUES
(01,"Manuseamento de Objetos","2 semanas",01),
(02,"Intensidade das chapadas","1 mês",02),
(03,"Em desenvolvimento","03/10/2022","WashYourself","Máquina de lavar a louça telepática","Tony Leung"),
(04,"Choques","6 semanas",05),
(05,"Em desenvolvimento","12/02/2023","cleanUp","Robôt que permite limpar a sua casa por si","Joaquin Phoenix");


UPDATE agiledb.colaborador
	SET fk_Colaborador_IDrevisor = 03
	WHERE IDcolab = 1;

DELETE FROM `agiledb`.`colaborador`
	WHERE IDcolab = 5;
          
SELECT Nome,local_de_trabalho FROM agiledb.colaborador;
SELECT NOME,Area,anos_na_empresa
	FROM agiledb.colaborador
	WHERE IDcolab = 1
    ;

