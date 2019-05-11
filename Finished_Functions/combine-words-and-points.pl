%test with: combineWordsAndPoints(['car','plane','train','human','object'],4,Results).

combineWordsAndPoints([X|[]],Points,Result) :-
	write('%%%%%%point1-start'),
	string_concat(X,'-',TempString),
	string_concat(TempString,Points,WordWithPoints),
	NewResultElement = [WordWithPoints],
	Result = NewResultElement,
	write('%%%%%%point1-end').

combineWordsAndPoints([H|T],Points,Result) :-
	write('%%%%%%point2-start'),
	combineWordsAndPoints(T,Points,ResultOfRest),
	string_concat(H,'-',TempString),
	string_concat(TempString,Points,WordWithPoints),
	NewResultElement = [WordWithPoints],
	append(NewResultElement,ResultOfRest,Result),
	% Use cut to stop the program from backtracking thus
	% giving unwanted/incorrect solutions.
	write('%%%%%%point2-end'),!.
	

