% Nome: Daniel Castro Neto Galhardo - Matricula : 201735022
% Nome: Camila CorrÃªa Vieira - Matricula: 201735006

% inicia :-  write('Testeasdasd').
% ?-inicia.



% Base de Dados.
% Dicionario.
:- dynamic (disciplina/1).
:- dynamic (curso/1).
:- dynamic(matriculado/2).

gradecienciaComp(cienciaComp, primeiroPeriodo) :- write('No primeiro periodo a grade consiste das materias'), nl, write('Algoritmos'), nl, write('Calculo'), nl, write('Logica').
gradecienciaComp(cienciaComp, segundoPeriodo) :- write('No segundo periodo a grade consiste das materias'), nl, write('Estrutura de Dados'), nl, write('Calculo II'), nl, write('Fisica I').
gradesistemasInfo(sistemasInfo, primeiroPeriodo) :- write('No primeiro periodo a grade consiste das materias'), nl, write('Algoritmos'), nl, write('Administracao'), nl, write('Logica').
gradesistemasInfo(sistemasInfo, segundoPeriodo) :- write('No segundo periodo a grade consiste das materias'), nl, write('Estrutura de Dados'), nl, write('Calculo II'), nl, write('Laboratorio Web').
gradesistemasinfo([algoritmos,calculo,logica]).

curso(cienciaComp):-   write('Ciencia da Computacao Ã© um curso ativo da UFJF - Presencial e Romoto').
curso(sistemasInfo):-  write('Sistemas de InformaÃ§Ã£o Ã© um curso ativo da UFJF - Presencial e Romoto').



% Matricula.
matriculado(X,cienciaComp, um):- aluno(X, um),matriculado(X, algoritmos, um),
matriculado(X, calculo, um),matriculado(X,logica, um).
matriculado(X,sistemasInfo, um):- matriculado(X, algoritmos, um),
matriculado(X, administracao, um), matriculado(X, logica, um).
matriculado(X,cienciaComp, dois):- aluno(X, dois), matriculado(X, estrutura_de_dados, dois),
matriculado(X, calculo_dois, dois),matriculado(X,algebra_linear, dois).
matriculado(X,sistemasInfo, dois):- matriculado(X, estrutura_de_dados, dois),
matriculado(X, laboratorio_web, dois), matriculado(X, calculo_dois, dois).
matriculado(X,Y,Z):- (aluno(X,Z) -> write(X),write(' esta matriculado no '),write('periodo:'),write(Z),write(' na materia: '),write(Y), nl).
matriculado(daniel,cienciaComp,um).
matriculado(camila,cienciaComp,um).
matriculado(joao,cienciaComp,um).
matriculado(marcos,cienciaComp,um).
matriculado(lucas,cienciaComp,um).
matriculado(alvaro,cienciaComp,um).
matriculado(jessica,cienciaComp,um).
matriculado(maria,cienciaComp,dois).
matriculado(marcio,cienciaComp,um).
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


aluno(maria,dois).
aluno(daniel,um).
aluno(joao,um).
aluno(marcos,um).
aluno(lucas,dois).
aluno(marcio,um).
aluno(ana,dois).
aluno(carol,um).




% menu


menu :- repeat,
  write('Escolha uma opcao:'),nl,
  write('1. Historico escolar de um estudante'),nl,
  write('2. Matriz curricular de um curso'),nl,
  read(Choice),
  write(Choice),

  break.

% aux matriculas
inserir :-
 write('Digite o curso que você deseja inserir um estudante [cienciaComp] ou [sistemasInfo]. '),
 read(X),
 write('Digite o primeiro nome do aluno que voce deseja inserir nesse curso:'), nl,
 read(Y),
 assert(matriculado(Y,X)).

deletar :-
 write('Digite o nome de quem você deseja desmatricular do curso entre aspas simples seguida de ponto.'), nl,nl,
 read(X),nl,
 write('Digite o nome do curso que você deseja desmatricular o aluno [cienciaComp] ou [sistemasInfo].'), nl, nl,
 read(Y), nl,
 retract(matriculado(X,Y)).

editar :- write('Digite o nome de quem você deseja editar a matricula'), nl,
    read(X),
    write('Digite o nome do curso que você quer editar da pessoa [cienciaComp] ou [sistemasInfo].'), nl, nl,
    read(Y), nl,
    retract(matriculado(X,Y)),
    write('Digite o nome do novo curso da pessoa [cienciaComp] ou [sistemasInfo]'),nl,
    read(Z),
    assert(matriculado(X,Z)).


% operacoes
consultarAprovacao(X, Y):- ( Y == 1 ->  aprovado(X,algoritmos), aprovado(X,logica), aprovado(X, calculo)
                           ; Y == 2 -> aprovado(X,estrutura_de_dados), aprovado(X, algebra_linear), aprovado(X, calculo_dois)
                           ).
nota(daniel, 69, algoritmos).
nota(daniel, 60, logica).
nota(daniel, 50, calculo).
nota(maria, 89, estrutura_de_dados).
nota(maria, 75, algebra_linear).
nota(maria, 89, calculo_dois).

aprovado(X, Y):- nota(X, Z , Y),
 ( Z > 59 -> write(X), write(' foi aprovado em '), write(Y), write(' com a nota:'), write(Z) ; write(X), write(' foi reprovado em '), write(Y), write(' com a nota:'), write(Z) ), nl.


ira(X,T):- ( T == 1 -> nota(X,Y,algoritmos), nota(X,Z,logica), nota(X,W,calculo), A is (Y+Z+W)/3 ,write(A)

           ; T == 2 -> nota(X,Y,estrutura_de_dados), nota(X,Z,algebra_linear), nota(X,W,calculo_dois), A is (Y+Z+W)/3 ,write(A)

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
 write('Digite a alteração no nome do aluno'), nl,
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

