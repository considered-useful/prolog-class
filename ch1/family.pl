% this is a prolog file

% this is a predicate to differentiate terms https://www.swi-prolog.org/pldoc/doc_for?object=dif/2
:- use_module(library(dif)).

male(albert).
male(edward).

female(alice).
female(victoria).

parents(edward, victoria, albert).
parents(alice, victoria, albert).

% this rule means that alice can be a sister of alice.
% this is because 
sister_of(X, Y) :-
	female(X),
	parents(X, M, F),
	parents(Y, M, F).

sister_of_1_4(X, Y) :-
	female(X),
	dif(X, Y),
	parents(X, M, F),
	parents(Y, M, F).
