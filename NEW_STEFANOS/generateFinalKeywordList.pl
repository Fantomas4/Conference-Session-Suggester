% Import inspectKeyword.pl
:- [inspectKeyword].


generateFinalKeywordList([],[],[]).	
generateFinalKeywordList([H|T],FinalKeywords,FinalKeywordsPoints) :-
	generateFinalKeywordList(T,KeywordsOfRest,PointsOfRest),
	inspectKeyword(H,KeywordsResult,PointsResult),
	append(KeywordsResult,KeywordsOfRest,FinalKeywords),
	append(PointsResult,PointsOfRest,FinalKeywordsPoints).
	