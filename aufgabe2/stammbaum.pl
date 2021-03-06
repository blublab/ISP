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

eltern(john,thomas).
eltern(william,thomas).
eltern(elizabeth,thomas).
eltern(john,sarah).
eltern(william,sarah).
eltern(elizabeth,sarah).

eltern(jack,william).
eltern(stephen,william).
eltern(george,william).
eltern(linda,william).
eltern(james,william).
eltern(richard,william).
eltern(jack,ann).
eltern(stephen,ann).
eltern(george,ann).
eltern(linda,ann).
eltern(james,ann).
eltern(richard,ann).

eltern(lisa,stephen).
eltern(phillip,stephen).
eltern(christine,stephen).
eltern(lisa,fanny).
eltern(phillip,beth).
eltern(christine,beth).

eltern(edith,james).
eltern(caroline,james).
eltern(steven,james).
eltern(ethel,james).
eltern(horace,james).
eltern(ben,james).
eltern(edith,mary).
eltern(caroline,mary).
eltern(steven,mary).
eltern(ethel,mary).
eltern(horace,mary).
eltern(ben,mary).

eltern(alexander,steven).

eltern(alexander,rose).

custom_not(Goal) :- Goal,!, fail.
custom_not(_).

verheiratet(X,Y):-
        verheiratet_(X,Y);
        verheiratet_(Y,X).

not_verheiratet(X,Y):-
        not(verheiratet(X,Y)).
        
ehemann(X,Y):-
        verheiratet(X,Y),
        male(Y).
        
ehefrau(X,Y):-
        verheiratet(X,Y),
        female(Y).
        
vater(X,Y):-
        eltern(X,Y),
        male(Y).
        
mutter(X,Y):-
        eltern(X,Y),
        female(Y).
        
geschwister(X,Y):-
        vater(X,A),
        vater(Y,A),
        mutter(X,B),
        mutter(Y,B),
        not(X=Y).

kind(X,Y):-
        eltern(Y,X).
        
sohn(X,Y):-
        eltern(Y,X),
        male(Y).
        
tochter(X,Y):-
        eltern(Y,X),
        female(Y).
        
bruder(X,Y):-
        geschwister(X,Y),
        male(Y).
        
schwester(X,Y):-
        geschwister(X,Y),
        female(Y).

        
grossvater(X,Y):-
        eltern(X,A),
        vater(A,Y).
        
grossmutter(X,Y):-
        eltern(X,A),
        mutter(A,Y).
        
cousin(X,Y):-
        eltern(A,X),
        eltern(B,Y),
        geschwister(A,B),
        male(Y).
        
cousine(X,Y):-
        eltern(A,X),
        eltern(B,Y),
        geschwister(A,B),
        female(Y).
        
neffe(X,Y):-
        geschwister(X,A),
        sohn(A,Y).
        
nichte(X,Y):-
        geschwister(X,A),
        tochter(A,Y).
        
halbschwester(X,Y):-
        (female(Y),
        vater(X,A),
        vater(Y,B),
        mutter(X,C),
        mutter(Y,C),
        A\=B);
        (female(Y),
        vater(X,A),
        vater(Y,A),
        mutter(X,B),
        mutter(Y,C),
        B\=C).
        
onkel(X,Y):-
        eltern(X,A),
        geschwister(A,Y),
        male(Y).

grossonkel(X,Y):-
        eltern(X,A),
        eltern(A,B),
        geschwister(Y,B),
        male(Y).
        
tante(X,Y):-
        eltern(X,A),
        geschwister(Y,A),
        female(Y).
        
grosstante(X,Y):-
        eltern(X,A),
        eltern(A,B),
        geschwister(Y,B),
        female(Y).
        
enkel(X,Y):-
        male(Y),
        (grossvater(Y,X);
        grossmutter(Y,X)).

enkelin(X,Y):-
        female(Y),
       (grossvater(Y,X);
        grossmutter(Y,X)).