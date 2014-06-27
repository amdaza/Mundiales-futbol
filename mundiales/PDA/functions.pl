use_module(library(odbc)).

mundiales_connect:-
	odbc_connect('mundiales',_,
				[user(root),
				password(''),
				alias(mundiales),
				open(once)
				]),
	odbc_set_connection(mundiales,encoding(utf8) ).

mundiales_disconnect:- 
	odbc_disconnect('mundiales').

insert_team(Fifa_code, Country, Group_id) :-
	odbc_prepare('mundiales',
		     'INSERT INTO teams (fifa_code,country,group_id) VALUES (?,?,?)',
		     [ varchar,varchar,integer],
		     Qid),
	odbc_execute(Qid, [Fifa_code, Country, Group_id], row(Fifa_code, Country, Group_id)),
	odbc_free_statement(Qid).
	
insert_match(Match_number, Location, Status,Home_Team,Away_Team,Goal_Home,Goal_Away,Winner) :-
	odbc_prepare('mundiales',
		     'INSERT INTO matches (match_number, location,status,home_team,away_team,goal_home,goal_away,winner) VALUES (?,?,?,?,?,?,?,?)',
		     [ integer,varchar,varchar,varchar,varchar,integer,integer,varchar],
		     Qid),
	odbc_execute(Qid, [Match_number, Location, Status,Home_Team,Away_Team,Goal_Home,Goal_Away,Winner], row(Match_number, Location, Status,Home_Team,Away_Team,Goal_Home,Goal_Away,Winner)),
	odbc_free_statement(Qid).
	
insert_event(IdEvent,Match,Type,Player,Time,Team) :-
	odbc_prepare('mundiales',
       'INSERT INTO events (id_event,match_number,type,player,time,team) VALUES (?,?,?,?,?,?)',
       [ integer,integer,varchar,varchar,integer,varchar],
       Qid),
	odbc_execute(Qid, [IdEvent,Match,Type,Player,Time,Team], 
	row(IdEvent,Match,Type,Player,Time,Team)),
 odbc_free_statement(Qid).
 
allMatches(R) :-
	odbc_query('mundiales',
				'SELECT * FROM matches', 
				R).
				
 

 allGoals(R) :-
	odbc_query('mundiales',
				'SELECT * FROM events WHERE 
				type LIKE "%goal%"', 
				R).

leading_scorer_query(R) :-
	odbc_query('mundiales','SELECT count(*) as c, player FROM events WHERE (type="goal" or type="goal-penalty") GROUP BY player ORDER BY c desc',R).

 
 
 insert_leading_scorer(G,N):-
	odbc_prepare('mundiales',
       'INSERT INTO leading_scorer (goals,name) VALUES (?,?)',
       [integer,varchar],
       Qid),
	odbc_execute(Qid, [G,N], 
	row(IdEvent,Match,Type,Player,Time,Team)),
 odbc_free_statement(Qid).
 
 