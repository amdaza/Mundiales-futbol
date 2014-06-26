:- use_module(library('http/json')).
:- use_module(library('http/json_convert')).
:- use_module(library('http/http_json')).
:- use_module(library('http/http_client')).
:- use_module(library('http/http_open')).

:- consult(funciones).
:- encoding(utf8).
	
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
	
parserEvent(Team, Match, Event):-	
	json_to_prolog(Event,PrologIn),	
    PrologIn = json(L),
	[IDEVENT,TYPE,PLAYER,TIME] = L,
	test(A1=IdEvent) = test(IDEVENT),
	test(A2=Type) = test(TYPE),
	test(A4=Player) = test(PLAYER),
	test(A5=Time) = test(TIME),
	atom_number(Time,TimeNumber),
	insert_event(IdEvent,Match,Type,Player,TimeNumber,Team);
	true.
	
parserEvents(HomeCode, MatchId,[]).	
parserEvents(HomeCode, MatchId, [Event | Rest]):-
	parserEvent(HomeCode, MatchId, Event),
	parserEvents(HomeCode, MatchId, Rest).
	
parserMatches(I1):-
	json_to_prolog(I1,PrologIn),	
    PrologIn = json(L),
	
	[NUMBER,LOCATION,DATE,STATUS,HOMETEAM,AWAYTEAM,WINNER,HOMEEVENTS,AWAYEVENTS] = L,
    test(_=MatchId) = test(NUMBER),
	test(_=A22) = test(LOCATION),
	test(_=A44) = test(STATUS),
	test(_=A55) = test(WINNER),
	test(_=A66) = test(HOMETEAM),  
	test(_=A99) = test(AWAYTEAM), 
	test(_=HomeEvents) = test(HOMEEVENTS),  
	test(_=AwayEvents) = test(AWAYEVENTS), 
	
	A66 = json(L1),	
	[COUNTRY,CODE,GOALS] = L1,	
	test(_=A77) = test(GOALS),
	test(_=HomeCode) = test(CODE),
	write(MatchId),
	parserEvents(HomeCode, MatchId, HomeEvents),
	
	A99 = json(L2),	
	[COUNTRY1,CODE1,GOALS1] = L2,	
	test(A91=A101) = test(GOALS1),
	test(A10=AwayCode) = test(CODE1),
	
	parserEvents(AwayCode, MatchId, AwayEvents),
	
	insert_match(MatchId, A22,A44,HomeCode,AwayCode,A77,A101,A55);
	true.
	

loadTeams :-
	mundiales_connect,
    http_get('http://worldcup.sfg.io/teams', JsonIn, []),
	
	 maplist(parserTeams, JsonIn),
	mundiales_disconnect.
	
loadMatches :-
	mundiales_connect,
    http_get('http://worldcup.sfg.io/matches', JsonIn, []),
	
	 maplist(parserMatches, JsonIn),
	mundiales_disconnect.