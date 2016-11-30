% Autor:
% Datum: 27.11.2016

keine_loesung() :-
        writeln("Keine Loesung gefunden.").

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