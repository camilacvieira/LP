% Nome: Daniel Castro Neto Galhardo - Matricula : 201735022
% Nome: Camila Correa Vieira - Matricula: 201735006

% inicia :-  write('Testeasdasd').
% ?-inicia.



% Base de Dados.
% Dicionario.
:- dynamic (disciplina/1).
:- dynamic (curso/1).
:- dynamic(matriculado/2).
:- dynamic(materiaPeriodo/3).



exibeGrade(Z):- materiaPeriodo(X,Y,Z), write('Mat�ria:'), write(X), write(' Periodo: '), write(Y), write(' Curso:'), write(Z), nl, write('Pressione ; para buscar o proximo').
curso(cienciaComp):-   write('Ciencia da Computacao eh um curso ativo da UFJF - Presencial e Romoto').
curso(sistemasInfo):-  write('Sistemas de Informacao eh um curso ativo da UFJF - Presencial e Romoto').





% Materia.
% materiaPeriodo(pede_nome_materia, X,Y) -> rela��o de cursos que contem
% uma dada disciplina.
materiaPeriodo(algoritmos, um, cienciaComp).
materiaPeriodo(logica,um, cienciaComp).
materiaPeriodo(administracao, um, sistemasInfo).
materiaPeriodo(calculo, um, cienciaComp).
materiaPeriodo(algoritmos, um, sistemasInfo).
materiaPeriodo(logica,um, sistemasInfo).
materiaPeriodo(calculo, um, sistemasInfo).



% Matricula.
matriculado(X,cienciaComp, um):- aluno(X, cienciaComp, um),matriculado(X, algoritmos, um),
matriculado(X, calculo, um),matriculado(X,logica, um).
matriculado(X,sistemasInfo, um):- matriculado(X, algoritmos, um),
matriculado(X, administracao, um), matriculado(X, logica, um).
matriculado(X,cienciaComp, dois):- aluno(X,cienciaComp, dois), matriculado(X, estrutura_de_dados, dois),
matriculado(X, calculo_dois, dois),matriculado(X,algebra_linear, dois).
matriculado(X,sistemasInfo, dois):- matriculado(X, estrutura_de_dados, dois),
matriculado(X, laboratorio_web, dois), matriculado(X, calculo_dois, dois).
matriculado(X,Y,Z):- (aluno(X,_,Z) -> write(X),write(' esta matriculado no '),write('periodo:'),write(Z),write(' na materia: '),write(Y), nl).
matriculado(daniel,cienciaComp,um).
matriculado(camila,cienciaComp,um).
matriculado(joao,cienciaComp,um).
matriculado(marcos,cienciaComp,um).
matriculado(lucas,cienciaComp,um).
matriculado(alvaro,cienciaComp,dois).
matriculado(jessica,cienciaComp,dois).
matriculado(marcio,cienciaComp,dois).
matriculado(maria,cienciaComp,dois).
matriculado(josefa,cienciaComp,um).
matriculado(caio,sistemasInfo,um).
matriculado(ana, sistemasInfo,um).
matriculado(jose,sistemasInfo,um).
matriculado(jorge,sistemasInfo,um).
matriculado(marina,sistemasInfo,um).
matriculado(leandro,sistemasInfo,um).
matriculado(luan,sistemasInfo,um).
matriculado(jaqueline,sistemasInfo,um).
matriculado(andreia,sistemasInfo,um).
matriculado(guilherme,sistemasInfo,um).


%nota alunos
nota(daniel, 69, algoritmos).
nota(daniel, 60, logica).
nota(daniel, 50, calculo).
nota(camila, 69, algoritmos).
nota(camila, 60, logica).
nota(camila, 50, calculo).
nota(marcos, 96, algoritmos).
nota(marcos, 98, logica).
nota(marcos, 69, calculo).
nota(lucas, 39, algoritmos).
nota(lucas, 50, logica).
nota(lucas, 10, calculo).
nota(josefa, 89, algoritmos).
nota(josefa, 60, logica).
nota(josefa, 85, calculo).
nota(alvaro, 50, algoritmos).
nota(alvaro, 99, estrutura_de_dados).
nota(alvaro, 90, algebra_linear).
nota(alvaro, 80, calculo_dois).
nota(jessica, 99, estrutura_de_dados).
nota(jessica, 90, algebra_linear).
nota(jessica, 80, calculo_dois).
nota(maria, 85, algoritmos).
nota(maria, 74, logica).
nota(maria, 68, calculo).
nota(maria, 89, estrutura_de_dados).
nota(maria, 75, algebra_linear).
nota(maria, 89, calculo_dois).
nota(joao, 92, algoritmos).
nota(joao, 87, logica).
nota(joao, 75, calculo).
nota(marcio, 59, algoritmos).
nota(marcio, 70, logica).
nota(marcio, 40, calculo).


%disciplinas

