:- consult(funciones).
:- encoding(utf8).
	
my_length([], L, L).
my_length([_|Xs], N, L):-
          N2 is N + 1,
          my_length(Xs, N2, L).
	
my_n_element([Y|_], N, N, Y).
my_n_element([_|Xs], I, N, Y):-
          I2 is I + 1,
          my_n_element(Xs, I2, N, Y).
	
my_sum_elements([], S, S).
my_sum_elements([X|Xs], T, S):-
          T2 is T + X,
          my_sum_elements(Xs, T2, S).	
	
	
my_average(Xs, A):-
          my_length(Xs, L),
          my_sum_elements(Xs, S),
          A is S / L.


sum_goals([],0).		  
sum_goals([RowList|Others], Sum):-
	row(_,_,_,_,_,GoalHome,GoalAway,_),
	Sum is GoalHome + GoalAway,
	sum_goals(Others,Sum).
	



avg_goals(Avg):-
	findall(M,allMatches(M),RowList),
	sum_goals(RowList).