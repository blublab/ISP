:- consult('stammbaum.pl').
:- consult('readsentence.pl').
:- consult('lex.pl').
:- consult('ausgabe.pl').

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
 k: Konjunktion
*/


start :-
        writeln("Bitte Frage eingeben: "),
        read_sentence(Frage),
        frage(Frage, []).

% Ergaenzungsfrage (wer ist der vater von jack?)
frage -->
        i(_SemI, Num),
        vp(SemVP,SemNP,SemPP,Num,Gen),
        [?],
        {
        solve_ergaenz(SemNP,SemPP)}.
        
% Entscheidungsfrage 1 (ist william der bruder von john?)
frage -->
        vp(_SemVP,_SemNP,_SemPP,Num,Gen),
        np(SemNP1,_SemPP1,Num,Gen),
        np(SemNP2,SemPP2,Num,Gen),
        [?],
        {
        solve_entsch(SemNP1,SemNP2,SemPP2)
        }.
        
% Entscheidungsfrage 2 (wie viele brueder hat jack?)
frage -->
      i(_SemI, Num),
      
        
solve_ergaenz(SemNP,SemPP) :-
        Call =.. [SemNP,SemPP, X],
        findall(X, call(Call), Z),
        (
        length(Z,0), keine_loesung; %keine Loesung
        length(Z,1), ergaenz_antwort(SemNP,SemPP,Z); %eine Loesung
        ergaenz_antwort_pl(SemNP,SemPP,Z)). %mehrere Loesungen
        
solve_entsch(SemNP1,SemNP2,SemPP2) :-
        Call =.. [SemNP2,SemPP2,SemNP1],
        (call(Call),
        writeln("Ja."));
        writeln("Nein.").

vp(SemVP,_SemNP,_SemPP,Num,_Gen) -->
         v(SemVP,Num).

vp(SemVP,SemNP,SemPP,Num,Gen) -->
         v(SemVP,Num),
         np(SemNP,SemPP,Num,Gen).
         
np(SemNP,_SemPP,_Num,_Gen) -->
         pn(SemNP).
         
np(SemNP,_SemPP,Num,Gen) -->
         a(_SemA,Num,Gen),
         n(SemNP,Num,Gen).
         
np(SemNP,SemPP,Num,Gen) -->
         a(_SemA,Num,Gen),
         n(SemNP,Num,Gen),
         pp(SemPP,Num,Gen).

pp(SemPP,Num,Gen) -->
         p(_SemP),
         np(SemPP,_SemPP,Num,Gen).

a(SemA,Num,Gen) --> [X], {lex(X,SemA,a,Num,Gen)}.
i(SemI,Num) --> [X], {lex(X,SemI,i,Num,_)}.
v(SemV,Num) --> [X], {lex(X,SemV,v,Num,_)}.
p(SemP) --> [X], {lex(X,SemP,p,_,_)}.
pn(SemN) --> [X], {lex(X,SemN,pn,_,_)}.
n(SemN,Num,Gen) --> [X], {lex(X,SemN,n,Num,Gen)}.