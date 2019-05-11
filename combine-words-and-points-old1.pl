%test with: combineWordsAndPoints(['car','plane'],4,[]).

% *** WARNING *** ResultList must be initialized as an empty list with
% ResultList = [] before passing it to combineWordsAndPoints, otherwise a list
% with an uninitialized variable occurs

combineWordsAndPoints([],_,_).
combineWordsAndPoints([H|T],Points,ResultList) :-
	%******************* WIP ************************
	string_concat(H,'-',TempString),
	string_concat(TempString,Points,WordWithPoints),
	NewResultElement = [WordWithPoints],
	append(NewResultElement,ResultList,NewResultList),
	write(NewResultList),
	nl,
	combineWordsAndPoints(T,Points,NewResultList).
	
main() :-
	Results = [],
	combineWordsAndPoints(['car','plane'],4,Results),
	write(Results).