%test with: combineWordsAndPoints(['car','plane'],4,Result).

combineWordsAndPoints([],_,_).
combineWordsAndPoints([H|T],Points,ResultList) :-
	%******************* WIP ************************
	string_concat(H,'-',TempString),
	string_concat(TempString,Points,WordWithPoints),
	write(WordWithPoints),
	%[WordWithPoints|RT] = ResultList,
	combineWordsAndPoints(T,Points,ResultList).
	
