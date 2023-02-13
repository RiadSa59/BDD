% Exercice 6
% Author 1: Riad SABIR

schema([a,b,c,d,e]).
fds([[[a,b],[c]], [[c,d],[e]],[[d,e],[e]]]).

% This relation checks wether X is a candidate key for schema 
% if X is a good key it will be printed on the screen
goodKey(X) :- schema(R), fds(F), candkey(R, F, X), write('Good Key: '), write(X).

% Execution
%
% ?- ['exercices/ex6.pl'].
% true.
% 
% ?- goodKey([a,b]).
% false.
% 
% ?- goodKey([a,b,d]).
% Good Key: [a,b,d]
% true .
% 
