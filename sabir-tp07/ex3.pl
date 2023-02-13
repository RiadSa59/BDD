% Exercice 3
% Author 1:Riad SABIR

schema([ename,ssn,bdate,address,dnumber,dname,dmgrssn]).
fds([[[ssn],[ename,bdate,address,dnumber]],[[dnumber],[dname,dmgrssn]]]).

minCover:- schema(R), fds(F), mincover(R,F,MinF), write('MinCover: '), write(MinF).

% ?- ['ex3.pl'].
% true.
%
% ?- ['dbd.pl'].
% true.
%
% ?- minCover.
% MinCover: [[[dnumber],[dmgrssn,dname]],[[ssn],[address,bdate,dnumber,ename]]]
% true .

