% Exercice 12
% Author 1: Riad SABIR


schema([a,b,c,d,e]).
fds([[[a,b],[c]], [[c,d],[e]],[[d,e],[e]]]).

goodKey(X) :- schema(R), fds(F), candkey(R,F,X).

threeNF(R3NF) :- schema(R), fds(F), threenf(R,F,R3NF).

toBCNF(S) :- schema(R),fds(F), bcnf(R,F,S).



%
% Execution 
% 
% ?- ['ex12.pl'].
% true.
% 
% ?- goodKey(X).
% X = [a, b, d] ;
% false.
% 
% ?- threeNF(R3NF).
% R3NF = [[a, b, c], [c, d, e], [a, b, d]] ;
% R3NF = [[a, b, c], [c, d, e], [a, b, d]] 
% Unknown action: , (h for help)
% Action? .
% 
% ?- toBCNF(S).
% Scheme to decompose = [a,b,c,d,e] Offending FD: [a,b]-->[c]
% Final Result is: 
% [a,b,d,e]
% [a,b,c]
% 
% S = [[a, b, d, e], [a, b, c]] .
% 
