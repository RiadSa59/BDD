% Exercice 4
% Author 1: Riad SABIR

schema([a,b,c,d,e,f,g,h,i,j]).

fds([ [[a,b],[c]], [[a],[d,e]], [[b],[f]],
      [[f],[g,h]], [[d],[i,j]] ]).

key(K) :- schema(R),fds(F), candkey(R,F,K).


threeNF(R3NF) :- schema(R), fds(F), threenf(R,F,R3NF).


% ?- key(K).
% Key: [a, b] ;
%
% ?- ['ex4.pl'].
% true.
% 
% ?- key(K).
% K = [a, b] ;
% false.
% 
% ?- threeNF(R3NF).
% R3NF = [[a, d, e], [a, b, c], [b, f], [d, i, j], [f, g, h]] .