disciplina(logica, um, cienciaComp).
disciplina(algoritmos, um, cienciaComp).
disciplina(calculo, um, cienciaComp).
disciplina(algoritmos, um, sistemasInfo).
disciplina(logica, um, sistemasInfo).
disciplina(administracao, um, sistemasInfo).
disciplina(estrutura_de_dados, dois, cienciaComp).
disciplina(estrutura_de_dados, dois, sistemasInfo).
disciplina(calculo_dois, dois, cienciaComp).
disciplina(calculo_dois, dois, sistemasInfo).
disciplina(algebra_linear, dois, cienciaComp).
disciplina(laboratorio_web, tres, sistemasInfo).
disciplina(teoria_dos_grafos, tres, sistemasInfo).
disciplina(teoria_dos_grafos, tres, cienciaComp).
disciplina(estrutura_dados_dois, tres, cienciaComp).
disciplina(estrutura_dados_dois, tres, sistemasInfo).
disciplina(calculo_tres, tres, cienciaComp).
disciplina(aspectos_teoricos, tres, sistemasInfo).



% matriz_curricular de um curso
disciplinasCurso(Disciplina) :-  write('Cursos que contem a disciplina:'), write(Disciplina), disciplina(Disciplina,_,Y), nl, write(' '), write(Y), write(' '), fail.
materiasCursadas(X):- write('Materias cursadas pelo aluno: '), write(X), nota(X,_, Y), nl, write(Y), nl, fail.
aluno(daniel,cienciaComp,um).
aluno(camila,cienciaComp,um).
aluno(joao,cienciaComp,um).
aluno(marcos,cienciaComp,um).
aluno(lucas,cienciaComp,um).
aluno(josefa,cienciaComp,um).
aluno(alvaro,cienciaComp,dois).
aluno(jessica,cienciaComp,dois).
aluno(marcio,cienciaComp,dois).
aluno(maria,cienciaComp,dois).
aluno(caio,sistemasInfo,um).
aluno(ana, sistemasInfo,um).
aluno(jose,sistemasInfo,um).
aluno(jorge,sistemasInfo,um).
aluno(marina,sistemasInfo,um).
aluno(leandro,sistemasInfo,um).
aluno(luan,sistemasInfo,um).
aluno(jaqueline,sistemasInfo,um).
aluno(andreia,sistemasInfo,um).
aluno(guilherme,sistemasInfo,um).
% Requisito: rela��o de estudantes de um curso.
exibeAlunos(Z):- aluno(X,Z,Y), write('Aluno:'), write(X),nl, write('Periodo:'),
write(Y),nl, write('Curso:'), write(Z).

exibeAlunosDisciplina(Disciplina):-  nota(X,_,Disciplina), write('Nome do Aluno:'), write(X).
exibeAlunosDisciplinaNota(Disciplina,Nota):- nota(X,Y, Disciplina), Y > Nota, aluno(X,_,_), write('Nome do Aluno:'), write(X).
exibeAlunosIra(Z, Periodo, Valor):- aluno(X,Z,Y), iraDois(X,Periodo,W), W > Valor, write(' Aluno:'), write(X),nl, write('Periodo:'),
write(Y),nl, write('Curso:'), write(Z), nl, write(' IRA:'), write(W).


%menu


menu :- repeat,
  write('Escolha uma opcao:'),nl,
  write('1. Historico escolar de um estudante'),nl,
  write('2. Matriz curricular de um curso'),nl,
  read(Choice),
  write(Choice),

  break.

% aux matriculas
inserir :-
 write('Digite o curso que voce deseja inserir um estudante [cienciaComp] ou [sistemasInfo]. '),
 read(X),
 write('Digite o primeiro nome do aluno que voce deseja inserir nesse curso:'), nl,
 read(Y),
 assert(matriculado(Y,X)).

deletar :-
 write('Digite o nome de quem voce deseja desmatricular do curso entre aspas simples seguida de ponto.'), nl,nl,
 read(X),nl,
 write('Digite o nome do curso que voce deseja desmatricular o aluno [cienciaComp] ou [sistemasInfo].'), nl, nl,
 read(Y), nl,
 retract(matriculado(X,Y)).

editar :- write('Digite o nome de quem voce deseja editar a matricula'), nl,
    read(X),
    write('Digite o nome do curso que voce quer editar da pessoa [cienciaComp] ou [sistemasInfo].'), nl, nl,
    read(Y), nl,
    retract(matriculado(X,Y)),
    write('Digite o nome do novo curso da pessoa [cienciaComp] ou [sistemasInfo]'),nl,
    read(Z),
    assert(matriculado(X,Z)).


% operacoes
consultarAprovacao(X, Y):- ( Y == 1 ->  aprovado(X,algoritmos), aprovado(X,logica), aprovado(X, calculo)
                           ; Y == 2 -> aprovado(X,estrutura_de_dados), aprovado(X, algebra_linear), aprovado(X, calculo_dois)
                           ).

