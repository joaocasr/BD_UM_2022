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
 -- SELECT * FROM agiledb.Product_Increment;
 -- DROP TABLE agileDB.Product_Increment;
INSERT INTO agileDB.Product_Increment
(PIID,Título,tempo_restante,fk_Projeto_IDprojeto)
VALUES
(01,"Manuseamento de Objetos","2 semanas",01),
(02,"Intensidade das chapadas","1 mês",02),
(03,"Volume de água libertada","1 semana","03"),
(04,"Choques","1.5 mês",05),
(05,"Rotação da mão","5 dias","02");


 -- Adição de informação à tabela Sprint
 -- SELECT * FROM agiledb.Sprint;
 -- DROP TABLE agileDB.Sprint;
INSERT INTO agileDB.Sprint
(Número,data_inicial,data_fim,IDsprint,fk_Product_Increment_PIID,fk_Backlog_backlogID)
VALUES
(01,"02/05/2022","15/05/2022",1,01,01),
(02,"03/03/2022","12/03/2022",2,01,01),
(03,"20/04/2022","26/04/2022",3,02,02),
(04,"02/12/2021","11/12/2022",4,03,03),
(05,"08/11/2020","21/11/2020",5,03,02),
(06,"08/11/2021","18/11/2020",6,04,02),
(07,"11/02/2022","15/02/2022",7,05,04);


 -- Adição de informação à tabela Backlog
 -- SELECT * FROM agiledb.Backlog;
 -- DROP TABLE agileDB.Backlog;
INSERT INTO agileDB.Backlog
(backlogID,descricao,tipo,fk_Projeto_IDprojeto)
VALUES
(01,"Sprints realacionados com o controlo da temperatura de alimentos","Controlo",01),
(02,"Sprints relacionados com a frequência de chapadas","Controlo",02),
(03,"Sprints relacionados com o controlo de ações da máquina","Controlo","03"),
(04,"Sprints relacionados com os sensores do robot","Funcional","04");


 -- Adição de informação à tabela Equipa
 -- SELECT * FROM agiledb.Equipa;
 -- DROP TABLE agileDB.Equipa;
INSERT INTO agileDB.Equipa
(EquipaId,fk_Projeto_IDprojeto,designacao)
VALUES
(01,01,"Equipa A"),
(02,01,"Equipa B"),
(03,01,"Equipa C"),
(04,02,"Equipa D"),
(05,02,"Equipa E"),
(06,02,"Equipa F"),
(07,03,"Equipa G"),
(08,03,"Equipa H"),
(09,03,"Equipa I"),
(10,03,"Equipa J"),
(11,03,"Equipa K"),
(12,04,"Equipa L"),
(13,04,"Equipa M"),
(14,05,"Equipa N"),
(15,05,"Equipa O"),
(16,05,"Equipa P");


 -- Adição de informação à tabela Workpackage
 -- SELECT * FROM agiledb.Workpackage;
 -- DROP TABLE agileDB.Workpackage;
INSERT INTO agileDB.Workpackage
(IDworkpackage,data_de_criacao,duracao,fk_Equipa_EquipaId,fk_Backlog_backlogID)
VALUES
(01,"02/05/2022","13 dias",01,01),
(02,"02/05/2022","13 dias",02,02),	
(03,"03/03/2022","09 dias",03,01),	
(04,"20/04/2022","06 dias",01,02),	
(05,"20/04/2022","06 dias",01,02),	
(06,"20/04/2022","06 dias",01,02),	
(07,"20/04/2022","06 dias",01,02),	
(08,"20/04/2022","06 dias",01,02),	
(09,"20/04/2022","06 dias",01,02),	
(10,"13/03/2022","09 dias",01,03),	
(11,"13/03/2022","09 dias",01,03),	
(12,"13/03/2022","13 dias",01,04),
(13,"13/03/2022","10 dias",01,04),
(14,"13/03/2022","04 dias",01,04);


-- Adição de informação à tabela Tarefa
-- SELECT * FROM agiledb.Tarefa;
-- DROP TABLE agileDB.Tarefa;
INSERT INTO agileDB.Tarefa
(ID,Tstatus,descricao,fk_Workpackage_IDworkpackage,fk_Colaborador_IDcolab)
VALUES
(01,"Em progresso","Implementação do alerta do termostato",01,01),
(02,"Em progresso","Moviemento À LA Chef de facas e espátulas",02,02),
(03,"Em progresso","Medidor de resistência do equipamento para intensidades superiores a 5 Newtons",02,04),
(04,"Em progresso","Filtração de ondas eletromahnéticas",02,10),
(05,"Em progresso","Abertura de latas de atum",02,02);


-- Adição de informação à tabela Seccao_bug
-- SELECT * FROM agiledb.Seccao_bug;
-- DROP TABLE agileDB.Seccao_bug;
INSERT INTO agileDB.Seccao_bug
(codigo,Prioridade,descricao,fk_Tarefa_ID)
VALUES
(01,"Alta","O alerta do termostato é adicionado,porém a refeição fica queimada | possível problema de endereçamento(verificar método 'stopCooking')",01),
(02,"Média","O robot entra em loop infinito em relação ao número de chapadas quando o indivíduo não acorda por mais de 5 minutos",03),
(03,"Média","Máquinas praticam atos sexuais aquando pensamentos sexuais telepáticos do indivíduo | método 'notSexual' por terminar",04);

-- Adição de informação à tabela EquipaEColaborador
-- SELECT * FROM agiledb.EquipaEColaborador;
-- DROP TABLE agileDB.EquipaEColaborador;
INSERT INTO agileDB.EquipaEColaborador
(fk_Equipa_EquipaId,fk_Colaborador_IDcolab)
VALUES
(01,01),
(02,01),
(08,01),
(01,02),
(03,02),
(04,02),
(04,03),
(05,03),
(06,03),
(05,04),
(07,04),
(08,04),
(06,05),
(06,06),
(05,06),
(04,07),
(04,07),
(09,07),
(10,07),
(11,07),
(11,07),
(11,07),
(09,07),
(12,07),
(12,07),
(12,07),
(13,07),
(13,07),
(13,08),
(14,08),
(14,08),
(15,08),
(15,09),
(15,09),
(16,09),
(16,10),
(16,10);

UPDATE agiledb.colaborador
	SET fk_Colaborador_IDrevisor = 03
	WHERE IDcolab = 1;

DELETE FROM `agiledb`.`colaborador`
	WHERE IDcolab = 5;
