% Nome: Daniel Castro Neto Galhardo - Matricula : 201735022
% Nome: Camila Correa Vieira - Matricula: 201735006

% inicia :-  write('Testeasdasd').
% ?-inicia.

% Base de Dados.
% Dicionario.
:- dynamic (disciplina/3).
:- dynamic (curso/1).
:- dynamic(matriculado/2).
:- dynamic(materiaPeriodo/3).
:- dynamic(nota/3).
:- dynamic (aluno/3).
:- dynamic (ira/3).


%cursos ofertados

curso(cienciaComp):-   write('Ciencia da Computacao eh um curso ativo da UFJF - Presencial e Romoto').
curso(sistemasInfo):-  write('Sistemas de Informacao eh um curso ativo da UFJF - Presencial e Romoto').

%alunos

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


%nota alunos

nota(daniel, 69, algoritmos).
nota(daniel, 60, logica).
nota(daniel, 50, calculo).
nota(camila, 60, logica).
nota(camila, 69, algoritmos).
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

% historico escolar de um estudante.
historicoEscolar:-
 write('digite o nome do aluno'), nl,
    read(X),
 write('Materias cursadas pelo aluno: '), write(X), nota(X,_, Y), nl, write(Y), nl, fail.

% matriz curricular de um curso Z
exibeGrade(Z):- disciplina(X,Y,Z), write('Matéria:'), write(X), write(' Periodo: '), write(Y), write(' Curso:'), write(Z), nl, fail.

% 1)relacao de estudantes que ja cursaram uma dada disciplina
% 1.1 - sem criterio de nota
exibeAlunosDisciplina(Disciplina):-  nota(X,_,Disciplina), write('Nome do Aluno:'), write(X), nl, fail.

% 1.2 - com criterio de nota
exibeAlunosDisciplinaNota(Disciplina,Nota):- nota(X,Y, Disciplina), Y > Nota, aluno(X,_,_), write('Nome do Aluno:'), write(X), nl, fail.

% relacao de um estudante de um dado curso.
% sem criterio de ira.
exibeAlunos(Y):- aluno(X,Y,Z), write('Aluno:'), write(X),nl, write('Periodo:'),
write(Z),nl, write('Curso:'), write(Y), nl, fail.

% com criterio do ira
exibeAlunosIra(Z, Periodo, Valor):- aluno(X,Z,Y), ira(X,Periodo,W), W > Valor, write(' Aluno:'), write(X),nl, write('Periodo:'),
write(Y),nl, write('Curso:'), write(Z), nl, write(' IRA:'), write(W),nl, fail.

% relacao de cursos que contem uma dada disciplina
disciplinasCurso(Disciplina) :-  write('Cursos que contem a disciplina:'), write(Disciplina), disciplina(Disciplina,_,Y), nl, write(' '), write(Y), write(' '), fail.

ira(X,T,A):-( T == 1 ->  nota(X,Z,logica), nota(X,W,calculo), A is (Z+W)/3
           ; T == 2 -> nota(X,Y,estrutura_de_dados), nota(X,Z,algebra_linear), nota(X,W,calculo_dois), A is (Y+Z+W)/3
           ).

iraDois(X, A):- A is 69, nota(X,Y,_), Y  is Y+A.


men :- write('menu'),nl,
 write('0 sair do Menu'),nl,
 write('1 cursos'),nl,
 write('2 discipinas'),nl,
 write('3 estudantes'), read(Opcao),
 executar(Opcao).

menCursos :- write('menu'),nl,
 write('0 Voltar'),nl,
 write('1 cadastrar Curso'),nl,
 write('2 editar Curso'),nl,
 write('3 remover Curso'),nl,
 write('4 consultar curso'),nl,
 read(Opcao),
 executar1(Opcao).

 menEstudantes :- write('menu'),nl,
 write('0 Voltar'),nl,
 write('1 cadastrar Aluno'),nl,
 write('2 editar Aluno'),nl,
 write('3 remover Aluno'), nl,
 write('4 consultar materias cursadas Aluno'),nl,
 write('5 cadastrar nota do Aluno'), nl,
 write('6 consultar IRA do Aluno'), nl,
 write('7 consultar aluno'),nl,
 read(Opcao),
 executar2(Opcao).

 menDisciplinas :- write('menu'),nl,
 write('0 Voltar'),nl,
 write('1 cadastrar Disciplina'),nl,
 write('2 editar Disciplina'),nl,
 write('3 remover Disciplina'),nl,
 write('4 consultar Disciplina'),nl,
 read(Opcao),

 executar3(Opcao).


executar(Opcao) :- Opcao == 1, menCursos, men;
Opcao == 2, menDisciplinas, men;
Opcao == 3, menEstudantes, men;
Opcao ==0, true.

