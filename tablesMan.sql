SELECT * FROM agiledb.colaborador;
DROP TABLE agiledb.colaborador;


 -- Adicionar informacao à tabela colaborador
INSERT INTO Colaborador
(IDcolab,
Nome,
Area,
local_de_trabalho,
anos_na_empresa)
VALUES
(
	1,
    "João Castro",
    "Desenvolvimento",
    "Osaka",
    3
),
(
	2,
    "Oliver Tsubasa",
    "Manutenção",
    "Osaka",
    3
),
(
	3,
    "Akahoshi Isoshi",
    "Desenvolvimento",
    "Kyoto",
    2
),
(
	4,
    "Yamasato Erika",
    "Manutenção",
    "Osaka",
    1
),
(
	5,
    "Mark Landers",
    "Manutenção",
    "New York",
    2
),
(
	6,
    "Nakatomi Masayoshi",
    "Desenvolvimento",
    "Osaka",
    2
);

DELETE FROM `agiledb`.`colaborador`
	WHERE IDcolab = 5;
          

INSERT INTO Colaborador
(IDcolab,
Nome,
Area,
local_de_trabalho,
anos_na_empresa)
VALUES
(
	5,
    "Mark Landers",
    "Manutenção",
    "Tokyo",
    2
);
-- UPDATE
/*
UPDATE `agiledb`.`colaborador`
SET
`IDcolab` = <{IDcolab: }>,
`Nome` = <{Nome: }>,
`Area` = <{Departamento: }>,
`local_de_trabalho` = <{local_de_trabalho: }>,
`anos_na_empresa` = <{anos_na_empresa: }>
WHERE `IDcolab` = <{expr}>;

DELETE FROM `agiledb`.`colaborador`
WHERE <{where_expression}>;

*/

