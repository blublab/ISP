%lex(Wort, Semantik, Wortart, Numerus, Genus)

% === Interrogativpronomen ===
%M&Sg
lex(welcher,_,i, sg,m).
lex(welches,_,i, sg,m).
lex(welchen,_,i, sg,m).
lex(welchem,_,i, sg,m).

%W&Sg
lex(welche,_,i, sg,w).
lex(welcher,_,i, sg,w).

%M&W&Pl
lex(welche,_,i,pl,_).
lex(welcher,_,i,pl,_).
lex(welchen,_,i,pl,_).

lex(wer,_,i,_,_).
lex(wessen,_,i,_,_).

% === Artikel ===
%Sg
lex(der,_,a,sg,m).
lex(des,_,a,sg,m).
lex(die,_,a,sg,f).
lex(das,_,a,sg,n).
lex(ein,_,a,sg,m).
lex(eine,_,a,sg,f).
lex(ein,_,a,sg,n).
lex(einen,_,a,sg,m).
%Pl
lex(die,_,a,pl,_).

% === Verben ===
lex(ist,sein,v,sg,_).
lex(sind,sein,v,pl,_).

% === Nomen ===
%Nomen
lex(mutter,mutter,n,sg,f).
lex(mütter,mutter,n,pl,f).

lex(vater,vater,n,sg,m).
lex(vaters,vater,n,sg,m).
lex(vaeter,vater,n,pl,m).

lex(eltern,eltern,n,pl,f).

lex(ehefrau,ehefrau,n,sg,f).
lex(ehefrauen,ehefrau,n,pl,f).

lex(ehemann,ehemann,n,sg,m).
lex(ehemaenner,ehemann,n,pl,m).

lex(kind,kind,n,sg,n).
lex(kinder,kind,n,pl,n).

lex(geschwister,geschwister,n,pl,f).

lex(tochter,tochter,n,sg,f).
lex(toechter,tochter,n,pl,f).

lex(sohn,sohn,n,sg,m).
lex(soehne,sohn,n,pl,m).

lex(schwester,schwester,n,sg,f).
lex(schwestern,schwester,n,pl,f).

lex(bruder,bruder,n,sg,m).
lex(brueder,bruder,n,pl,m).

lex(halbgeschwister,halbgeschwister,n,sg,n).
lex(halbgeschwister,halbgeschwister,n,sg,n).

lex(halbschwester,halbschwester,n,sg,f).
lex(halbschwestern,halbschwester,n,pl,f).

lex(halbbruder,halbbruder,n,sg,m).
lex(halbbrueder,halbbruder,n,pl,m).

lex(oma,oma,n,sg,f).
lex(omas,oma,n,pl,f).

lex(opa,opa,n,sg,m).
lex(opas,opa,n,pl,m).

lex(uroma,uroma,n,sg,f).
lex(uromas,uroma,n,pl,f).

lex(uropa,uropa,n,sg,m).
lex(uropas,uropa,n,pl,m).

lex(tante,tante,n,sg,f).
lex(tanten,tante,n,pl,f).

lex(onkel,onkel,n,sg,m).
lex(onkel,onkel,n,pl,m).

lex(grosstante,grosstante,n,sg,f).
lex(grosstanten,grosstante,n,pl,f).

lex(grossonkel,grossonkel,n,sg,m).
lex(grossonkel,grossonkel,n,pl,m).

lex(cousine,cousine,n,sg,f).
lex(cousinen,cousine,n,pl,f).

lex(cousin,cousin,n,sg,m).
lex(cousins,cousin,n,pl,m).

lex(nichte,nichte,n,sg,f).
lex(nichten,nichte,n,pl,f).

lex(neffe,neffe,n,sg,m).
lex(neffen,neffe,n,pl,m).

lex(stiefkind,stiefkind,n,sg,n).
lex(stiefkinder,stiefkind,n,pl,n).

lex(verheiratet,verheiratet,n,pl,n).

% === Praeposition ===
lex(von,_,p,_,_).

% === Namen ===
lex(thomas,thomas,pn,_,m).

lex(john,john,pn,_,m).
lex(william,william,pn,_,m).

lex(jack,jack,pn,_,m).
lex(stephen,stephen,pn,_,m).
lex(george,george,pn,_,m).
lex(james,james,pn,_,m).
lex(richard,richard,pn,_,m).

lex(phillip,phillip,pn,_,m).
lex(steven,steven,pn,_,m).
lex(horace,horace,pn,_,m).
lex(ben,ben,pn,_,m).

lex(alexander,alexander,pn,_,m).

lex(sarah,sarah,pn,_,w).

lex(ann,ann,pn,_,w).
lex(elizabeth,elizabeth,pn,_,w).

lex(fanny,fanny,pn,_,w).
lex(beth,beth,pn,_,w).
lex(linda,linda,pn,_,w).
lex(mary,mary,pn,_,w).

lex(lisa,lisa,pn,_,w).
lex(christine,christine,pn,_,w).
lex(edith,edith,pn,_,w).
lex(caroline,caroline,pn,_,w).
lex(rose,rose,pn,_,w).
lex(ethel,ethel,pn,_,w).

lex(norah,norah,pn,_,w).