executar1(Opcao) :- Opcao == 1, cadastrarCurso, menCursos;
Opcao == 2, editarCurso, menCursos;
Opcao == 3, excluirCurso, menCursos;
Opcao == 4, consultarCurso, menCursos;
Opcao ==0, true.

executar2(Opcao) :- Opcao == 1, cadastrarEstudante, menEstudantes;
Opcao == 2, editarEstudante, menEstudantes;
Opcao == 3, excluirEstudante, menEstudantes;
Opcao == 4, historicoEscolar, menEstudantes;
Opcao == 5, incluirNota, menEstudantes;
Opcao == 5, incluirNota, menEstudantes;
Opcao == 6, consultarIra, menEstudantes;
Opcao == 7, consultarEstudante, menEstudantes;

Opcao ==0, true.

executar3(Opcao) :- Opcao == 1, cadastrarDisciplina, menDisciplinas;
Opcao == 2, editarDisciplina, menDisciplinas;
Opcao == 3, excluirDisciplina, menDisciplinas;
Opcao == 4, consultarDisciplina, menDisciplinas;

Opcao ==0, true.

cadastrarCurso :-
 write('Qual curso deseja cadastrar '), nl,
 read(X),
 write('Curso Cadastrado'), nl,
 assert(curso(X)).

editarCurso :-
     write('Qual curso deseja editar '), nl,
 read(X),
 retract(curso(X)),
 write('Digite a alteracao no nome do curso'), nl,
 read(Y),nl,
 assert(curso(Y)).

excluirCurso :-
     write('Qual curso deseja excluir '), nl,
 read(X),
 retract(curso(X)),
 write('Curso excluido'), nl.

cadastrarEstudante :-
 write('Qual aluno deseja cadastrar '), nl,
 read(X),
 write('Qual o curso do aluno?'), nl,
 read(Y),
 write('Qual o periodo do aluno?'), nl,
 read(Z),
 write('Aluno Cadastrado'), nl,
 assert(aluno(X,Y,Z)).

editarEstudante :-
 write('Qual aluno deseja editar '), nl,
 read(X),
 write('Qual o curso desse aluno?'), nl,
 read(Y),
 write('Qual o periodo desse aluno?'), nl,
 read(Z),
 retract(aluno(X,Y,Z)),
 write('Digite a alteracao no nome do aluno'), nl,
 read(W),nl,
 assert(aluno(W,Y,Z)).

excluirEstudante :-
 write('Qual aluno deseja excluir '), nl,
 read(X),
 write('Qual o curso desse aluno? '), nl,
 read(Y),
 retract(aluno(X,Y,_)),
 retractall(nota(X,_,_)),
 write('Aluno excluido'), nl.

cadastrarDisciplina:-
 write('Qual disciplina deseja cadastrar '), nl,
 read(X),
 write('De qual periodo é essa disciplina?'), nl,
 read(Y),
 write('Qual o curso dessa disciplina'), nl,
 read(Z),
 write('disciplina Cadastrada'), nl,
 assert(disciplina(X,Y,Z)).

editarDisciplina :-
 write('Qual disciplina deseja editar '), nl,
 read(X),
 write('De qual periodo é essa disciplina?'), nl,
 read(Y),
 write('Qual o curso dessa disciplina'), nl,
 read(Z),
 retract(disciplina(X,Y,Z)),
 write('Digite a alteracao no nome da disciplina'), nl,
 write(W),nl,
 assert(disciplina(W,Y,Z)).

excluirDisciplina :-
 write('Qual disciplina deseja excluir '), nl,
 read(X),
 write('De qual periodo é essa disciplina?'), nl,
 read(Y),
 write('Qual o curso dessa disciplina'), nl,
 read(Z),
 retract(disciplina(X,Y,Z)),
 retractall(nota(_,_,X)),
 write('Disciplina excluida'), nl.

incluirNota:-
  write('Para qual aluno deseja lançar nota? '), nl,
 read(X),
 write('Qual a materia que deseja lançar nota?'), nl,
 read(Y),
 write('Qual o valor da nota?'), nl,
 read(Z),
 assert( nota(X, Z, Y)).

consultarIra:-
  write('Qual aluno deseja consultar ira? '), nl,
 read(X),
 write('Qual o periodo desse aluno?'), nl,
 read(Y),
 assert(ira(X,Y,A)).

consultarCurso:-
  write('Qual curso deseja consultar? '), nl,
 read(X),
curso(X).

consultarEstudante:-
write('Qual aluno deseja consultar '), nl,
 read(X),
 write('Qual o curso desse aluno?'), nl,
 read(Y),
 write('Qual o periodo desse aluno?'), nl,
 read(Z),
 aluno(X,Y,Z).

consultarDisciplina:-
 write('Qual disciplina deseja consultar? '), nl,
 read(X),
 write('De qual periodo é essa disciplina?'), nl,
 read(Y),
 write('Qual o curso dessa disciplina'), nl,
 read(Z),
 disciplina(X,Y,Z).

