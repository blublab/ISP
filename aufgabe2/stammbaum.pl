male(thomas).

male(john).
male(william).

male(jack).
male(stephen).
male(george).
male(james).
male(richard).

male(phillip).
male(steven).
male(horace).
male(ben).

male(alexander).

female(sarah).

female(ann).
female(elizabeth).

female(fanny).
female(beth).
female(linda).
female(mary).

female(lisa).
female(christine).
female(edith).
female(caroline).
female(rose).
female(ethel).

female(norah).

verheiratet_(thomas,sarah).
verheiratet_(william,ann).
verheiratet_(stephen,beth).
verheiratet_(james,mary).
verheiratet_(steven,rose).
verheiratet_(alexander,norah).

eltern(thomas,john).
eltern(thomas,william).
eltern(thomas,elizabeth).
eltern(sarah,john).
eltern(sarah,william).
eltern(sarah,elizabeth).

eltern(william,jack).
eltern(william,stephen).
eltern(william,george).
eltern(william,linda).
eltern(william,james).
eltern(william,richard).
eltern(ann,jack).
eltern(ann,stephen).
eltern(ann,george).
eltern(ann,linda).
eltern(ann,james).
eltern(ann,richard).

eltern(stephen,lisa).
eltern(stephen,phillip).
eltern(stephen,christine).
eltern(fanny,lisa).
eltern(beth,phillip).
eltern(beth,christine).

eltern(james,edith).
eltern(james,caroline).
eltern(james,steven).
eltern(james,ethel).
eltern(james,horace).
eltern(james,ben).
eltern(mary,edith).
eltern(mary,caroline).
eltern(mary,steven).
eltern(mary,ethel).
eltern(mary,horace).
eltern(mary,ben).

eltern(steven,alexander).

eltern(rose,alexander).

custom_not(Goal) :- Goal,!, fail.
custom_not(_).

verheiratet(X,Y):-
	verheiratet_(X,Y);
	verheiratet_(Y,X).

not_verheiratet(X,Y):-
	not(verheiratet(X,Y)).
	
vater(X,Y):-
	eltern(X,Y),
	male(X).
	
mutter(X,Y):-
	eltern(X,Y),
	female(X).
	
geschwister(X,Y):-
	vater(A,X),
	vater(A,Y),
	mutter(B,X),
	mutter(B,Y),
	not(X=Y).
	
test_geschwister(X,Y):-
	custom_not(X=Y),
	vater(A,X),
	vater(A,Y),
	mutter(B,X),
	mutter(B,Y).

bruder(X,Y):-
	geschwister(X,Y),
	male(Y).
	
schwester(X,Y):-
	geschwister(X,Y),
	female(Y).
	
cousin(X,Y):-
	eltern(A,X),
	eltern(B,Y),
	geschwister(A,B).
	
neffe(X,Y):-
	eltern(A,X),
	geschwister(Y,A),
	male(X).
	
halb_schwester(X,Y):-
	female(Y),
	vater(A,X),
	vater(A,Y),
	mutter(B,X),
	mutter(C,Y),
	not(B=C);
	female(Y),
	mutter(A,X),
	mutter(A,Y),
	vater(B,X),
	vater(C,Y),
	not(B=C).
	
tante(X,Y):-
	female(X),
	eltern(A,Y),
	geschwister(X,A).
	
gross_tante(X,Y):-
	female(X),
	eltern(A,Y),
	eltern(B,A),
	geschwister(X,B).