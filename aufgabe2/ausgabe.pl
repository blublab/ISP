% Autor:
% Datum: 27.11.2016

keine_loesung() :-
        writeln("Keine Loesung gefunden.").

ergaenz_antwort(Sem,Name,[Res]) :-
        lex(Nomen,Sem,n,Num,Gen),
        lex(Artikel,_,det,Num,Gen),
        lex(Praep,_,p,Num,Gen),
        lex(Verb,_,v,Num,Gen),
        write(Artikel), write(" "), write(Nomen), write(" "), write(Praep), write(" "), write(Name), write(" "), write(Verb), write(" "), write(Res), writeln(".").

ergaenz_antwort_pl(Sem,Name,ResList) :-
        lex(Nomen,Sem,n,pl,Gen),
        lex(Artikel,_,det,pl,Gen),
        lex(Praep,_,p,pl,Gen),
        lex(Verb,_,v,pl,Gen),
        write(Artikel), write(" "), write(Nomen), write(" "), write(Praep), write(" "), write(Name), write(" "), write(Verb), write(" "), print_ResList(ResList).

print_ResList([X,Y|[]]) :-
        write(X), write(" und "), write(Y), writeln(".").

print_ResList([X|Rest]) :-
        write(X), write(", "), print_ResList(Rest).
        
entsch_antwort(0,SemNP1,SemNP2,_Z):-
        lex(SemNP1,_,n,_,Gen),
        lex(X,kein,pr,_,Gen),
        write(SemNP2), write(" hat "), write(X), write(" "), writeln(SemNP1).
        
entsch_antwort(1,SemNP1,SemNP2,_Z):-
        lex(SemNP1,_,n,_,Gen),
        lex(X,ein,det,_,Gen),
        write(SemNP2), write(" hat "), write(X), write(" "), writeln(SemNP1).

entsch_antwort(2,SemNP1,SemNP2,Z):-
        length(Z,Anz),
        lex(X,SemNP1,n,pl,_),
        write(SemNP2), write(" hat "), write(Anz), write(" "), writeln(X).