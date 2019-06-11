
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

% CASE 1:
% Keyword is a keyword-points pair 
% and
% keyword is a word

inspectKeyword(Keyword,KeywordResult,PointsResult) :-
	pairs_keys_values([Keyword],KeywordBaseList,PointsList),
	% The keyword has points associated with it
	
	write('Keyword is of keywords-points form!'),
	[Base|_] = KeywordBaseList,
	[Points|_] = PointsList,
	nl,
	write(Base),
	nl,
	

	not(sub_string(case_insensitive,' ',Base)),
	% Base is found to be a word
	write('Base is a word!'),
	nl,
	% The initial word is added to the KeywordResult List.
	KeywordResult = [Base],
	
	% The initial word points are added to the PointsResult list.
	PointsResult = [Points],
	!.
	


% CASE 2:
% Keyword is a keyword-points pair 
% and
% keyword is a phrase

inspectKeyword(Keyword,KeywordResult,PointsResult) :-
	pairs_keys_values([Keyword],KeywordBaseList,PointsList),
	% The keyword has points associated with it
	
	write('Keyword is of keywords-points form!'),
	[Base|_] = KeywordBaseList,
	[Points|_] = PointsList,
	nl,
	write(Base),
	nl,
	

	sub_string(case_insensitive,' ',Base),
	% Base is found to be a phrase
	processPhrase(Base,Points,KeywordsList,KeywordsPointsList),
	KeywordResult = KeywordsList,
	PointsResult = KeywordsPointsList,
	!.
	



% CASE 3:
% Keyword is NOT a keyword-points pair 
% and
% keyword is a word

inspectKeyword(Keyword,KeywordResult,PointsResult) :-
	not(pairs_keys_values([Keyword],_KeywordBaseList,_PointsList)),
	% The keyword DOES NOT have points associated with it
	write('Keyword has no points associated with it'),
	nl,
	Base = Keyword,
	Points = 1,

	not(sub_string(case_insensitive,' ',Base)),
	% Base is found to be a word
	write('Base is a word!'),
	nl,
	% The initial word is added to the KeywordResult List.
	KeywordResult = [Base],
	
	% The initial word points are added to the PointsResult list.
	PointsResult = [Points],
	!.
	
	

% CASE 4:
% Keyword is NOT a keyword-points pair 
% and
% keyword is a phrase

inspectKeyword(Keyword,KeywordResult,PointsResult) :-
	not(pairs_keys_values([Keyword],_KeywordBaseList,_PointsList)),
	% The keyword DOES NOT have points associated with it
	write('Keyword has no points associated with it'),
	nl,
	Base = Keyword,
	Points = 1,
	
	sub_string(case_insensitive,' ',Base),
	% Base is found to be a phrase
	processPhrase(Base,Points,KeywordsList,KeywordsPointsList),
	KeywordResult = KeywordsList,
	PointsResult = KeywordsPointsList,
	!.
