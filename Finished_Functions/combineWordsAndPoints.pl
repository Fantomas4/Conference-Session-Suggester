%test with: combineWordsAndPoints(['car','plane','train','human','object'],4,Results).

combineWordsAndPoints([X|[]],Points,Result) :-
	string_concat(X,'-',TempString),
	string_concat(TempString,Points,WordWithPoints),
	NewResultElement = [WordWithPoints],
	Result = NewResultElement.

combineWordsAndPoints([H|T],Points,Result) :-
	combineWordsAndPoints(T,Points,ResultOfRest),
	string_concat(H,'-',TempString),
	string_concat(TempString,Points,WordWithPoints),
	NewResultElement = [WordWithPoints],
	append(NewResultElement,ResultOfRest,Result),

	% Use cut to stop the program from backtracking thus
	% giving unwanted/incorrect solutions.
	!.
	

