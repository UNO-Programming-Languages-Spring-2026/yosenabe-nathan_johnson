% Question 3

% ------------------------------------
% POSSIBLE TARGETS
% ------------------------------------

possible(X,Y,XX,Y) :-
    number(X,Y,_),
    area(XX,Y,_),
    XX != X.

possible(X,Y,X,YY) :-
    number(X,Y,_),
    area(X,YY,_),
    YY != Y.

% ------------------------------------
% CHOOSE EXACTLY ONE TARGET
% ------------------------------------

1 {
    target(X,Y,XX,YY) : possible(X,Y,XX,YY)
} 1 :-
    number(X,Y,_).

% ------------------------------------
% EVERY AREA USED
% ------------------------------------

used(A) :-
    target(_,_,X,Y),
    area(X,Y,A).

:- area(_,_,A),
   not used(A).

% ------------------------------------
% PATH CELLS
% destination INCLUDED
% source EXCLUDED
% ------------------------------------

% horizontal right
path(X,Y,X2,Y) :-
    target(X,Y,XX,Y),
    X <= X2,
    X2 <= XX,
    cell(X2,Y).

% horizontal left
path(X,Y,X2,Y) :-
    target(X,Y,XX,Y),
    XX <= X2,
    X2 <= X,
    cell(X2,Y).

% vertical down
path(X,Y,X,Y2) :-
    target(X,Y,X,YY),
    Y <= Y2,
    Y2 <= YY,
    cell(X,Y2).

% vertical up
path(X,Y,X,Y2) :-
    target(X,Y,X,YY),
    YY <= Y2,
    Y2 <= Y,
    cell(X,Y2).

% ------------------------------------
% PATHS CANNOT OVERLAP
% ------------------------------------

:- path(X1,Y1,X,Y),
   path(X2,Y2,X,Y),
   (X1,Y1) != (X2,Y2).

#show target/4.