%lex(Wort, Semantik, Wortart, Numerus, Genus)

% === Interrogativpronomen ===
lex(wer,wer,i,_,_).

% === Artikel ===
%Sg
lex(der,der,det,sg,m).
lex(des,des,det,sg,m).
lex(die,die,det,sg,f).
lex(das,das,det,sg,n).
lex(einen,ein,det,sg,m).
lex(eine,ein,det,sg,f).

%Pl
lex(die,die,det,pl,_).

% === Verben ===
lex(ist,sein,v,sg,_).
lex(sind,sein,v,pl,_).
lex(hat,haben,v,_,_).

% === Nomen ===

lex(eltern,eltern,n,pl,f).

lex(ehemann,ehemann,n,sg,m).
lex(ehemaenner,ehemann,n,pl,m).

lex(ehefrau,ehefrau,n,sg,f).
lex(ehefrauen,ehefrau,n,pl,f).

lex(vater,vater,n,sg,m).
lex(vaeter,vater,n,pl,m).

lex(mutter,mutter,n,sg,f).
lex(muetter,mutter,n,pl,f).

lex(geschwister,geschwister,n,pl,f).

lex(kind,kind,n,sg,n).
lex(kinder,kind,n,pl,n).

lex(sohn,sohn,n,sg,m).
lex(soehne,sohn,n,pl,m).

lex(tochter,tochter,n,sg,f).
lex(toechter,tochter,n,pl,f).

lex(bruder,bruder,n,sg,m).
lex(brueder,bruder,n,pl,m).

lex(schwester,schwester,n,sg,f).
lex(schwestern,schwester,n,pl,f).

lex(grossvater,grossvater,n,sg,m).

lex(grossmutter,grossmutter,n,sg,f).

lex(cousin,cousin,n,sg,m).
lex(cousins,cousin,n,pl,m).

lex(cousine,cousine,n,sg,f).
lex(cousinen,cousine,n,pl,f).

lex(neffe,neffe,n,sg,m).
lex(neffen,neffe,n,pl,m).

lex(nichte,nichte,n,sg,f).
lex(nichten,nichte,n,pl,f).

lex(halbschwester,halbschwester,n,sg,f).
lex(halbschwestern,halbschwester,n,pl,f).

lex(onkel,onkel,n,sg,m).
lex(onkel,onkel,n,pl,m).

lex(grossonkel,grossonkel,n,sg,m).
lex(grossonkel,grossonkel,n,pl,m).

lex(tante,tante,n,sg,f).
lex(tanten,tante,n,pl,f).

lex(grosstante,grosstante,n,sg,f).
lex(grosstanten,grosstante,n,pl,f).

lex(enkel,enkel,n,_,m).

lex(enkelin,enkelin,n,sg,f).
lex(enkelinnen,enkelin,n,pl,f).

% === Praeposition ===
lex(von,von,p,_,_).

% === Namen ===

lex(male(X),X,pn,_,m).
lex(female(X),X,pn,_f).

% === Adverb ===
lex(wie,wie,a,_,_).

% === Pronom ===
lex(viele,viel,pr,pl,_).
lex(keinen,kein,pr,sg,m).
lex(keine,kein,pr,sg,f).