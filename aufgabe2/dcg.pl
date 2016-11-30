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
        Call =.. [SemNP,SemPP, X],
        findall(X, call(Call), Z),
        (
        length(Z,0), keine_loesung; %keine Loesung
        length(Z,1), ergaenz_antwort(SemNP,SemPP,Z); %eine Loesung
        ergaenz_antwort_pl(SemNP,SemPP,Z)) %mehrere Loesungen
        }.
        
% Entscheidungsfrage 1 (ist william der bruder von john?)
frage -->
        vp(_SemVP,_SemNP,_SemPP,Num,Gen),
        np(SemNP1,_SemPP1,Num,Gen),
        np(SemNP2,SemPP2,Num,Gen),
        [?],
        {
        Call =.. [SemNP2,SemPP2,SemNP1],
        (call(Call),
        writeln("Ja."));
        writeln("Nein.")
        }.
        
% Entscheidungsfrage 2 (wie viele brueder hat jack?)
frage -->
      a(_SemA),
      pr(_SemPr,Num),
      vp(_SemVP,SemNP1,_SemPP1,Num,Gen),
      np(SemNP2,_SemPP2,Num,Gen),
      [?],
      {
      Call =.. [SemNP1,SemNP2,X],
      findall(X, call(Call), Z),
      (length(Z,0), entsch_antwort(0,SemNP1,SemNP2,Z); %keine Loesung
      length(Z,1), entsch_antwort(1,SemNP1,SemNP2,Z); %eine Loesung
      entsch_antwort(2,SemNP1,SemNP2,Z)) %mehrere Loesungen
      }.

vp(SemVP,_SemNP,_SemPP,Num,_Gen) -->
         v(SemVP,Num).

vp(SemVP,SemNP,SemPP,Num,Gen) -->
         v(SemVP,Num),
         np(SemNP,SemPP,Num,Gen).
         

vp(SemVP,SemNP,_SemPP,Num,_Gen) -->
         n(SemNP,Num,Gen),
         v(SemVP,Num).
         
np(SemNP,_SemPP,_Num,_Gen) -->
         pn(SemNP).
         
np(SemNP,_SemPP,Num,Gen) -->
         det(_SemDet,Num,Gen),
         n(SemNP,Num,Gen).
         
np(SemNP,SemPP,Num,Gen) -->
         det(_SemDet,Num,Gen),
         n(SemNP,Num,Gen),
         pp(SemPP,Num,Gen).

pp(SemPP,Num,Gen) -->
         p(_SemP),
         np(SemPP,_SemPP,Num,Gen).

det(SemDet,Num,Gen) --> [X], {lex(X,SemDet,det,Num,Gen)}.
i(SemI,Num) --> [X], {lex(X,SemI,i,Num,_Gen)}.
v(SemV,Num) --> [X], {lex(X,SemV,v,Num,_Gen)}.
p(SemP) --> [X], {lex(X,SemP,p,_Num,_Gen)}.
pn(SemN) --> [X], {lex(X,SemN,pn,_Num,_Gen)}.
n(SemN,Num,Gen) --> [X], {lex(X,SemN,n,Num,Gen)}.
a(SemA) --> [X], {lex(X,SemA,a,_Num,_Gen)}.
pr(SemPr,Num) --> [X], {lex(X,SemPr,pr,Num,_Gen)}.