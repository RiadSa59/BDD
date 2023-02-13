% Exercice 2
% Author 1: Riad SABIR

schema([ename,ssn,bdate,address,dnumber,dname,dmgrssn]).
fds([[[ssn],[ename,bdate,address,dnumber]],[[dnumber],[dname,dmgrssn]]]).

closure(X) :- schema(R),fds(F),xplus(R,F,X,Xplus), write(X), write('⁺ = '), write(Xplus).


% Exécution
% ?- ['ex2.pl'].
% true.
% 
% ?- closure([ssn]).
% {[ssn]}⁺ = [address,bdate,dmgrssn,dname,dnumber,ename,ssn]
% true.
% 
% ?- ['exercices/ex2.pl'].
% true.
% 
% ?- closure([ssn]).
% [ssn]⁺ = [address,bdate,dmgrssn,dname,dnumber,ename,ssn]
% true.
% 
% ?- closure([dnumber]).
% [dnumber]⁺ = [dmgrssn,dname,dnumber]
% true.
% 
% ?- closure([dnumber, ssn]).
% [dnumber,ssn]⁺ = [address,bdate,dmgrssn,dname,dnumber,ename,ssn]
% true.
% 
