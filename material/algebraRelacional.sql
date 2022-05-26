aluno = {nr nome genero localidade curso
	1 ana f braga 1
	2 carlos m vila_verde 2
	3 joao m braga 2
	4 francisca f barcelos 1
	5 sonia f famalicao 1
	6 pedro m guimaraes 1
    7 rui m taipas 2
    8 joana f prado 3
    9 maria f povoa_lanhoso 3
    10 ramiro m braga 2
    11 sonia f guimaraes 1
    12 helena f ponte_lima 1
    13 paula f trofa 3
    14 xavier m caminha 1
    15 miguel m fafe 2
    16 luis m braga 4
}

atleta = {aluno, modalidade, escalao
	1 futsal 1
	2 andebol 2
	19 basquetebol 3
	14 basquetebol 3
	3 futsal 1
	6 tenis 3
	16 tenis 3
	11 squash 2
	4 atletismo 2 
}

curso = {id designacao sigla grau duracao
	1 mestrado_integrado_engenharia_informatica miei mestre 5
	2 licenciatura_ciencias_computacao lcc licenciado 3
	3 licenciatura_matematica lmat licenciado 3
	4 mestrado_economia mec mestre 2
}

disciplina = {id designacao responsavel
	1 engenharia_software 1
	2 engenharia_requisitos 2
	3 programacao_web 3
	4 programacao_funcional 1
	5 sistemas_analiticos 1
	6 bases_dados 1
}

professor = {id nome departamento
	1 josefino_pedras sistemas_informacao
	2 sofia_cantinho sistemas_informacao
	3 carlos_reis matematica
	4 paulo_amrtins economia
	5 antonio_pascoal informatica
	6 josefina_canto informatica
	7 patricia_rodrigues sistemas_informacao
	8 osvaldo_queiroz informatica
}

notas = {aluno disciplina nota data 
    1 1 15 20200901
    1 2 10 20200902
    2 1 18 20200903
    3 2 14 20200904
    4 1 13 20200901
    4 2 14 20200902
    4 3 17 20200903
    5 2 16 20200902
    6 1 11 20200902
	6 1 10 20200901
	7 2 13 20200904
	7 3 17 20200906
	8 4 18 20200907
	8 6 12 20200901
	10 6 14 20200902
	11 4 12 20200904
	13 2 17 20200907
	16 5 17 20200907
}

-- Quais os alunos com nr > 3?

-- σ nr>3 (aluno)
SELECT A.nr FROM aluno as A

-- Quais os alunos com nr menor ou igual a 3 no curso com id = 1?

-- σ nr<=3 (σ curso=1 (aluno))
SELECT nome FROM aluno 
	WHERE nr<=3 AND curso=1

-- Qual o nome dos alunos em sistema?

-- π nome (aluno)
 SELECT DISTINCT nome FROM aluno


-- Listagem dos alunos em sistema e os curso respectivos,

-- π nome,designacao ((aluno) ⨝ nr=id (curso))
 SELECT A.nome,C.designacao FROM aluno as A
			INNER JOIN curso as C on A.nr = C.id;

-- Listagem dos alunos com id = 1 em sistema e o curso respectivo.

-- π nome,designacao (σ id=1 ((aluno) ⨝ curso=id (curso)))
 SELECT A.nome,C.designacao FROM alunos as A
		 INNER JOIN curso as C on A.curso=C.id
	   WHERE id=1;

-- lista com o nome e desiganção do curso de todos os alunos com numero maior que 4 ordanda pelo nome dos alunos por ordem alfabética.

-- τ nome (π nome,designacao (σ nr>4 ((aluno) ⨝ curso=id (curso))))
 SELECT A.nome,C.designacao FROM alunos as A
		 INNER JOIN curso as C on A.curso=C.id
	 	 WHERE id>4
		 ORDER BY A.nome

-- lista dos numeros, nome e disciplinas de todos os em sistema que tenha realizado alguma disciplina ou não.
-- π nr,nome,disciplina ((aluno) ⟕ nr=aluno (notas))
 SELECT A.nr,N.nome,N.disciplina FROM aluno as A
	 LEFT OUTTER JOIN notas as N on A.nr = N.aluno; 


-- A media dos alunos em sistema.
-- γ nome; avg(nota)->media (π nome,nota ((aluno) ⨝ nr=aluno (notas)))

 SELECT A.nome,avg(N.nota) as media FROM notas as N
		 INNER JOIN aluno as A on N.aluno = A.nr
		 GROUP BY A.nome;

-- lista de alunos com o nr, nom e disciplica que não realizaram qualquer disciplina.
-- σ disciplina=null (π nr,nome,disciplina ((aluno) ⟕ nr=aluno (notas)))
