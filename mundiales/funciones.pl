use_module(library(odbc)).

mundiales_connect:-
	odbc_connect('mundiales',_,
				[user(root),
				password(''),
				alias(mundiales),
				open(once)
				]).

mundiales_disconnect:- 
	odbc_disconnect('mundiales').

insert_team(Fifa_code, Country, Group_id) :-
	odbc_prepare('mundiales',
		     'INSERT INTO teams (fifa_code,country,group_id) VALUES (?,?,?)',
		     [ varchar,varchar,integer],
		     Qid),
	odbc_execute(Qid, [Fifa_code, Country, Group_id], row(Fifa_code, Country, Group_id)),
	odbc_free_statement(Qid).
	
	