:- consult(functions).
:- consult(calculate).
			
insert_goal_score([]).
insert_goal_score([As|A]) :-
	row(G,N)=As,

	insert_leading_scorer(G,N);
	insert_goal_score(A).
	
			
a :-
	mundiales_connect,
	
	findall(R,leading_scorer_query(R),RowList),
	
	insert_goal_score(RowList),
	

	true.
	
	
	
	
