% Exercice 7
% Author 1: Riad SABIR

schema([courseno,secno,offeringdept,credithours,courselevel,instructorssn,semester,year,dayshours,roomno,noofstudents]).
fds([ [[courseno],[offeringdept,credithours,courselevel]],
      [[courseno,secno,semester,year],[dayshours,roomno,noofstudents,instructorssn]],
      [[roomno,dayshours,semester,year],[instructorssn,courseno,secno]]]).

  % goodKey(X) - returns all the candidate keys
goodKey(X) :- schema(R), fds(F), candkey(R,F,X).


% decomposes the relation into 3NF relations 
threeNF(R3NF) :- schema(R), fds(F), threenf(R,F,R3NF).


%
% Execution
% ?- ['exercices/ex7.pl'].
% true.
% 
% ?- goodKey(X).
% X = [semester, year, dayshours, roomno] ;
% X = [courseno, secno, semester, year] ;
% false.
%
% ?- goodKey([semester, year, dayshours, roomno]).
% true.
% 
% ?- threeNF(R3NF).
% R3NF = [[courseno, courselevel, credithours, offeringdept], [courseno, secno, semester, year, dayshours, noofstudents, roomno], [roomno, dayshours, semester, year, courseno, instructorssn|...]] .
% 
