% this is a prolog file

% this is a predicate to differentiate terms https://www.swi-prolog.org/pldoc/doc_for?object=dif/2
:- use_module(library(dif)).

male(duke).
male(albert).
male(edward).

female(louise).
female(alice).
female(victoria).

% duke of kent, with the inconvenient name of edward
parent(duke, victoria).
% princess of saxe-coburg-saalfeld, with the inconvenient name of victoria
parent(princess, victoria).

parent(ernest, albert).
parent(louise, albert).

parent(albert, edward).
parent(victoria, edward).

parent(albert, alice).
parent(victoria, alice).

/* X is the father of Y */
father(X, Y) :- male(X), parent(X, Y).
/* X is the mother of Y */
mother(X, Y) :- female(X), parent(X, Y).

is_mother(X) :- mother(X, _).
is_father(X) :- father(X, _).
is_son(X) :- parent(_, X).

/* X is the grandfather of Y */
grandpa_of(X, Y) :- parent(Z, Y), father(X, Z).
/* X is the sibling of Y */
sibling(X, Y) :- dif(X, Y), mother(M, X), mother(M, Y), father(F, X), father(F, Y).

/* X is a sister of Y */
sister_of(X, Y) :- sibling(X, Y), female(X).
aunt(X, Y) :- sister_of(X, Z), parent(Z, Y).