aprovado(X, Y):- nota(X, Z , Y),
 ( Z > 59 -> write(X), write(' foi aprovado em '), write(Y), write(' com a nota:'), write(Z) ; write(X), write(' foi reprovado em '), write(Y), write(' com a nota:'), write(Z) ), nl.


ira(X,T,A):- ( T == 1 -> nota(X,Y,algoritmos), nota(X,Z,logica), nota(X,W,calculo), A is (Y+Z+W)/3 ,write('O ira de '), write(X), write(' eh:'), write(A)

           ; T == 2 -> nota(X,Y,estrutura_de_dados), nota(X,Z,algebra_linear), nota(X,W,calculo_dois), A is (Y+Z+W)/3 ,write(A)

           ).



iraDois(X,T,A):- ( T == 1 -> nota(X,Y,algoritmos), nota(X,Z,logica), nota(X,W,calculo), A is (Y+Z+W)/3
           ; T == 2 -> nota(X,Y,estrutura_de_dados), nota(X,Z,algebra_linear), nota(X,W,calculo_dois), A is (Y+Z+W)/3
           ).



%menus

men :- write('menu'),nl,
 write('0 sair do menu'),nl,
 write('1 cursos'),nl,
 write('2 discipinas'),nl,
 write('3 estudantes'), read(Opcao),
 executar(Opcao).

menCursos :- write('menu'),nl,
 write('0 sair do menu'),nl,
 write('1 cadastrar Curso'),nl,
 write('2 editar Curso'),nl,
 write('3 remover Curso'), read(Opcao),
 executar1(Opcao).

 menEstudantes :- write('menu'),nl,
 write('0 sair do menu'),nl,
 write('1 cadastrar Estudante'),nl,
 write('2 editar Estudante'),nl,
 write('3 remover Estudante'), read(Opcao),
 executar2(Opcao).

 menDisciplinas :- write('menu'),nl,
 write('0 sair do menu'),nl,
 write('1 cadastrar Disciplina'),nl,
 write('2 editar Disciplina'),nl,
 write('3 remover Disciplina'), read(Opcao),
 executar3(Opcao).


executar(Opcao) :- Opcao == 1, menCursos, men;
Opcao == 2, menDisciplinas, men;
Opcao == 3, menEstudantes, men;
Opcao ==0, true.

executar1(Opcao) :- Opcao == 1, cadastrarCurso, menCursos;
Opcao == 2, editarCurso, menCursos;
Opcao == 3, excluirCurso, menCursos;
Opcao ==0, true.

executar2(Opcao) :- Opcao == 1, cadastrarEstudante, menEstudantes;
Opcao == 2, editarEstudante, menEstudantes;
Opcao == 3, excluirEstudante, menEstudantes;
Opcao ==0, true.

executar3(Opcao) :- Opcao == 1, cadastrarDisciplina, menDisciplinas;
Opcao == 2, editarDisciplina, menDisciplinas;
Opcao == 2, excluirDisciplina, menDisciplinas;

Opcao ==0, true.

cadastrarCurso :-
 write('Qual curso deseja cadastrar '), nl,
 read(X),
 write('Curso Cadastrado'), nl,
 write(X),nl,
 assert(curso(X)).

editarCurso :-
     write('Qual curso deseja editar '), nl,
 read(X),
 retract(X),
 write('Digite a alteração no nome do curso'), nl,
 write(X),nl,
 assert(curso(X)).

excluirCurso :-
     write('Qual curso deseja excluir '), nl,
 read(X),
 retract(curso(X)),
 write('Curso excluido'), nl.

cadastrarEstudante :-
 write('Qual aluno deseja cadastrar '), nl,
 read(X),
 write('aluno Cadastrado'), nl,
 write(X),nl,
 assert(estudante(X)).

editarEstudante :-
     write('Qual aluno deseja editar '), nl,
 read(X),
 retractestudante((X)),
 write('Digite a alteracao no nome do aluno'), nl,
 write(X),nl,
 assert(estudante(X)).

excluirEstudante :-
     write('Qual aluno deseja excluir '), nl,
 read(X),
 retract(estudante(X)),
 write('Aluno excluido'), nl.

cadastrarDisciplina:-
 write('Qual disciplina deseja cadastrar '), nl,
 read(X),
 write('disciplina Cadastrada'), nl,
 write(X),nl,
 assert(disciplina(X)).

editarDisciplina :-
     write('Qual disciplina deseja editar '), nl,
 read(X),
 retract(disciplina(X)),
 write('Digite a alteração no nome da disciplina'), nl,
 write(Y),nl,
 assert(disciplina(Y)).

excluirDisciplina :-
     write('Qual disciplina deseja excluir '), nl,
 read(X),
 retract(disciplina(X)),
 write('Disciplina excluida'), nl.

