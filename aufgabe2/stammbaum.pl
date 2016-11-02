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

married_(thomas,sarah).
married_(william,ann).
married_(stephen,beth).
married_(james,mary).
married_(steven,rose).
married_(alexander,norah).

parent(thomas,john).
parent(thomas,william).
parent(thomas,elizabeth).
parent(sarah,john).
parent(sarah,william).
parent(sarah,elizabeth).

parent(william,jack).
parent(william,stephen).
parent(william,george).
parent(william,linda).
parent(william,james).
parent(william,richard).
parent(ann,jack).
parent(ann,stephen).
parent(ann,george).
parent(ann,linda).
parent(ann,james).
parent(ann,richard).

parent(stephen,lisa).
parent(stephen,phillip).
parent(stephen,christine).
parent(fanny,lisa).
parent(beth,phillip).
parent(beth,christine).

parent(james,edith).
parent(james,caroline).
parent(james,steven).
parent(james,ethel).
parent(james,horace).
parent(james,ben).
parent(mary,edith).
parent(mary,caroline).
parent(mary,steven).
parent(mary,ethel).
parent(mary,horace).
parent(mary,ben).

parent(steven,alexander).

parent(rose,alexander).

custom_not(Goal) :- Goal,!, fail.
custom_not(_).

married(X,Y):-
	married_(X,Y);
	married_(Y,X).

not_married(X,Y):-
	not(married(X,Y)).
	
father(X,Y):-
	parent(X,Y),
	male(X).
	
mother(X,Y):-
	parent(X,Y),
	female(X).
	
siblings(X,Y):-
	father(A,X),
	father(A,Y),
	mother(B,X),
	mother(B,Y),
	not(X=Y).
	
test_siblings(X,Y):-
	custom_not(X=Y),
	father(A,X),
	father(A,Y),
	mother(B,X),
	mother(B,Y).

brother(X,Y):-
	siblings(X,Y),
	male(Y).
	
sister(X,Y):-
	siblings(X,Y),
	female(Y).
	
cousins(X,Y):-
	parent(A,X),
	parent(B,Y),
	siblings(A,B).
	
nephew(X,Y):-
	parent(A,X),
	siblings(Y,A),
	male(X).
	
half_sister(X,Y):-
	female(Y),
	father(A,X),
	father(A,Y),
	mother(B,X),
	mother(C,Y),
	not(B=C);
	female(Y),
	mother(A,X),
	mother(A,Y),
	father(B,X),
	father(C,Y),
	not(B=C).
	
aunt(X,Y):-
	female(X),
	parent(A,Y),
	siblings(X,A).
	
great_aunt(X,Y):-
	female(X),
	parent(A,Y),
	parent(B,A),
	siblings(X,B).