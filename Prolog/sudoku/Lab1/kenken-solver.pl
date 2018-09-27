:- use_module(library(clpfd)).

sum_list([],0).
sum_list([Head|Tail], Sum):-
	sum_list(Tail, Tail_sum),
	Sum #= Sum + Tail_sum.