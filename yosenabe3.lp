% Question 3

% -------------------------------------------------
% POSSIBLE MOVES
% -------------------------------------------------

% vertical moves
possible(X,Y,X,YY) :-
    number(X,Y,_),
    area(X,YY,_),
    Y != YY.

% horizontal moves
possible(X,Y,XX,Y) :-
    number(X,Y,_),
    area(XX,Y,_),
    X != XX.

% -------------------------------------------------
% EXACTLY ONE TARGET
% -------------------------------------------------

1 {
    target(X,Y,XX,YY) : possible(X,Y,XX,YY)
} 1 :-
    number(X,Y,_).

% -------------------------------------------------
% EVERY AREA MUST BE USED
% -------------------------------------------------

used(A) :-
    target(_,_,XX,YY),
    area(XX,YY,A).

:- area(_,_,A),
   not used(A).

% -------------------------------------------------
% PATH CELLS
% destination INCLUDED
% -------------------------------------------------

% vertical up
path(X,Y,X,Y2) :-
    target(X,Y,X,YY),
    YY > Y,
    cell(X,Y2),
    Y < Y2,
    Y2 <= YY.

% vertical down
path(X,Y,X,Y2) :-
    target(X,Y,X,YY),
    YY < Y,
    cell(X,Y2),
    YY <= Y2,
    Y2 < Y.

% horizontal right
path(X,Y,X2,Y) :-
    target(X,Y,XX,Y),
    XX > X,
    cell(X2,Y),
    X < X2,
    X2 <= XX.

% horizontal left
path(X,Y,X2,Y) :-
    target(X,Y,XX,Y),
    XX < X,
    cell(X2,Y),
    XX <= X2,
    X2 < X.

% -------------------------------------------------
% DIFFERENT SOURCE NUMBERS
% -------------------------------------------------

different(X1,Y1,X2,Y2) :-
    number(X1,Y1,_),
    number(X2,Y2,_),
    (X1,Y1) != (X2,Y2).

% -------------------------------------------------
% PATHS CANNOT SHARE CELLS
% -------------------------------------------------

:- path(X1,Y1,X,Y),
   path(X2,Y2,X,Y),
   different(X1,Y1,X2,Y2).

#show target/4.