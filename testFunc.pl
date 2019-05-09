%generateFinalKeywordList(InitialKeywordList,FinalKeywordList)
% test input for this : generateFinalKeywordList(['hello there', 'nice', 'car', 'very big cat', 'm m m m m']).

getLastElement([X],X).
getLastElement([_|L],X) :- getLastElement(L,X).

generateFinalKeywordList([],_).
generateFinalKeywordList([KH|KT],FinalKeywordList) :-
	tokenize_atom(KH,KeywordComponents),
	length(KeywordComponents,Len),
	write(Len),
	nl,
	( sub_string(case_insensitive,' ',KH)
	-> write('Keyword is a phrase'),
	append([KH],KeywordComponents,KeywordsToAppend),
	append(KeywordsToAppend,FinalKeywordList,NewFinalKeywordList)
	; write('Keyword is a single word'),
	append(KeywordComponents,FinalKeywordList,NewFinalKeywordList)
	),
	nl,
	write(NewFinalKeywordList),
	nl,
	nl,
	generateFinalKeywordList(KT,NewFinalKeywordList).