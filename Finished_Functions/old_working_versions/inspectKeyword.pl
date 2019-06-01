% test with: inspectKeyword('hello there'-2,A,B).




% Import pairWordsWithPoints.pl file
:- [pairWordsWithPoints].




processPhrase(Phrase,PhrasePoints,KeywordsList,KeywordsPointsList) :-
	write('Base is a phrase!'),
	tokenize_atom(Phrase,PhraseComponents),
	length(PhraseComponents,NumberOfWords),
	WordPoints is PhrasePoints/NumberOfWords,
	pairWordsWithPoints(PhraseComponents,WordPoints,GeneratedKeywords,GeneratedKeywordsPoints),
	
	% Both the initial Keyword phrase and the new Keyword words
	% that were generated must now be added to the KeywordsList list.
	append([Phrase],GeneratedKeywords,KeywordsList),
	
	% Both the initial Keyword phrase POINTS and the new generated words POINTS
	% that were calculated must now be added to the KeywordsPointsList list.
	append([PhrasePoints],GeneratedKeywordsPoints,KeywordsPointsList).




% inspectKeyword() gets a keyword as input and returns 2 seperate Lists as a result.
% The first list contains the keywords that were generated during the inspection (including
% any extra words, if the keyword inspected was a phrase), while the second list contains the points 
% associated with every word.

inspectKeyword(Keyword,KeywordResult,PointsResult) :-
	% Determine whether the keyword has points associated with it 
	% (whether the keyword is a keyword-points pair)
	( pairs_keys_values([Keyword],KeywordBaseList,PointsList)
	
	% If Keyword is found to be a keyword-points pair
	-> write('Keyword is of keywords-points form!'),
	[Base|_] = KeywordBaseList,
	[Points|_] = PointsList,
	nl,
	write(Base),
	nl,
	% Check if Base is a word or a phrase
	( sub_string(case_insensitive,' ',Base)
	
	% If Base is found to be a phrase
	-> processPhrase(Base,Points,KeywordsList,KeywordsPointsList),
	KeywordResult = KeywordsList,
	PointsResult = KeywordsPointsList
	
	
	% Else, if Base is found to be a word
	; write('Base is a word!'),
	nl,
	% The initial word is added to the KeywordResult List.
	KeywordResult = [Base],
	
	% The initial word points are added to the PointsResult list.
	PointsResult = [Points]
	)
	
	
	% Else, if keyword is found to not contain any points 
	% associated with it
	; write('Keyword has no points associated with it'),
	
	Base = Keyword,
	Points = 1,
	
	% Check if Base is a word or a phrase
	( sub_string(case_insensitive,' ',Base)
	% If Base is found to be a phrase
	-> processPhrase(Base,Points,KeywordsList,KeywordsPointsList),
	KeywordResult = KeywordsList,
	PointsResult = KeywordsPointsList
	
	
	% Else, if Base is found to be a word
	; write('Base is a word!'),
	nl,
	% The initial word is added to the KeywordResult List.
	KeywordResult = [Base],
	
	% The initial word points are added to the PointsResult list.
	PointsResult = [Points]
	)	
	
	).