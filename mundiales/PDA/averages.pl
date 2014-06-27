:- consult(calculate).

%Averages		  

sum_goals([],0).		  
sum_goals([RowList|Others], Sum):-
	RowList = row(_,_,_,_,_,GoalHome,GoalAway,_),
	sum_goals(Others,Sum2),
	SumGoal is GoalHome + GoalAway,
	Sum is Sum2 + SumGoal.
	
sum_times_goals([],0).		  
sum_times_goals([RowList|Others], Sum):-
	RowList = row(_,_,_,_,Time,_),
	sum_goals(Others,Sum2),
	Sum is Sum2 + Time.		

avg_goals(Avg):-
	findall(M,allMatches(M),RowList),
	length(RowList, L),
	sum_goals(RowList, Sum),
	Avg is Sum / L.
	
avg_goal_time(Avg):-
	findall(G,allGoals(G),RowList),
	length(RowList, L),
	sum_times_goals(RowList, Sum),
	Avg is Sum / L.