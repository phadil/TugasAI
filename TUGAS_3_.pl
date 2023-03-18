cowo(david).
cowo(jack).
cowo(john).
cowo(ray).
cowo(peter).

cewe(amy).
cewe(karen).
cewe(liza).
cewe(susan).
cewe(mary).

kawin(david, amy).
kawin(jack, karen).
kawin(john, susan).

bapa(david, liza).
bapa(david, john).
bapa(jack, susan).
bapa(jack, ray).
bapa(john, peter).
bapa(john, mary).

mamah(amy, liza).
mamah(amy, john).
mamah(karen, susan).
mamah(karen, ray).
mamah(susan, peter).
mamah(susan, mary).

bapaknya(X, Y) :-
	bapa(X, Y).

mamahnya(X, Y) :- 
	mamah(X, Y).

pasangannya(X, Y) :- 
	(kawin(X, Y) ; kawin(Y, X)).

orangtuanya(X, Y) :- 
	(bapa(X, Y) ; mamah(X, Y)).

anaknya(X, Y) :- 
	(bapa(Y, X) ; mamah(Y, X)).

saudaranya(Y, Z) :- 
	orangtuanya(X, Y), 
	orangtuanya(X, Z).

iparnya(X, Y) :- 
   	not(pasangannya(X,Y)),
    	((saudaranya(X, W),pasangannya(W, V)) ; pasangannya(X, V)),
    	saudaranya(V, Y).

kakeknya(X, Z) :- 
	bapa(X, Y), 
	anaknya(Z, Y).

neneknya(X, Z) :- 
	mamah(X, Y), 
	anaknya(Z, Y).

cucunya(X, Y) :- 
	(kakeknya(Y, X) ; neneknya(Y, X)).

omnya(X, Y) :- 
	cowo(X), saudaranya(X, Z), 
	anaknya(Y, Z).

tantenya(X, Y) :- 
	cewe(X), 
	saudaranya(X, Z), 
	anaknya(Y, Z).
