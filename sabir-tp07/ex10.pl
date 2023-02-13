% Exercice 10
% Author 1: Riad SABIR


schema([a,b,c,d,e,f,g,h,i,j]).

fds([ [[a,b],[c]], [[b,d],[e,f]], [[b],[f]],
      [[f],[g,h]], [[d],[i,j]] ]).

  % goodKey(X) - returns all the candidate keys
goodKey(X) :- schema(R), fds(F), candkey(R,F,X).

minCover :- schema(R), fds(F), mincover(R,F,MinF), write('MinCover: '), write(MinF).

threeNF(R3NF) :- schema(R), fds(F), threenf(R,F,R3NF).



% Execution
% 
% ?- ['ex10.pl'].
% true.
% 
% ?- goodKey(X).
% X = [a, b, d] ;
% false.
% 
% ?- minCover.
% MinCover: [[[a,b],[c]],[[b],[f]],[[b,d],[e]],[[d],[i,j]],[[f],[g,h]]]
% true .
% 
% ?- threeNF(R3NF).
% R3NF = [[a, b, c], [b, f], [b, d, e], [d, i, j], [f, g, h], [a, b, d]] .
% 
