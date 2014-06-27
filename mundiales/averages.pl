:- consult(calculate).

%Averages		  

sum_goals([],0).		  
sum_goals([RowList|Others], Sum):-
write(RowList),
	RowList = row(_,_,_,_,_,GoalHome,GoalAway,_),
	
	Sum is Sum + GoalHome,
	Sum is Sum + GoalAway,
	sum_goals(Others,Sum).
	
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