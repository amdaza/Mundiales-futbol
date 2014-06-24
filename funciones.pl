use_module(library(odbc)).

abrir_conexion:-
	odbc_connect('mundiales',_,
				[user(root),
				password(''),
				alias(mundiales),
				open(once)
				]).

cerrar_conexion:- 
	odbc_disconnect('mundiales').


	
	