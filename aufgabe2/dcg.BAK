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
 k: Konjunktion
*/


start :-
        writeln("Bitte Frage eingeben: "),
        read_sentence(Frage),
        frage(Frage, []).

% Ergaenzungsfrage (Wer [Verb] [Artikel] [Nomen] von [Name]?)
frage -->
        i,
        vp(_, Sem, _),
        pp(Name, Sem),
        [?],
        {
        findall(A, call(Sem, Name, A), Z),
        (
        length(Z,0), keine_loesung; %keine Loesung
        length(Z,1), ergaenz_antwort(Sem,Name,Z); %eine Loesung
        ergaenz_antwort_pl(Sem,Name,Z) %mehrere Loesungen
        )}.
        
% Entscheidungsfrage 1 (Ist [Name1] [Nomen] von [Name2]?)
frage -->
        vp(_, Sem, Num),
        np(Name1,_,Num),
        np(Name2,Sem,Num),
        [?],
        {
        entsch_antwort(Sem,Name2,Name1)
        }.
        
% Entscheidungsfrage 2 (Sind [Name1] und [Name2] [Nomen]?)
frage -->
        vp(_, Sem, Num),
        np(Name1,_,Num),
        np(Name2,Sem,Num),
        [?],
        {
        entsch_antwort(Sem,Name2,Name1)
        }.

keine_loesung() :-
        write("Keine Loesung gefunden.").

ergaenz_antwort(Sem,Name,[Res]) :-
        lex(Nomen,Sem,n,Num,Gen),
        lex(Artikel,_,a,Num,Gen),
        lex(Praep,_,p,Num,Gen),
        lex(Verb,_,v,Num,Gen),
        write(Artikel), write(" "), write(Nomen), write(" "), write(Praep), write(" "), write(Name), write(" "), write(Verb), write(" "), write(Res), writeln(".").

ergaenz_antwort_pl(Sem,Name,ResList) :-
        lex(Nomen,Sem,n,pl,Gen),
        lex(Artikel,_,a,pl,Gen),
        lex(Praep,_,p,pl,Gen),
        lex(Verb,_,v,pl,Gen),
        write(Artikel), write(" "), write(Nomen), write(" "), write(Praep), write(" "), write(Name), write(" "), write(Verb), write(" "), print_ResList(ResList).
        
print_ResList([X,Y|[]]) :-
        write(X), write(" "), write("und "), write(Y), writeln(".").
        
print_ResList([X|Rest]) :-
        write(X), write(", "), print_ResList(Rest).

entsch_antwort(Sem,Name1,Name2) :-
        (call(Sem,Name2,Name1),
        writeln("Ja."));
        writeln("Nein.").


vp(_, _, Num) -->
         v(Num).
         
vp(Name, Sem, Num) -->
         v(Num),
         np(Name, Sem, Num).
         
np(Name, _, _) -->
         pn(Name).
         
np(_, Sem, Num) -->
         a(Num, Gen),
         n(Sem, Num, Gen).

np(Name, Sem, Num) -->
         a(Num, Gen),
         n(Sem, Num, Gen),
         pp(Name, Sem).

np(Name, Sem, Num) -->
         k,
         pn(Name),
         n(Sem, Num, Gen).
         
pp(Name, Sem) -->
         p,
         np(Name, Sem, _).

a(Num,Gen) --> [X], {lex(X,_,a,Num,Gen)}.
i --> [X], {lex(X,_,i,_,_)}.
v(Num) --> [X], {lex(X,_,v,Num,_)}.
p --> [X], {lex(X,_,p,_,_)}.
pn(Name) --> [Name], {lex(Name,_,pn,_,_)}.
n(Sem, Num, Gen) --> [X], {lex(X,Sem,n,Num,Gen)}.
k --> [X], {lex(X,_,k,_,_)}.