%test with: combineWordsAndPoints(['car','plane','train','human','object'],4,Results).

combineWordsAndPoints([],_,[]).
combineWordsAndPoints([H|T],Points,Result) :-
	combineWordsAndPoints(T,Points,ResultOfRest),
	string_concat(H,'-',TempString),
	string_concat(TempString,Points,WordWithPoints),
	NewResultElement = [WordWithPoints],
	append(NewResultElement,ResultOfRest,Result).

	

