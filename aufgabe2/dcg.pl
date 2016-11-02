:- consult('stammbaum.pl').
:- consult('readsentence.pl').
:- consult('lex.pl').

//**
 s: Satz
 vp: Verbalphrase
 np: Nominalphrase
 pp: Praepositionalphrase
 i: Interrogativpronomen
 pn: Eigenname
 a: Artikel
 n: Nomen
 v: Verbal
 p: Praeposition 
**//


frage_(X) :-
	read_sentence(X), frage(X).
	
frage(X) :-
	s(X, []).

s --> vp, np.	%Entscheidungsfrage
s --> i, vp, np.	%Ergaenzungsfrage

np --> pn.
np --> a, n.
np --> a, n, pp.

pp --> p, np.
%pp --> REST

vp --> v.
vp --> v, np.

a --> [der].
i --> [wer].
v --> [ist].
n --> [bruder].
p --> [von].
pn --> lex(_,pn,__). %erg. in liste packen


