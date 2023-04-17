personne(k,f,85,tunis).
personne(c,m,63,nabeul).
personne(d,f,60,nabeul).
personne(e,m,35,tunis).
personne(g,f,27,sousse).
personne(h,f,39,nabeul).
personne(i,m,40,nabeul).
personne(j,m,17,sousse).
personne(1,f,9,sousse).
personne(m,f,19,tunis).
personne(n,m,1,tunis).


% who lives in the same city as g?
?- habite_la_meme_ville(X, g).
X = e ;
X = j ;
X = 1.

% who lives in Tunis?
?- habite_e(X, tunis).
X = k ;
X = e ;
X = m ;
X = n.

% who are the minors in the database who live in Tunis?
?- habite_e(X, tunis), mineur(X).
X = n ;
false.

% who are the possible spouses of g?
?- epoux_possible(X, g).
X = c ;
X = i ;
false.

% who are the possible spouses (X,Y) with X living in Tunis?
?- habite_e(X, tunis), epoux_possible(X, Y).
X = k,
Y = m ;
X = k,
Y = n ;
X = m,
Y = n ;
false.








