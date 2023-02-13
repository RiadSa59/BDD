% Exercice 11b
% Author 1: Riad SABIR

schema([a,b,c,d,e,f,g,h,i,j]).

fds([ [[a,b],[c]], [[b,d],[e,f]], [[b],[f]],
      [[f],[g,h]], [[d],[i,j]] ]).

toBCNF(S) :- schema(R),fds(F), bcnf(R,F,S).


% Execution
% 
% ?- ['ex11b.pl'].
% true.
% 
% ?- toBCNF(S).
% Scheme to decompose = [a,b,c,d,e,f,g,h,i,j] Offending FD: [a]-->[d,e,i,j]
% Scheme to decompose = [a,b,c,f,g,h] Offending FD: [a,c,f]-->[g,h]
% Scheme to decompose = [a,b,c,f] Offending FD: [b]-->[f]
% Final Result is: 
% [a,b,c]
% [a,d,e,i,j]
% [a,c,f,g,h]
% [b,f]
% 
% S = [[a, b, c], [a, d, e, i, j], [a, c, f, g, h], [b, f]] 
% 
