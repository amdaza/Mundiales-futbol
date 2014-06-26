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
	true.
	
parserResults(I1):-
	json_to_prolog(I1,PrologIn),	
    PrologIn = json(L),
	
	[NUMBER,LOCATION,DATE,SATATUS,HOMETEAM,AWAYTEAM,WINNER | A] = L,
    test(A1=A12) = test(NUMBER),
	test(A2=A22) = test(LOCATION),
	test(A4=A44) = test(SATATUS),
	test(A5=A55) = test(WINNER),
	insert_match(A12, A22,A44,hui,iii,3,2,ooo);
	true.
	

loadTeams :-
	mundiales_connect,
    http_get('http://worldcup.sfg.io/teams', JsonIn, []),
	
	 maplist(parserTeams, JsonIn),
	mundiales_disconnect.
	
a :-
	mundiales_connect,
    http_get('http://worldcup.sfg.io/matches', JsonIn, []),
	
	 maplist(parserResults, JsonIn),
	mundiales_disconnect.