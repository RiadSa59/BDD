% Exercice 1
% Author 1: Riad SABIR

% Two functional dependency sets F and G are 
% equivalent if and only if F⁺=G⁺


schema([a,b,c,d,e,h]).
fds1([ [[a],[c]], [[a,c],[d]], [[e],[a,d]], 
       [[e],[h]]]).
fds2([[[a],[c,d]], [[e], [a,h]]]).

are_equiv:- schema(R), fds1(F1), fds2(F2), implies(R, F1, F2).

% Execution 
% ?- ['ex1.pl'].
% ?- are_equiv.
% true.
