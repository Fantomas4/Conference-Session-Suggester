%generateFinalKeywordList(InitialKeywordList,FinalKeywordList)
% test input for this : generateFinalKeywordList(['hello there', 'nice', 'car', 'very big cat', 'm m m m m']).

combineWordsAndPoints([X|[]],Points,Result) :-
	%write('%%%%%%point1-start'),
	string_concat(X,'-',TempString),
	string_concat(TempString,Points,WordWithPoints),
	NewResultElement = [WordWithPoints],
	Result = NewResultElement,
	%write('%%%%%%point1-end').

combineWordsAndPoints([H|T],Points,Result) :-
	%write('%%%%%%point2-start'),
	combineWordsAndPoints(T,Points,ResultOfRest),
	string_concat(H,'-',TempString),
	string_concat(TempString,Points,WordWithPoints),
	NewResultElement = [WordWithPoints],
	append(NewResultElement,ResultOfRest,Result),
	% Use cut to stop the program from backtracking thus
	% giving unwanted/incorrect solutions.
	%write('%%%%%%point2-end'),!.


getLastElement([X],X).
getLastElement([_|L],X) :- getLastElement(L,X).
	

generateFinalKeywordList([],_).
generateFinalKeywordList([KH|KT],FinalKeywordList) :-
	tokenize_atom(KH,KeywordComponents),
	length(KeywordComponents,TestLen),
	write(TestLen),
	nl,
	( sub_string(case_insensitive,' ',KH)
	%Keyword is a phrase
	-> write('Keyword is a phrase'),
	getLastElement(KeywordComponents,LastElement),
	( number(LastElement)
	%Last element is a number
	-> write('Last element is a number'),
	%PhrasePoints = W
	abs(LastElement,PhrasePoints),
	length(KeywordComponents,TempLen),
	%NumberOfWords = N and is equal to the length of the KeywordComponents minus the points component
	NumberOfWords is TempLen - 1,
	WordPoints is PhrasePoints/NumberOfWords,

	%******************* WIP ************************
	%******************* WIP ************************


	%Last element is NOT a number
	; write('Last element is NOT a number'),
	%No points are provided, so we take the default points assigned to a phrase, which is 1
	PhrasePoints is 1,
	%NumberOfWords = N and is equal to the length of the KeywordComponents
	length(KeywordComponents,NumberOfWords),
	WordPoints is PhrasePoints/NumberOfWords,
	
	%******************* WIP ************************
	
	)
	%Keyword is a single word
	; write('Keyword is a single word'),
	append(KH,FinalKeywordList,NewFinalKeywordList).
	),
	nl,
	write(NewFinalKeywordList),
	nl,
	nl,
	generateFinalKeywordList(KT,NewFinalKeywordList).