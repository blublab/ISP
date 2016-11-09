%lex(Wort, Wortart, Sg/Pl, M/W)

% === Interrogativpronomen ===
%M&Sg
lex(welcher, i, sg, m).
lex(welches, i, sg, m).
lex(welchen, i, sg, m).
lex(welchem, i, sg, m).

%W&Sg
lex(welche, i, sg, w).
lex(welcher, i, sg, w).

%M&W&Pl
lex(welche, i, pl, _).
lex(welcher, i, pl, _).
lex(welchen, i, pl, _).

lex(wer, i, _, m).
lex(wessen, i, _, _).

% === Artikel ===
%Sg
lex(der, a, sg, m).
lex(die, a, sg, f).
lex(das, a, sg, n).
lex(ein, ua, sg, m).
lex(eine, a, sg, f).
lex(ein, a, sg, n).
lex(einen, a, sg, m).
%Pl
lex(die, a, pl, _).

% === Verben ===
lex(ist, v, sg, _).
lex(hat, v, sg, _).
lex(sind, v, pl, _).

% === Nomen ===
lex(mutter,n,sg,f).
lex(muetter,n,pl,f).

lex(vater,n,sg,m).
lex(vaeter,n,pl,m).

lex(ehefrau,n,sg,f).
lex(ehefrauen,n,pl,f).

lex(ehemann,n,sg,m).
lex(ehemaenner,n,pl,m).

lex(kind,n,sg,n).
lex(kinder,n,pl,n).

lex(tochter,n,sg,f).
lex(toechter,n,pl,f).

lex(sohn,n,sg,m).
lex(soehne,n,pl,m).

lex(schwester,n,sg,f).
lex(schwestern,n,pl,f).

lex(bruder,n,sg,m).
lex(brueder,n,pl,m).

lex(halbgeschwister,n,sg,n).
lex(halbgeschwister,n,sg,n).

lex(halbschwester,n,sg,f).
lex(halbschwestern,n,pl,f).

lex(halbbruder,n,sg,m).
lex(halbbrueder,n,pl,m).

lex(oma,n,sg,f).
lex(omas,n,pl,f).

lex(opa,n,sg,m).
lex(opas,n,pl,m).

lex(uroma,n,sg,f).
lex(uromas,n,pl,f).

lex(uropa,n,sg,m).
lex(uropas,n,pl,m).

lex(tante,n,sg,f).
lex(tanten,n,pl,f).

lex(onkel,n,sg,m).
lex(onkel,n,pl,m).

lex(großtante,n,sg,f).
lex(großtanten,n,pl,f).

lex(großonkel,n,sg,m).
lex(großonkel,n,pl,m).

lex(cousine,n,sg,f).
lex(cousinen,n,pl,f).

lex(cousin,n,sg,m).
lex(cousins,n,pl,m).

lex(nichte,n,sg,f).
lex(nichten,n,pl,f).

lex(neffe,n,pl,m).
lex(neffen,n,sg,m).

lex(stiefkind,n,sg,n).
lex(stiefkinder,n,pl,n).

% === Praeposition ===
lex(von, p, _, _).

% === Namen ===
lex(george, pn, sg, m).
lex(jack, pn, sg, m).
