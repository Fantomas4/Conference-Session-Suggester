% calculateScore([exceptions], [2], X).

% Import sessions.pl
:- [sessions].
 
% calculateScore() gets the FinalKeywords, abstracting head from tail and the FinalKeywordsPoints and returns the ListWithResults which is 
% the list with titles of sessions and their final score
calculateScore([],[],[]).
calculateScore([H2|T2],[H3|T3],ListWithResults):-
	calculateScore(T2,T3,ResultsOfRest),
	
	% get from every session the title X and the list with topics 
	session(X,[H1|T1]),
	write(H1),
	nl,
	session(X,T1).