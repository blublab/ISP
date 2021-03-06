% Abbruch: Eine leere Liste muss nicht bewertet werden
%
eval_paths(_,[]).

% Rekursives Abarbeiten:
% Der erste Pfad wird bewertet (d.h., der erste Knoten des Pfades erh�lt einen Wert), dann rekursiver Aufruf
% f�r die restlichen Pfade.
% eval-path wird anwendungsspezifisch definiert. Es wird eine Bewertung in den Kopfknoten eingetragen.
%
eval_paths(Strategy,[FirstPath|RestPaths]):-
  eval_path(Strategy,FirstPath),
  eval_paths(Strategy,RestPaths).


% Abbruch: Wenn die Liste leer ist, gibt es keine neuen
% Pfade mehr, die einsortiert werden m�ssten. Dann wird
% die Liste der alten Pfade (2. Parameter) auch zur
% Ausgabeliste (3. Parameter)
%
insert_new_paths_informed([],OldPaths,OldPaths).

% Der erste neue Pfad wird in die Liste der alten Pfade einsortiert.
% FirstInserted ist die Ausgabeliste, also die Liste der alten
% Pfade, in die der erste neue Pfad einsortiert wurde.
% Dann rekursiver Aufruf f�r die restlichen neuen Pfade. Die restlichen
% neuen Pfade sollen in die Liste FirstInserted einsortiert werden.
% Ausgabeliste ist dann AllPaths.
%
insert_new_paths_informed([FirstNewPath|RestNewPaths],OldPaths,AllPaths):-
  insert_path_informed(FirstNewPath,OldPaths,FirstInserted),          % Einsortierung eines einzelnen Pfades
  insert_new_paths_informed(RestNewPaths,FirstInserted,AllPaths).

% insert_path_informed sortiert einen einzelnen Pfad in eine Liste von bereits sortierten Pfaden ein.
% Dazu muss die Bewertung des Kopfknotens des einzelnen Pfades mit den Kopfknoten der bereits sortierten
% Pfade verglichen werden.

% Abbruch: Ein neuer Pfad wird in eine leere Liste eingef�gt.
% Ergebnis ist dann eine einelementige Liste
%
insert_path_informed(NewPath,[],[NewPath]).

% Wenn der neue Pfad billiger ist als der erste alte Pfad, dann wird er vorn angef�gt.
% (Die alten Pfade kommen ja bereits sortiert an.) Dieser konstruktive Schritt erfolgt im Kopf der Klausel.
% Wenn cheaper zutrifft, muss die dritte Klausel, die den Fall "not cheaper"
% betrifft, nicht mehr untersucht werden. Deshalb ein Cut.
%
insert_path_informed(NewPath,[FirstPath|RestPaths],[NewPath,FirstPath|RestPaths]):-
  cheaper(NewPath,FirstPath),!.

% Wenn er nicht billiger ist, wird er in den Rest der bereits sortierten Liste einsortiert und der Kopf
% der alten, bereits sortierten Liste bleibt Kopf der neuen Liste.
% Diese Klausel ist der ELSE-Teil, die Klausel davor das IF-THEN.
%
insert_path_informed(NewPath,[FirstPath|RestPaths],[FirstPath|NewRestPaths]):-
  insert_path_informed(NewPath,RestPaths,NewRestPaths).

% Es wird die dritte Komponente des Tripels des jeweils ersten Knotens zweier
% Pfade untersucht. Die dritte Komponente enth�lt die Bewertung des Knotens. Es sollen die beiden Kopfknoten
% zweiter Pfade in ihrer Bewertung verglichen werden.
%
cheaper([(_,_,V1)|_],[(_,_,V2)|_]):-
  V1 =< V2.
