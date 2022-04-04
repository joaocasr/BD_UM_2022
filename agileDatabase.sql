-- MySQL Script generated by MySQL Workbench
-- Tue Mar 29 16:55:22 2021
-- Model: AGILE EER Diagram

CREATE DATABASE agileDB
	DEFAULT CHARSET = utf8mb4
	DEFAULT ENCRYPTION = 'N';
    
-- -----------------------------------------------------
-- Schema agileDB
-- -----------------------------------------------------

USE agileDB;

-- ---------------------------------------------------------------
-- Table `Colaborador` - Tabela de colaboradores
-- ---------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Colaborador (
    IDcolab INT NOT NULL,
    Nome VARCHAR(45),
    Area VARCHAR(20),
    local_de_trabalho VARCHAR(20),
    anos_na_empresa INT NOT NULL,
    fk_Colaborador_IDrevisor INT NOT NULL,
		PRIMARY KEY(IDcolab),
        FOREIGN KEY(fk_Colaborador_IDrevisor) REFERENCES Colaborador(IDcolab)
)
	ENGINE = InnoDB;


/*
ALTER TABLE colaborador,
	DROP COLUMN 'anos_na_empresa'
    ADD COLUMN 'anos_na_empresa' INT
    
-- -------------------------------------------------------------------------------------
-- Table `Projeto` - Tabela correspondente aos projetos da empresa
-- -------------------------------------------------------------------------------------

*/
CREATE TABLE IF NOT EXISTS Projeto (
	IDprojeto INT NOT NULL,
    status VARCHAR(20),
    descricao VARCHAR(20),
    Scrum_master VARCHAR(20),
    fk_Sprint_IDsprint INT NOT NULL,
		PRIMARY KEY(IDprojeto)
);

CREATE TABLE IF NOT EXISTS Product_Increment (
    Título VARCHAR(15),
    tempo_restante VARCHAR(30),
    PIID INT NOT NULL,
    fk_Projeto_IDprojeto INT NOT NULL,
		PRIMARY KEY(PIID),
		FOREIGN KEY(fk_Projeto_IDprojeto) REFERENCES Projeto_Backlog(IDprojeto)
);

-- -------------------------------------------------------------------------------------
-- Table `Sprint` - Tabela de um sprint 
-- -------------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Sprint (
    Número INT NOT NULL,
    data_inicial VARCHAR(20),
    data_fim VARCHAR(20),
    IDsprint INT NOT NULL,
	fk_Product_Increment_PIID INT NOT NULL,
		PRIMARY KEY(IDsprint),
        FOREIGN KEY(fk_Product_Increment_PIID) REFERENCES Product_Increment(PIID)
);

CREATE TABLE Backlog (
    backlogID INT NOT NULL,
    descricao TEXT,
    tipo VARCHAR(20),
    fk_Projeto_IDprojeto INT NOT NULL,
		 PRIMARY KEY(backlogID),
         FOREIGN KEY(fk_Projeto_IDprojeto) REFERENCES Projeto(IDprojeto)
);

CREATE TABLE IF NOT EXISTS Equipa (
    EquipaId INT NOT NULL,
    fk_Projeto_IDprojeto INT NOT NULL,
    designacao VARCHAR(20),
		PRIMARY KEY(EquipaId),
        FOREIGN KEY(fk_Projeto_IDprojeto) REFERENCES Projeto(IDprojeto)
);

CREATE TABLE IF NOT EXISTS Workpackage (
	IDworkpackage INT NOT NULL,
    data_de_criacao VARCHAR(20),
    duracao VARCHAR(20),
    fk_Equipa_EquipaId INT NOT NULL,
    fk_Backlog_backlogID INT NOT NULL,
		PRIMARY KEY(IDworkpackage),
		FOREIGN KEY(fk_Equipa_EquipaId) REFERENCES Equipa(EquipaId),
		FOREIGN KEY(fk_Backlog_backlogID) REFERENCES Backlog(backlogID)
);

    
CREATE TABLE IF NOT EXISTS Tarefa (
    ID INT NOT NULL,
    status VARCHAR(20),
    descricao TEXT,
    fk_Workpackage_IDworkpackage INT NOT NULL,
    fk_Colaborador_IDcolab INT NOT NULL,
		PRIMARY KEY(ID),
        FOREIGN KEY(fk_Workpackage_IDworkpackage) REFERENCES Workpackage(IDworkpackage),
        FOREIGN KEY(fk_Colaborador_IDcolab) REFERENCES Colaborador(IDcolab)
);


CREATE TABLE IF NOT EXISTS Seccao_bug (
    Prioridade VARCHAR(20),
    codigo INT NOT NULL,
    descricao TEXT,
    fk_Tarefa_ID INT NOT NULL,
		PRIMARY KEY(codigo),
        FOREIGN KEY(fk_Tarefa_ID) REFERENCES Tarefa(ID)
);

CREATE TABLE IF NOT EXISTS EquipaEColaborador (
    fk_Equipa_EquipaId INT NOT NULL,
    fk_Colaborador_IDcolab INT NOT NULL,
		FOREIGN KEY(fk_Equipa_EquipaId) REFERENCES Equipa_Workpackage(EquipaId),
        FOREIGN KEY(fk_Colaborador_IDcolab) REFERENCES Colaborador(IDcolab)
);
