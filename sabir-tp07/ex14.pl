% Exercice 14
% Author 1: Riad SABIR
%


schema([m,y,p,mp,c]).

fds([[[m],[mp]],[[m,y],[p]],[[mp],[c]]]).

decomp([[m,y,p],[m,mp,c]]).



checkKey(K) :- schema(R), fds(F), candkey(R,F,K).

is3nf(R) :- schema(R), fds(F), is3NF(R,F).

isbcnf(R) :- schema(R), fds(F), isBCNF(R,F).

isLossless(D) :- schema(R), fds(F), decomp(D), ljd(R,F,D).

% 
% Execution
% 
% ?- checkKey([m]).
% false.
% 
% ?- checkKey([m,y]).
% true .
% 
% ?- checkKey([m,c]).
% false.
% 
% ?- is3nf(R).
% false.
% 
% ?- isbcnf(R).
% false.
% 
% ?- isLossless(D).
% [[a,1],[a,2],[a,3],[a,4],[a,5]]
% [[a,1],[b,2,2],[b,2,3],[a,4],[a,5]]
% 
% D = [[m, y, p], [m, mp, c]] ;
% false.
% 
