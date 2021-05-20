male(bob).
male(tom).
male(jerry).
male(josh).
male(liam).
male(james).
female(lisa).
female(liz).
female(ann).
female(sophia).

parent(bob,tom).
parent(bob,lisa).
parent(tom,liz).
parent(ann,liz).
parent(tom,sophia).
parent(ann,sophia).
parent(josh,liam).
parent(lisa,liam).
parent(josh,james).
parent(lisa,james).

ancestor(X, Y) :- parent(X ,Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
child(X, Y) :- parent(Y, X).
son(X, Y) :- male(X), parent(Y, X).
daughter(X, Y) :- female(X), parent(Y, X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X \= Y.
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \= Y.
uncle(X, Y) :- brother(X, Z), child(Y, Z).
aunt(X, Y) :- sister(X, Z), child(Y, Z).