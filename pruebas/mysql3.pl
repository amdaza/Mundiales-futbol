use_module(library(odbc)).

abrir_conexion:-
	odbc_connect('swiprolog',_,
				[user(root),
				password(''),
				alias(swiprolog),
				open(once)
				]).

cerrar_conexion:- 
	odbc_disconnect('swiprolog').

/*F devuelve 1 si se insertó correctamente*/					
inserta_datos(F):-
	odbc_query('swiprolog',
		'INSERT INTO datos (padre, hijo) VALUES ("funciona2", "yupi2")',
		affected(F)
		).
		
fila(X):- 
	odbc_query('swiprolog',
		'SELECT padre, hijo FROM datos', X,
		[types([string, default])]
		).
		
todo(R) :-
	odbc_query('swiprolog',
		'SELECT *FROM datos', 
		R).
		
actualiza(Y) :-
	odbc_query('swiprolog',
		'UPDATE datos SET padre="inserta", hijo = "wii"
			WHERE padre = "funciona"', 
			Y).
	
borra(Y) :-
	odbc_query('swiprolog',
		'DELETE FROM datos WHERE padre="pepe"', 
			Y).
	
padre(Padre,Hijo) :-
	odbc_query('swiprolog',
		'SELECT (padre), (hijo) FROM datos',
		row(Padre,Hijo)
		).
	
word_by_query(Pa, Hi) :-
	odbc_prepare('swiprolog',
		     'INSERT INTO datos (padre,hijo) VALUES (?,?)',
		     [ varchar,varchar ],
			 DataTypes,
		     Qid),
	odbc_execute(Qid, [Pa,Hi], row(Pa,Hi)),
	odbc_free_statement(Qid).
				


	
	
	