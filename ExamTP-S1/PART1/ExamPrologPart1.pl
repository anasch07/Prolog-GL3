% Group:
% Salma Seddik
% Naima Attia
% Anas Chaibi
% Med Mongi Saidane

%Exercice 1 :

% 1.
:- dynamic rocher/2.
:- dynamic arbre/2.

% 2.

:- dynamic vache/4.

% 3.
:- dynamic dimitri/2.

% 4.
largeur(16).
hauteur(16).

% 5.
nombre_rochers(2).
nombre_arbres(2).
nombre_vaches(brune, 5).
nombre_vaches(simmental, 4).
nombre_vaches(alpine_herens, 3).

%Exercice 2:

% 1.
occupe(X,Y):- rocher(X,Y).
occupe(X,Y):- arbre(X,Y).
occupe(X,Y):- vache(X,Y,_,_).
occupe(X,Y):- dimitri(X,Y).

% 2.

libre(X,Y):-largeur(L), hauteur(H), repeat,X is random(L),Y is random(H), not(occupe(X,Y)),!.

% 3.
placer_arbres(0).
placer_arbres(Z):-Z>0,libre(X,Y),assert(arbre(X,Y)),M is Z-1,placer_arbres(M).

placer_vaches(_,0).
placer_vaches(R,Z):-Z>0,libre(X,Y),assert(vache(X,Y,R,vivante)),M is Z-1,placer_vaches(R,M).


placer_rochers(0).
placer_rochers(Z):-Z>0,libre(X,Y),assert(rocher(X,Y)),M is Z-1,placer_rochers(M).

placer_dimitri:-libre(X,Y),assert(dimitri(X,Y)).


% 4.
vaches(L) :- findall((X, Y), vache(X, Y, _, _), L).

% 5.
index([L|_], 1, L) :- !.
index([_|R], I, X) :- I>0, I1 is I-1, index(R, I1, X).
creer_zombie:-vaches(L), length(L, N),I is random(N), index(L, I, (X,Y)),retract(vache(X, Y, _, _)),assert(vache(X, Y, _, zombie)).


% le reste est le code prédéfini du jeu

initialisation :-
  nombre_rochers(NR),
  placer_rochers(NR),
  nombre_arbres(NA),
  placer_arbres(NA),
  nombre_vaches(brune, NVB),
  placer_vaches(brune, NVB),
  nombre_vaches(simmental, NVS),
  placer_vaches(simmental, NVS),
  nombre_vaches(alpine_herens, NVH),
  placer_vaches(alpine_herens, NVH),
  placer_dimitri,
  creer_zombie,
  !.

affichage(L, _) :-
  largeur(L),
  nl.

affichage(L, H) :-
  rocher(L, H),
  print('O'),
  L_ is L + 1,
  affichage(L_, H).

affichage(L, H) :-
  arbre(L, H),
  print('T'),
  L_ is L + 1,
  affichage(L_, H).

affichage(L, H) :-
  dimitri(L, H),
  print('D'),
  L_ is L + 1,
  affichage(L_, H).

affichage(L, H) :-
  vache(L, H, brune, vivante),
  print('B'),
  L_ is L + 1,
  affichage(L_, H).
affichage(L, H) :-
  vache(L, H, brune, zombie),
  print('b'),
  L_ is L + 1,
  affichage(L_, H).

affichage(L, H) :-
  vache(L, H, simmental, vivante),
  print('S'),
  L_ is L + 1,
  affichage(L_, H).
affichage(L, H) :-
  vache(L, H, simmental, zombie),
  print('s'),
  L_ is L + 1,
  affichage(L_, H).

affichage(L, H) :-
  vache(L, H, alpine_herens, vivante),
  print('H'),
  L_ is L + 1,
  affichage(L_, H).
affichage(L, H) :-
  vache(L, H, alpine_herens, zombie),
  print('h'),
  L_ is L + 1,
  affichage(L_, H).

affichage(L, H) :-
  \+ occupe(L, H),
  print('.'),
  L_ is L + 1,
  affichage(L_, H).

affichage(H) :-
  hauteur(H).

affichage(H) :-
  hauteur(HMax),
  H < HMax,
  affichage(0, H),
  H_ is H + 1,
  affichage(H_).

affichage :-
  affichage(0),!.



jouer :-
  initialisation,
  tour(0, _).

tour_(_, _) :-
  \+ verification,
  write('Dimitri s\'est fait mordre'),!.
tour_(N, R) :-
  verification,
  M is N + 1,
  tour(M, R).

tour(N, R) :-
  affichage,
  question(R),
  deplacement_joueur(R),
  deplacement_vaches,
  zombification,
  tour_(N, R).
