
%*****************WARNING********************
%last() command which is built in SWI-Prolog can be used instead.
getLastElement([X],X).
getLastElement([_|L],X) :- getLastElement(L,X).


getWordsOfPhrase(Components,Result) :-
	% Gets the last element of the Components list,
	% which is always the points associated with the phrase.
	last(Components,Points),
	
	% Deletes the Points element from the Components list
	select(Points,Components,PhraseWords),
	Result = PhraseWords.


% inspectKeyword() gets a keywords and returns it after adding the proper points to it and 
%any extra words, when the keyword is a phrase.
inspectKeyword(Keyword,InspectionResult) :-
	tokenize_atom(Keyword,KeywordComponents),
	length(KeywordComponents,TestLen),
	write(TestLen),
	nl,
	( sub_string(case_insensitive,' ',Keyword)
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
	getWordsOfPhrase(KeywordComponents,WordsOfPhrase),
	combineWordsAndPoints(WordsOfPhrase,WordPoints,WordsWithPoints),
	
	% Both the initial Keyword phrase (in its original state, WITH the points)
	% and the WordsWithPoints that were generated must be now added to the result list.
	append([Keyword],WordsWithPoints,InspectionResult)


	%Last element is NOT a number
	; write('Last element is NOT a number'),
	%No points are provided, so we take the default points assigned to a phrase, which is 1
	PhrasePoints is 1,
	%NumberOfWords = N and is equal to the length of the KeywordComponents
	length(KeywordComponents,NumberOfWords),
	WordPoints is PhrasePoints/NumberOfWords,
	WordsOfPhrase = KeywordComponents,
	combineWordsAndPoints(WordsOfPhrase,WordPoints,WordsWithPoints),
	
	% Both the initial Keyword phrase (in its NEW form, AFTER adding the points at its end)
	% and the WordsWithPoints that were generated must be now added to the result list.
	string_concat(Keyword,'-1',KeywordWithPoints),
	append([KeywordWithPoints],WordsWithPoints,InspectionResult)
	)
	
	
	%Keyword is a single word
	; write('Keyword is a single word'),
	length(Keyword,TestLen),
	( TestLen > 1
	
	% Single word already has points added at its end
	% so it is the result.
	-> InspectionResult = [Keyword]
	
	% Else single word has no points at its end, so we 
	% add the default 1 point and return the word+point as a result
	; string_concat(Keyword,'-1',KeywordWithPoints),
	InspectionResult = KeywordWithPoints
	
	).

	).