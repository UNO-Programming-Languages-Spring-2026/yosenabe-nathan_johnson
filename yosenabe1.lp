% Question 1
% Move each number in a straight horizontal or vertical line
% into a gray area.

% possible vertical moves
possible(X,Y,X,YY) :-
    number(X,Y,_),
    area(X,YY,_),
    Y != YY.

% possible horizontal moves
possible(X,Y,XX,Y) :-
    number(X,Y,_),
    area(XX,Y,_),
    X != XX.

% choose exactly one target for each number
1 {
    target(X,Y,XX,YY) : possible(X,Y,XX,YY)
} 1 :-
    number(X,Y,_).

#show target/4.