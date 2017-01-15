:- consult(calculate).

%Averages	

sum_goals([],0).		  
sum_goals([RowList|Others], Sum1):-
	write(RowList),
	RowList = row(A,B,C,D,E,GoalHome,GoalAway,F),
	write(GoalHome),
	write(GoalAway),
	Sum2 is GoalAway + GoalHome,
	write(Sum2),
	Sum3 is Sum1 + Sum2,
	sum_goals(Others,Sum3).
	
sum_times_goals([],0).		  
sum_times_goals([RowList|Others], Sum):-
	RowList = row(_,_,_,_,Time,_),
	Sum is Sum + Time,
	sum_goals(Others,Sum).		

avg_goals(Avg):-
	findall(M,allMatches(M),RowList),
	write(RowList),
	length(RowList, L),
	write(L),
	sum_goals(RowList, Sum),
	Avg is Sum / L.
	
avg_goal_time(Avg):-
	List = findall(G,allGoals(G),RowList),
	length(List, Lenght),
	S is sum_times_goals(RowList),
	Avg is S / Lenght.