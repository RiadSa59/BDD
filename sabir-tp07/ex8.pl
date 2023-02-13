% Exercice 8
% Author 1: Riad SABIR

schema([propertyid,countyname,lotno,area,price,taxrate]).
fds([ [[propertyid],[countyname,lotno,area,price,taxrate]],
      [[countyname,lotno],[propertyid,area,price,taxrate]],
      [[countyname],[taxrate]],[[area],[price]] ]).

subR([[propertyid,area,lotno],[area,countyname],[area,price],[countyname,taxrate]]).


isLDJ(X) :- schema(R), fds(F), subR(X), ljd(R,F,X).


% Execution
% 
% ?- ['ex8.pl'].
% true.
% 
% ?- isLDJ(X).
% [[a,1],[b,1,2],[a,3],[a,4],[a,5],[b,1,6]]
% [[b,2,1],[a,2],[b,2,3],[a,4],[a,5],[a,6]]
% [[b,3,1],[b,3,2],[b,3,3],[a,4],[a,5],[b,3,6]]
% [[b,4,1],[a,2],[b,4,3],[b,4,4],[b,4,5],[a,6]]
% 
% false.
% 
