% Exercice 12b
% Author 1: Riad SABIR


schema([courseno,secno,offeringdept,credithours,courselevel,instructorssn,semester,year,dayshours,roomno,noofstudents]).
fds([ [[courseno],[offeringdept,credithours,courselevel]],
      [[courseno,secno,semester,year],[dayshours,roomno,noofstudents,instructorssn]],
      [[roomno,dayshours,semester,year],[instructorssn,courseno,secno]]]).


goodKey(X) :- schema(R), fds(F), candkey(R,F,X).

threeNF(R3NF) :- schema(R), fds(F), threenf(R,F,R3NF).

toBCNF(S) :- schema(R),fds(F), bcnf(R,F,S).


% Execution
% 
% ?- ['ex12b.pl'].
% true.
% 
% ?- goodKey(X).
% X = [semester, year, dayshours, roomno] ;
% X = [courseno, secno, semester, year] ;
% false.
% 
% ?- threeNF(R3NF).
% R3NF = [[courseno, courselevel, credithours, offeringdept], [courseno, secno, semester, year, dayshours, noofstudents, roomno], [roomno, dayshours, semester, year, courseno, instructorssn|...]] .
% 
% ?- toBCNF(S).
% Scheme to decompose = [courseno,secno,offeringdept,credithours,courselevel,instructorssn,semester,year,dayshours,roomno,noofstudents] Offending FD: [courseno]-->[courselevel,credithours,offeringdept]
% Final Result is: 
% [courseno,secno,instructorssn,semester,year,dayshours,roomno,noofstudents]
% [courseno,courselevel,credithours,offeringdept]
% 
% S = [[courseno, secno, instructorssn, semester, year, dayshours, roomno, noofstudents], [courseno, courselevel, credithours, offeringdept]] ;
% Scheme to decompose = [courseno,secno,offeringdept,credithours,courselevel,instructorssn,semester,year,dayshours,roomno,noofstudents] Offending FD: [courseno,secno]-->[courselevel,credithours,offeringdept]
% Final Result is: 
% [courseno,secno,instructorssn,semester,year,dayshours,roomno,noofstudents]
% [courseno,secno,courselevel,credithours,offeringdept]
% 
% S = [[courseno, secno, instructorssn, semester, year, dayshours, roomno, noofstudents], [courseno, secno, courselevel, credithours, offeringdept]] 
% 
% 
