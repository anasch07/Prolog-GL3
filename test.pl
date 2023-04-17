
mawjoud(X,[X|_]).
mawjoud(X,[_|L]) :- mawjoud(X,L).

% example of mawjoud
% ?- mawjoud(1,[1,2,3,4,5,6,7,8,9,10]).

% calculate length of a list
longueur([],N) :- N is 0.
longueur([_|L],N) :- longueur(L,N1) , N is N1+1 .

% test longueur of a list
% ?- longueur([1,2,3,4,5],N).

% concat two list
concat([],L,L).
concat([X|L1],L2,[X|L3]) :- concat(L1,L2,L3).

% test concat of two list
% ?- concat([1,2,3],[4,5,6],L).




element_pairs([],L) :- L = [].
element_pairs([X|L],[X|LR]) :-  X mod 2 =:= 0, element_pairs(L,LR).
element_pairs([X|L],LR) :- X mod 2 =\=0 , element_pairs(L,LR).




% test element_pairs
% ?- element_pairs([1,2,3,4,5,6,7,8,9,10],L).


% Définir un prédicat début(liste, liste) donnant tous les débuts d’une liste. Par exemple,
% début([1,5,9], L) donne :
% L=[]
% L=[1]
% L=[1 ,5]
% L=[1,5,9]

debut(_,[]).
debut([X|L],[X|LR]) :- debut(L,LR).

% reverse a list

reverse([],[]).
reverse([X|L],LR) :- reverse(L,LR1) , concat(LR1,[X],LR).

% other version of reverse

nreverse([],L,L).
% nreverse([X|L],LR,Acc) :- nreverse(L,LR,[X|Acc]).
% nreverse(L,LR) :- nreverse(L,LR,[]).

nreverse([X|L],LT,LR):- nreverse(L,[X|LT],LR).
nreverse(L,LR):- nreverse(L,[],LR).

% nreverse([X|Xs],Ys,L) :- nreverse(Xs,[X|Ys],L).
% nreverse(Xs,Ys):- nreverse(Xs,[],Ys).

% example nrverse
% nreverse([1,2,3,4,5],L).


% efface un element d une liste



efface([],_,LT,LT). 
efface([X|L],E,LT,LR) :- X =:= E , concat(LT,L,LR) ,efface(L,E,LT,LR).
efface([X|L],E,LT,LR) :- X =\= E , concat(LT,[X],LT1) , efface(L,E,LT1,LR).
efface(L,E,LR) :- efface(L,E,[],LR).

% example efface
% efface([1,2,3,4,5,6,7,8,9,10],5,L).

% fonction insere que insere un element dans les tous les positions d une liste

insere(X,L,[X|L]).
insere(X,[Y|L],[Y|LR]) :- insere(X,L,LR).

% example insere
% insere(1,[2,3,4,5,6],L).


% tous les permuations d une liste

permutation([],[]).
permutation([X|L],LR) :- permutation(L,LR1) , insere(X,LR1,LR).


% example permutation
% permutation([1,2,3,4,5],L).


% findall example

chiffre(0).
chiffre(1).
chiffre(2).
chiffre(3).
chiffre(4).
chiffre(5).
chiffre(6).
chiffre(7).
chiffre(8).
chiffre(9).

solution(X) :- chiffre(X), X mod 2 =:= 0.

findall(X,solution(X),_).

% example findall
% findall(X,solution(X),_).

% bagof use case

parent(jean,marc).
parent(jean,marie).
parent(marie,jean).
parent(marie,marc).
parent(marie,luc).
parent(marc,luc).
parent(marc,jean).

% bagof(X,parent(X,marc),_).