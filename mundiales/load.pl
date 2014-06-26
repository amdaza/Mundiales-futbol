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
	
parserEvent(Team, Match, Event):-	
	json_to_prolog(Event,PrologIn),	
    PrologIn = json(L),
	[IDEVENT,TYPE,PLAYER,TIME] = L,
	test(A1=IdEvent) = test(IDEVENT),
	test(A2=Type) = test(TYPE),
	test(A4=Player) = test(PLAYER),
	test(A5=Time) = test(TIME),
	insert_event(IdEvent,Match,Type,Player,Time,Team);
	true.
	
parserEvents(HomeCode, MatchId,[]).	
parserEvents(HomeCode, MatchId, [Event | Rest]):-
	parserEvent(Team, Match, Event),
	parserEvents(Team, Match, Rest).
	
parserMatches(I1):-
	json_to_prolog(I1,PrologIn),	
    PrologIn = json(L),
	
	[NUMBER,LOCATION,DATE,STATUS,HOMETEAM,AWAYTEAM,WINNER,HOMEEVENTS,AWAYEVENTS] = L,
    test(A1=MatchId) = test(NUMBER),
	test(A2=A22) = test(LOCATION),
	test(A4=A44) = test(STATUS),
	test(A5=A55) = test(WINNER),
	test(A6=A66) = test(HOMETEAM),  
	test(A9=A99) = test(AWAYTEAM), 
	test(A7=HomeEvents) = test(HOMEEVENTS),  
	test(A8=AwayEvents) = test(AWAYEVENTS), 
	
	A66 = json(L1),	
	[COUNTRY,CODE,GOALS] = L1,	
	test(A7=A77) = test(GOALS),
	test(A8=HomeCode) = test(CODE),

	parserEvents(HomeCode, MatchId, HomeEvents);
	
	A99 = json(L2),	
	[COUNTRY1,CODE1,GOALS1] = L2,	
	test(A91=A101) = test(GOALS1),
	test(A10=AwayCode) = test(CODE1),
	
	parserEvents(AwayCode, MatchId, AwayEvents);
	
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