personne(k,f,85,tunis,professeur,1000).
personne(c,m,63,nabeul,ingenieur,2000).
personne(d,f,60,nabeul,economiste,1500).
personne(e,m,35,tunis,gendarme,1000).
personne(g,f,27,sousse,maitresse,1000).
personne(h,f,39,nabeul,vendeur,1000).
personne(i,m,40,nabeul,boucher,1000).
personne(j,m,17,sousse,etudiant,1000).
personne(1,f,9,sousse,administrateur,1000).
personne(m,f,19,tunis,professeur,1000).
personne(n,m,1,tunis,ingenieur,1000).


% X a la meme profession que Y 
memeProfession(X,Y) :-
    personne(X,_,_,_,Prof,_),
    personne(Y,_,_,_,Prof,_),
    X \= Y.
    
%o X gagne plus que Y
gagnePlus(X,Y) :-
    personne(X,_,_,_,_,SalaireX),
    personne(Y,_,_,_,_,SalaireY),
    SalaireX > SalaireY.
%o X et Y ont des salaires du meme ordre (ne diffèrent pas l un de l autre de plus de 20%)

memeOrdre(X,Y) :-
    personne(X,_,_,_,_,SalaireX),
    personne(Y,_,_,_,_,SalaireY),
    SalaireX - SalaireY < 20,
    SalaireY - SalaireX < 20.


