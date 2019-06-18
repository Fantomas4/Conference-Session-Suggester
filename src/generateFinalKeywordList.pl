
% Import inspectKeyword.pl
:- [inspectKeyword].

% generateFinalKeywordList() gets a list with the initial form of kewyords and 
% returns a list with the final form of keywords and a list with their points
generateFinalKeywordList([],[],[]).	
generateFinalKeywordList([H|T],FinalKeywords,FinalKeywordsPoints) :-
	generateFinalKeywordList(T,KeywordsOfRest,PointsOfRest),
	inspectKeyword(H,KeywordsResult,PointsResult),
	append(KeywordsResult,KeywordsOfRest,FinalKeywords),
	append(PointsResult,PointsOfRest,FinalKeywordsPoints).
	