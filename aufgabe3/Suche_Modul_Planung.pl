% Die Schnittstelle umfasst
%   start_description   ;Beschreibung des Startzustands
%   start_node          ;Test, ob es sich um einen Startknoten handelt
%   goal_node           ;Test, ob es sich um einen Zielknoten handelt
%   state_member        ;Test, ob eine Zustandsbeschreibung in einer Liste
%                        von Zustandsbeschreibungen enthalten ist
%   expand              ;Berechnung der Kind-Zustandsbeschreibungen
%   eval-path           ;Bewertung eines Pfades


start_description([
%  block(block5),
%  block(block6),
%  block(block7),
%  on(block1,block6),
%  on(block3,block7),
%  on(block4,block5),
  block(block1),
  block(block2),
  block(block3),
%  block(block4),  %mit Block4
  on(table,block2),
  on(table,block3),
  on(block2,block1),
%  on(table,block4), %mit Block4
  clear(block1),
  clear(block3),
%  clear(block4), %mit Block4
  handempty
  ]).

goal_description([
  block(block1),
  block(block2),
  block(block3),
%  block(block4), %mit Block4
%  on(block4,block2), %mit Block4
  on(table,block3),
  on(table,block1),
%  on(block1,block4), %mit Block4
  on(block1,block2), %ohne Block4
  clear(block3),
  clear(block2),
  handempty
  ]).



start_node((start,_,_)).

goal_node((_,State,_)):-
%  "Zielbedingungen einlesen"
   goal_description(Goal),
%  "Zustand gegen Zielbedingungen testen".
   mysubset(Goal,State).


% Aufgrund der Komplexität der Zustandsbeschreibungen kann state_member nicht auf
% das Standardprädikat member zurückgeführt werden.
%
state_member(_,[]):- !,fail.

state_member(State,[FirstState|_]):-
%  "Test, ob State bereits durch FirstState beschrieben war. Tipp: Eine
%  Lösungsmöglichkeit besteht in der Verwendung einer Mengenoperation, z.B. subtract"  ,!.
   mysubset(State,FirstState),
   mysubset(FirstState,State),
   !.

%Es ist sichergestellt, dass die beiden ersten Klauseln nicht zutreffen.
state_member(State,[_|RestStates]):-
  %"rekursiver Aufruf".
  state_member(State,RestStates).


eval_path(informed,[(_,State,Value)|RestPath]):-
%  eval_state(State,"Rest des Literals bzw. der Klausel"
   length(RestPath,G),
   eval_state(State,H),
%  "Value berechnen".
   Value is G+H+1.

eval_path(_,[(_,State,Value)|RestPath]):-
%  eval_state(State,"Rest des Literals bzw. der Klausel"
   eval_state(State,H),
%  "Value berechnen".
   Value is H.

eval_state(State,Value):-
   h(komplex,State,H),
   Value is H.

h(simple,State,Value):- % zählt alle blöcke an falscher position
   goal_description(Goal),
   subtract(Goal, State, ToDo),
   length(ToDo,Value).
   
h(komplex,State,Value):-
   goal_description(Goal),
   subtract(State, Goal, Rest),
   calcCosts(Rest,Goal,H),
   Value is H.

calcCosts([],_,0).

calcCosts([Cond|RestCond],Goal,Cost):-
   calcCosts(RestCond,Goal,RestCost),
   (Cond=clear(X),member(on(table,X),Goal) -> H is 1; %Block ist frei und soll auf Tisch
   Cond=clear(X),member(on(X,_),Goal) -> H is 1; %Block ist frei und ein anderer soll rauf
   Cond=ontable(_) -> H is 1; %Block ist auf Tisch, soll aber nicht dort sein
   Cond=on(X,Y),member(on(X,Z),Goal),Y\=Z -> H is 2; %Z soll auf X sein, aber Y ist auf X
   H is 0), 
   Cost is RestCost+H.

action(pick_up(X),
       [handempty, clear(X), on(table,X)],
       [handempty, clear(X), on(table,X)],
       [holding(X)]).

action(pick_up(X),
       [handempty, clear(X), on(Y,X), block(Y)],
       [handempty, clear(X), on(Y,X)],
       [holding(X), clear(Y)]).

action(put_on_table(X),
       [holding(X)],
       [holding(X)],
       [handempty, clear(X), on(table,X)]).

action(put_on(Y,X),
       [holding(X), clear(Y)],
       [holding(X), clear(Y)],
       [handempty, clear(X), on(Y,X)]).


% Hilfskonstrukt, weil das PROLOG "subset" nicht die Unifikation von Listenelementen
% durchführt, wenn Variablen enthalten sind. "member" unifiziert hingegen.
%
mysubset([],_).
mysubset([H|T],List):-
  member(H,List),
  mysubset(T,List).


expand_help(State,Name,NewState):-
%  "Action suchen"
   action(Name, Conditions, DelList, AddList),
%  "Conditions testen"
   mysubset(Conditions,State),
%  "Del-List umsetzen"
   subtract(State, DelList, TmpState),
%  "Add-List umsetzen".
   append(TmpState,AddList,NewState).

expand((_,State,_),Result):-
  findall((Name,NewState,_),expand_help(State,Name,NewState),Result).

