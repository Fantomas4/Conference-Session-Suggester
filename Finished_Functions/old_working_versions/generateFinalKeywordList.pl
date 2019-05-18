% test with: generateFinalKeywordList([day-4,'general results-1',exceptions,airplane-1,'election vote','general meeting-2'],FinalList).
% generateFinalKeywordList(['day-4','general results-1','exceptions','airplane-1','election vote','general meeting-2'],FinalList).

% Import inspectKeyword.pl
:- [inspectKeyword].


generateFinalKeywordList([],[]).	
generateFinalKeywordList([H|T],FinalList) :-
	generateFinalKeywordList(T,ListOfRest),
	inspectKeyword(H,InspectionResult),
	append(InspectionResult,ListOfRest,FinalList).
	