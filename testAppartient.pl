appartient(X,[X|_]).
appartient(X,[_|L]) :- appartient(X,L).
