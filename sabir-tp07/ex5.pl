% Exercice 5
% Author 1: Riad SABIR

schema([a,b,c,d,e,f,g,h,i,j]).

fds([ [[a,b],[c]], [[b,d],[e,f]], [[b],[f]],
      [[f],[g,h]], [[d],[i,j]] ]).

key(K) :- schema(R),fds(F), candkey(R,F,K).


threeNF(R3NF) :- schema(R), fds(F), threenf(R,F,R3NF).

% 
% ?- ['ex5.pl'].
% true.
% 
% ?- key(K).
% K = [a, b, d] ;
% false.
% 
% ?- threeNF(R3NF).
% R3NF = [[a, b, c], [b, f], [b, d, e], [d, i, j], [f, g, h], [a, b, d]] .
% 
