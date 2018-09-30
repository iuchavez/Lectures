:- use_module(library(clpfd)).
solve(Cages, S) :-
	length(S,6),
	S = [A, B, C, D, E, F],
	length(A,6),
	length(B,6),
	length(C,6),
	length(D,6),
	length(E,6),
	length(F,6),
    append(S, Values),
	Values ins 1..6,
    check_cages(Cages,S),
	maplist(all_different, S),
	transpose(S, Cols),
	maplist(all_different, Cols),
    maplist(label, S).

sum_list([],0).
sum_list([SumHead|SumTail], Sum):-
	sum_list(SumTail, Tail_sum),
	Sum #= SumHead + Tail_sum.

mult_list([A|[]], A).
mult_list([ProdHead|ProdTail], Prod):-
	mult_list(ProdTail, Tail_prod),
	Prod #= ProdHead * Tail_prod.

cell_values([], S, []).
cell_values([[H1,H2]|T],S,[ValueHead|ValueTail]):-
	nth0(H1, S, Row),
	nth0(H2, Row, ValueHead),
	cell_values(T, S, ValueTail).

check_cages([],S).
check_cages([H|T],S):-
	check_constraint(H,S),
	check_cages(T,S).

check_constraint(cage(id, Value, Cells), S):-
	cell_values(Cells, S, [Value]).
check_constraint(cage(add, Value, Cells), S):-
	cell_values(Cells, S, Values),
	sum_list(Values, Value).
check_constraint(cage(mult, Value, Cells), S):-
	cell_values(Cells, S, Values),
	mult_list(Values, Value).
check_constraint(cage(div, Value, Cells), S):-
	cell_values(Cells, S, [H1,H2]),
	(   Value #= H1//H2;
	Value #= H2//H1).
check_constraint(cage(sub, Value, Cells), S):-
	cell_values(Cells, S, [H1,H2]),
	(   Value #= H1-H2;
	Value #= H2-H1).

%% Input ////////

%% solve([
%% 	cage(mult,120,[[0,0],[0,1],[1,0],[0,2]]),
%% 	cage(mult,144,[[2,0],[2,1],[3,1],[4,1]]),
%% 	cage(id,4,[[3,0]]),
%% 	cage(add,6,[[4,0],[5,0]]),
%% 	cage(div,2,[[1,1],[1,2]]),
%% 	cage(div,3,[[5,1],[5,2]]),
%% 	cage(sub,3,[[2,2],[2,3]]),
%% 	cage(sub,4,[[3,2],[4,2]]),
%% 	cage(mult,15,[[0,3],[1,3]]),
%% 	cage(add,16,[[3,3],[4,3],[3,4],[3,5]]),
%% 	cage(mult,48,[[5,3],[5,4],[4,4]]),
%% 	cage(sub,3,[[0,4],[0,5]]),
%% 	cage(sub,1,[[1,4],[2,4]]),
%% 	cage(sub,5,[[1,5],[2,5]]),
%% 	cage(mult,6,[[4,5],[5,5]])
%% 	],S).

%% check_cages([
%%     cage(add,5,[[0,0],[0,1]]),
%%     cage(mult,2,[[0,2],[2,1],[1,1]]),
%%     cage(id,3,[[0,1]]),
%%     cage(div,2,[[1,2],[0,2]]),
%%     cage(id,3,[[2,2]])
%%     ],[[2,3,1],[3,1,2],[1,2,3]]).
