:- consult('stammbaum.pl').
:- consult('readsentence.pl').
:- consult('lex.pl').

/*
 s: Satz
 vp: Verbalphrase
 np: Nominalphrase
 pp: Praepositionalphrase
 i: Interrogativpronomen
 pn: Eigenname
 Z: artikel
 n: Nomen
 v: Verbal
 p: Praeposition 
*/


frage :-
	read_sentence(X), frage_(X).
	
frage_(X) :-
	s([],Params2, X, []), !,
	[Func|_] = Params2, 
	(length(Params2,1); % keine Params
	length(Params2,2),	[_,A|_] = Params2;% 1 Param
	length(Params2,3),	[_,A|_] = Params2, [_,_,B|_] = Params2),%2 Params
	call(Func, A, B),
	write(B).
	

s(Params, Params3) --> vp(Params, Params2), np(Params2, Params3).	%Entscheidungsfrage
s(Params, Params3) --> i, vp(Params, Params2), np(Params2, Params3).	%Ergaenzungsfrage
s(Params, Params2) --> i, vp(Params, Params2).

np(Params, Params2) --> pn(Params, Params2).
np(Params, Params2) --> a, n(Params, Params2).
np(Params, Params3) --> a, n(Params, Params2), pp(Params2, Params3).

pp(Params, Params2) --> p, np(Params, Params2).

vp(Params, Params2) --> v, np(Params,Params2).
vp(_, _) --> v.


a --> [X], {lex(X,a,_,_)}.
i --> [X], {lex(X,i,_,_)}.
v --> [X], {lex(X,v,_,_)}.
n(Params, Params2) --> [X], {lex(X,n,_,_)}, {append([X], Params, Params2)}.
p --> [X], {lex(X,p,_,_)}.
pn(Params, Params2) --> [X], {lex(X,pn,_,_)}, {append(Params, [X], Params2)}.


