% this is a prolog file

/*1*/ thief(john).

/*2*/ likes(mary, chocolate).
/*3*/ likes(mary, wine).
/*4*/ likes(john, X) :- likes(X, wine).

/*5*/ may_steal(X, Y) :- thief(X), likes(X, Y).
