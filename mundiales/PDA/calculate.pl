:- consult(functions).
:- encoding(utf8).
	
/*my_length([], 0).
my_length([_|Xs], L):-
			write(L),
          my_length(Xs, L2),
		  write(L),
          L is L2 + 1.*/
	
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


	
	
	
	