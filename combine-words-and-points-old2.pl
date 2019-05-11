
combine([X],Points,Result) :-
	string_concat(X,'-',TempString),
	string_concat(TempString,Points,WordWithPoints),
	NewResultElement = [WordWithPoints],
	Result = NewResultElement.

combine([H|T],Points,Result) :-
	combine(T,Points,ResultOfRest),
	string_concat(H,'-',TempString),
	string_concat(TempString,Points,WordWithPoints),
	NewResultElement = [WordWithPoints],
	append(NewResultElement,ResultOfRest,Result).
	
main() :-
	combine(['car','plane'],4,Results),
	write(Results).