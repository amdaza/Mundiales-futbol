:- use_module(library('http/json')).
:- use_module(library('http/json_convert')).
:- use_module(library('http/http_json')).
:- use_module(library('http/http_client')).
:- use_module(library('http/http_open')).

:- consult(funciones).

	
parserTeams(I1):-
	json_to_prolog(I1,PrologIn),	
    PrologIn = json(L),
	
	[A,B,C,D] = L,
    test(AP=AS) = test(A),
	test(BP=BS) = test(B),
	test(CP=CS) = test(C),
	test(DP=DS) = test(D),
	
	insert_team(CS, AS, DS);
	test(DP=DS) = test(D).
	
parserResults(I1):-
	json_to_prolog(I1,PrologIn),	
    PrologIn = json(L),
	
	[NUMBER,LOCATION,DATE,SATATUS,HOMETEAM,AWAYTEAM,WINNER | A] = L,
    test(A1=A12) = test(NUMBER),
	test(A2=A22) = test(LOCATION),
	test(A3=A33) = test(DATE),
	test(A4=A44) = test(SATATUS),
	test(A5=A55) = test(WINNER),
	%insert_matches(A12, A22, A33,A44,'ARG','ALG',3,2,'ARG'),
	write(A1),
	write(A22).
	

loadTeams :-
	mundiales_connect,
    http_get('http://worldcup.sfg.io/teams', JsonIn, []),
	
	 maplist(parserTeams, JsonIn),
	mundiales_disconnect.
	
a :-
	mundiales_connect,
    http_get('http://worldcup.sfg.io/teams/results', JsonIn, []),
	
	 maplist(parserResults, JsonIn),
	mundiales_disconnect.